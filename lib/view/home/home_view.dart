import 'package:culture_art/core/model/object_classification_model.dart';
import 'package:culture_art/core/model/object_culture_model.dart';
import 'package:culture_art/core/model/object_model.dart';
import 'package:culture_art/core/viewmodel/filter_viewmodel/filter_cubit.dart';
import 'package:culture_art/core/viewmodel/home_viewmodel/home_cubit.dart';
import 'package:culture_art/core/widgets/CustomDropDown.dart';
import 'package:culture_art/route/routes.dart';
import 'package:culture_art/view/home/home_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late FirebaseAuth _firebaseAuth;
  @override
  void initState() {
    super.initState();
    context.read<HomeViewModelCubit>().fetchData();
    context.read<FilterCubit>().fetchClassification();

    _firebaseAuth = FirebaseAuth.instance;
    _firebaseAuth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.loginView, (route) => false);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: BlocConsumer<HomeViewModelCubit, HomeViewModelState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<ObjectModel>? objectList = [];
          if (state is HomeViewModelLoading && state.isFirstFetch) {
            return const ShimmerLayout();
          } else if (state is HomeViewModelLoaded) {
            objectList = state.objects;
          } else if (state is HomeViewModelLoading) {
            objectList = state.oldObjects;
            Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              BlocBuilder<FilterCubit, FilterState>(
                builder: (context, state) {
                  List<ObjectClassificationModel> classificationList = [];
                  List<ObjectCultureModel> cultureList = [];
                  if (state is FetchClassificationFilter) {
                    classificationList = state.classificationList;
                    cultureList = state.cultureList;
                  }
                  return ArtFilters(
                      classificationList: classificationList,
                      cultureList: cultureList);
                },
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridLayout(objectList: objectList)),
              ),
            ],
          );
        },
      ),
    );
  }
}
