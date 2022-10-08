import 'package:cached_network_image/cached_network_image.dart';
import 'package:culture_art/core/model/object_model.dart';
import 'package:culture_art/core/viewmodel/home_viewmodel/home_cubit.dart';
import 'package:culture_art/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class GridLayout extends StatefulWidget {
  const GridLayout({
    Key? key,
    required this.objectList,
  }) : super(key: key);

  final List<ObjectModel> objectList;

  @override
  State<GridLayout> createState() => _GridLayoutState();
}

class _GridLayoutState extends State<GridLayout> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) context.read<HomeViewModelCubit>().fetchData();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * .9);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController
      ..dispose()
      ..removeListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: GridView.custom(
        controller: _scrollController,
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: widget.objectList.length,
          (context, index) {
            return ObjectLayout(
              objectList: widget.objectList,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class ObjectLayout extends StatelessWidget {
  const ObjectLayout({
    Key? key,
    required this.objectList,
    required this.index,
  }) : super(key: key);

  final List<ObjectModel> objectList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.objectDetialView,
            arguments: objectList[index]);
      },
      child: Container(
        color: Colors.white,
        child: ImageLayout(objectList: objectList, index: index),
      ),
    );
  }
}

class ImageLayout extends StatelessWidget {
  const ImageLayout({
    Key? key,
    required this.objectList,
    required this.index,
  }) : super(key: key);

  final List<ObjectModel> objectList;
  final int index;

  @override
  Widget build(BuildContext context) {
    try {
      return CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: '${objectList[index].images![0].baseimageurl}',
        placeholder: (context, url) => Lottie.asset('assets/unicorn.json'),
      );
    } catch (e) {
      return Image.network(
          'https://tandoorvietnam.com/wp-content/uploads/woocommerce-placeholder-600x600.png');
    }
  }
}

class ShimmerLayout extends StatelessWidget {
  const ShimmerLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: 16,
          (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
