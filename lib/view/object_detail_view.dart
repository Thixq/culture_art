// ignore_for_file: prefer_const_constructors

import 'package:culture_art/core/constants/constant.dart';
import 'package:culture_art/core/services/harvard_art_api_services.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ObjectDetailView extends StatelessWidget {
  const ObjectDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HarvardArtApiServices().fetchData();
        },
      ),
      appBar: AppBar(
        elevation: 0,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 2.5.h,
            ),
            _buildimageplaceholder(),
            SizedBox(
              height: (Constant.kInt / 4).sp,
            ),
            _buildColorPaletteView(),
            Container(
              margin: EdgeInsets.only(top: 4),
              width: 90.w,
              child: Text(
                'Color Pallete',
                style: Constant.ObjectInfoDetailTitleStyle,
              ),
            ),
            _buildDivider(),
            _buildInfoWidget(),
          ],
        )),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      thickness: 3.sp,
      indent: 16.sp,
      endIndent: 16.sp,
      color: Colors.white70,
    );
  }

  Widget _buildInfoWidget() {
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
            style: Constant.ObjectArtistTitleStyle,
          ),
          SizedBox(height: 4.sp),
          Text('Art Name Art Name Art Name Art Name ',
              style: Constant.ObjectArtTitleStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          Constant.sizedBox,
          Text(
            'Circular tazza on a detachable raised foot chased in high relief with a central medallion inside a husk border depicting Venus and Adonis in a landscape flanked by a putto and three hounds in repoussé; the border chased with four roundels containing putti representing the Four Elements interspersed with a variety of fruits and vegetables also in high relief against a matted ground; the detachable raised foot chased with two scenes of musical figures in landscapes interspersed with similar fruits and vegetables; wrigglework border.',
            style: Constant.ObjectArtDescriptionStyle,
            textAlign: TextAlign.justify,
          ),
          Constant.sizedBox,
          _buildInfoDetailWidget('Classification', 'Prints'),
          Constant.sizedBox,
          _buildInfoDetailWidget('Work Type', 'print'),
          Constant.sizedBox,
          _buildInfoDetailWidget('Technique', 'Engraving'),
          Constant.sizedBox,
          _buildInfoDetailWidget('Division', 'European and American Art'),
          Constant.sizedBox,
          _buildInfoDetailWidget('Department',
              'Department of Paintings, Sculpture & Decorative Arts'),
          Constant.sizedBox,
          _buildInfoDetailWidget('Date', '1993'),
          Constant.sizedBox,
          _buildInfoDetailWidget('Century', '17th century'),
          Constant.sizedBox,
          _buildInfoDetailWidget('Culture', 'Flemish'),
          _buildInfoObjectWidget()
        ],
      ),
    );
  }

  Widget _buildInfoObjectWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 25.sp,
        ),
        Text(
          'Object Number',
          style: Constant.ObjectArtDescriptionStyle,
        ),
        Text(
          '2002.50.95',
          textAlign: TextAlign.start,
          style: Constant.ObjectInfoDetailTitleStyle,
        ),
        SizedBox(
          height: 15.sp,
        )
      ],
    );
  }

  Widget _buildInfoDetailWidget(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Constant.ObjectInfoDetailTitleStyle,
        ),
        Text(
          description,
          style: Constant.ObjectInfoDetailDescriptionStyle,
        ),
      ],
    );
  }

  Widget _buildColorPaletteView() {
    return SizedBox(
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
              color: Colors.black45,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildimageplaceholder() {
    return Container(
      height: Device.orientation == Orientation.portrait ? 40.h : 120.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: Colors.black45,
      ),
    );
  }
}
