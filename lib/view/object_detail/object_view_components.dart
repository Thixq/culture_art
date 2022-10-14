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
          try {
            return CachedNetworkImage(
              imageUrl: images[index].baseimageurl!,
              placeholder: (context, url) =>
                  Lottie.asset('assets/unicorn.json'),
            );
          } catch (e) {
            return Image.network(
                'https://tandoorvietnam.com/wp-content/uploads/woocommerce-placeholder-600x600.png');
          }
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
  const BuildColorPaletteView({required this.colorPallete, Key? key})
      : super(key: key);
  final List<ColorPalette> colorPallete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Device.orientation == Orientation.portrait
              ? (Constant.kInt / 8).h
              : (Constant.kInt / 4).h,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      width: Constant.kInt / 8,
                    ),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: colorPallete.length,
                itemBuilder: (context, index) {
                  int? color = int.tryParse(
                      '0XFF${colorPallete[index].color!.substring(1)}');
                  return Container(
                    width: Constant.kInt.toDouble(),
                    decoration: BoxDecoration(
                      color: Color(color!),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
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
  const BuildInfoWidget({required this.objectModel, Key? key})
      : super(key: key);
  final ObjectModel objectModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Text(
            objectModel.people![0].name!,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 4.sp),
          Text(objectModel.title!,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          Constant.sizedBox,
          Text(
            objectModel.description!,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          Constant.sizedBox,
          BuildInfoDetailWidget(
              title: 'Classification',
              description: objectModel.classification!),
          Constant.sizedBox,
          BuildInfoDetailWidget(
              title: 'Work Type',
              description: objectModel.worktypes![0].worktype!),
          Constant.sizedBox,
          BuildInfoDetailWidget(
              title: 'Technique', description: objectModel.technique!),
          Constant.sizedBox,
          BuildInfoDetailWidget(
              title: 'Division', description: objectModel.division!),
          Constant.sizedBox,
          BuildInfoDetailWidget(
              title: 'Department', description: objectModel.department!),
          Constant.sizedBox,
          BuildInfoDetailWidget(title: 'Date', description: objectModel.dated!),
          Constant.sizedBox,
          BuildInfoDetailWidget(
              title: 'Culture', description: objectModel.culture!),
          BuildInfoObjectWidget(objectNumber: objectModel.objectnumber!),
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
