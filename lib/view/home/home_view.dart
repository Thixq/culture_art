import 'package:cached_network_image/cached_network_image.dart';
import 'package:culture_art/core/model/object_model.dart';
import 'package:culture_art/core/viewmodel/splash_viewmodel/splash_cubit.dart';
import 'package:culture_art/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeViewModelCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<HomeViewModelCubit, HomeViewModelState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: GridViewLayout(state: state),
          );
        },
      ),
    );
  }
}

class GridViewLayout extends StatelessWidget {
  GridViewLayout({required this.state, Key? key}) : super(key: key);

  HomeViewModelState state;

  @override
  Widget build(BuildContext context) {
    if (state is HomeViewModelLoaded) {
      List<ObjectModel> objectList = (state as HomeViewModelLoaded).objects;
      return ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
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
            childCount: objectList.length,
            (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.objectDetialView,
                    arguments: objectList[index]);
              },
              child: Container(
                color: Colors.white,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '${objectList[index].images![0].baseimageurl}',
                  placeholder: (context, url) =>
                      Lottie.asset('assets/unicorn.json'),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (state is HomeViewModelLoading) {
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
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.white,
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else {
      debugPrint('Sikinti');
      return Container();
    }
  }
}
