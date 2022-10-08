import 'package:culture_art/core/model/object_model.dart';
import 'package:culture_art/core/viewmodel/home_viewmodel/home_cubit.dart';
import 'package:culture_art/view/home/home_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          List<ObjectModel> objectList = [];
          if (state is HomeViewModelLoading && state.isFirstFetch) {
            return const ShimmerLayout();
          } else if (state is HomeViewModelLoaded) {
            objectList = state.objects;
          } else if (state is HomeViewModelLoading) {
            objectList = state.oldObjects;
          }
          return GridLayout(objectList: objectList);
        },
      ),
    );
  }
}
