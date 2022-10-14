import 'package:culture_art/core/model/object_model.dart';
import 'package:culture_art/core/services/harvard_art_api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit() : super(HomeViewModelInitial());
  final HarvardArtApiServices _api = HarvardArtApiServices();
  int pageIndex = 1;
  bool isFirst = true;

  Map<String, dynamic> query = {
    'size': '50',
    'hasimage': '1',
    'page': '1',
  };
  void fetchData({Map<String, dynamic>? newQuery}) async {
    if (newQuery != null) {
      query.addAll(newQuery);
    }

    query.update('page', (value) => pageIndex);

    if (state is HomeViewModelLoading) return;

    final currentState = state;
    List<ObjectModel> oldObjects = <ObjectModel>[];
    if (currentState is HomeViewModelLoaded) {
      oldObjects = currentState.objects;
    }
    if (pageIndex == 1) {
      oldObjects = [];
    }
    emit(HomeViewModelLoading(oldObjects, isFirstFetch: isFirst));
    isFirst = false;
    _api.queryFetchData(query: query).then((newObjects) {
      pageIndex++;
      List<ObjectModel> objects = (state as HomeViewModelLoading).oldObjects;
      objects.addAll(newObjects);
      emit(HomeViewModelLoaded(objects: objects));
    });
  }
}
