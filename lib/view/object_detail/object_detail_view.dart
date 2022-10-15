import 'package:culture_art/core/constants/constant.dart';
import 'package:culture_art/core/model/object_model.dart';
import 'package:culture_art/core/services/auth_services/firebase_auth_services.dart';
import 'package:culture_art/view/object_detail/object_view_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ObjectDetailView extends StatelessWidget {
  const ObjectDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ObjectModel objectModel =
        (ModalRoute.of(context)!.settings.arguments as ObjectModel);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuthServices authServices =
                  FirebaseAuthServices(auth: FirebaseAuth.instance);
              authServices.signOut();
              GoogleSignIn().signOut();
            },
            icon: Icon(
              Icons.output_rounded,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
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
              BuildImagePlaceholder(images: objectModel.images!),
              SizedBox(
                height: (Constant.kInt / 4).sp,
              ),
              BuildColorPaletteView(colorPallete: objectModel.colors!),
              BuildInfoWidget(objectModel: objectModel),
            ],
          ),
        ),
      ),
    );
  }
}
