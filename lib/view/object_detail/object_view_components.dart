import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:culture_art/core/constants/constant.dart';
import 'package:culture_art/core/model/object_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuildImagePlaceholder extends StatelessWidget {
  final List<Images> images;
  const BuildImagePlaceholder({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Device.orientation == Orientation.portrait ? 40.h : 120.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (context, index, realIndex) {
          return CachedNetworkImage(
            imageUrl: images[index].baseimageurl!,
            placeholder: (context, url) => Lottie.asset('assets/unicorn.json'),
          );
        },
        options: CarouselOptions(
            disableCenter: true,
            viewportFraction: 1,
            enableInfiniteScroll: false),
      ),
    );
  }
}

class BuildColorPaletteView extends StatelessWidget {
  const BuildColorPaletteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Device.orientation == Orientation.portrait
              ? (Constant.kInt / 8).h
              : (Constant.kInt / 4).h,
          child: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(overscroll: false),
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: Constant.kInt / 8,
              ),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) => Container(
                width: Constant.kInt.toDouble(),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          width: 90.w,
          child: Text(
            'Color Pallete',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Divider(
          thickness: 3.5.sp,
          indent: 16.sp,
          endIndent: 16.sp,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}

class BuildInfoWidget extends StatelessWidget {
  const BuildInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text(
            'Artist Name',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 4.sp),
          Text('Art Name Art Name Art Name Art Name ',
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          Constant.sizedBox,
          Text(
            'Circular tazza on a detachable raised foot chased in high relief with a central medallion inside a husk border depicting Venus and Adonis in a landscape flanked by a putto and three hounds in repoussé; the border chased with four roundels containing putti representing the Four Elements interspersed with a variety of fruits and vegetables also in high relief against a matted ground; the detachable raised foot chased with two scenes of musical figures in landscapes interspersed with similar fruits and vegetables; wrigglework border.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          Constant.sizedBox,
          BuildInfoDetailWidget(title: 'Classification', description: 'Prints'),
          Constant.sizedBox,
          BuildInfoDetailWidget(title: 'Work Type', description: 'print'),
          Constant.sizedBox,
          BuildInfoDetailWidget(title: 'Technique', description: 'Engraving'),
          Constant.sizedBox,
          BuildInfoDetailWidget(
              title: 'Division', description: 'European and American Art'),
          Constant.sizedBox,
          BuildInfoDetailWidget(
              title: 'Department',
              description:
                  'Department of Paintings, Sculpture & Decorative Arts'),
          Constant.sizedBox,
          BuildInfoDetailWidget(title: 'Date', description: '1993'),
          Constant.sizedBox,
          BuildInfoDetailWidget(title: 'Century', description: '17th century'),
          Constant.sizedBox,
          BuildInfoDetailWidget(title: 'Culture', description: 'Flemish'),
          BuildInfoObjectWidget(objectNumber: '2002.34.21'),
        ],
      ),
    );
  }
}

class BuildInfoDetailWidget extends StatelessWidget {
  final String title, description;
  const BuildInfoDetailWidget(
      {required this.title, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class BuildInfoObjectWidget extends StatelessWidget {
  final String objectNumber;
  const BuildInfoObjectWidget({required this.objectNumber, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 25.sp,
        ),
        Text(
          'Object Number',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          objectNumber,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 15.sp,
        )
      ],
    );
  }
}
