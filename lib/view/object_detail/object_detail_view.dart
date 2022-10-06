import 'package:culture_art/core/constants/constant.dart';
import 'package:culture_art/core/model/object_model.dart';
import 'package:culture_art/core/services/harvard_art_api_services.dart';
import 'package:culture_art/view/object_detail/object_view_components.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ObjectDetailView extends StatelessWidget {
  ObjectDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ObjectModel _objectModel =
        (ModalRoute.of(context)!.settings.arguments as ObjectModel);
    return Scaffold(
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
              BuildImagePlaceholder(images: _objectModel.images!),
              SizedBox(
                height: (Constant.kInt / 4).sp,
              ),
              BuildColorPaletteView(colorPallete: _objectModel.colors!),
              BuildInfoWidget(objectModel: _objectModel),
            ],
          ),
        ),
      ),
    );
  }
}
