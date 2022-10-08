import 'package:bloc/bloc.dart';
import 'package:culture_art/core/model/object_model.dart';
import 'package:culture_art/core/services/harvard_art_api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit() : super(HomeViewModelInitial());
  HarvardArtApiServices _api = HarvardArtApiServices();
  int pageIndex = 1;
  void fetchData() async {
    if (state is HomeViewModelLoading) return;

    final currentState = state;
    List<ObjectModel> oldObjects = <ObjectModel>[];
    if (currentState is HomeViewModelLoaded) {
      oldObjects = currentState.objects;
    }
    emit(HomeViewModelLoading(oldObjects, isFirstFetch: pageIndex == 1));

    _api.queryFetchData(query: {
      'size': '50',
      'hasimage': '1',
      'page': '$pageIndex',
    }).then((newObjects) {
      pageIndex++;
      List<ObjectModel> objects = (state as HomeViewModelLoading).oldObjects;
      objects.addAll(newObjects);
      emit(HomeViewModelLoaded(objects: objects));
    });
  }
}
