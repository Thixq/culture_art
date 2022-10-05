import 'package:culture_art/core/constants/constant.dart';
import 'package:culture_art/core/model/object_model.dart';
import 'package:culture_art/core/services/harvard_art_api_services.dart';
import 'package:culture_art/view/object_detail/object_view_components.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ObjectDetailView extends StatelessWidget {
  ObjectDetailView({Key? key}) : super(key: key);
  List<ObjectModel> models = [];
  late ObjectModel model;

  @override
  Widget build(BuildContext context) {
    HarvardArtApiServices().fetchData().then((value) {
      models = value;
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          model = models[30];
          model.images!.length;
          debugPrint(model.images!.length.toString());
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
              BuildImagePlaceholder(images: model.images!),
              SizedBox(
                height: (Constant.kInt / 4).sp,
              ),
              BuildColorPaletteView(),
              BuildInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
