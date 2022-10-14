import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:culture_art/core/model/object_classification_model.dart';
import 'package:culture_art/core/model/object_culture_model.dart';
import 'package:culture_art/core/services/harvard_art_api_services.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());
  final HarvardArtApiServices _api = HarvardArtApiServices();
  void fetchClassification() async {
    List<ObjectClassificationModel> classificationList = [];
    List<ObjectCultureModel> cultureList = [];
    /*_api
        .fetchFilterData(query: 'classification', size: 63)
        .then((classification) {
      classificationList = (classification.data['records'] as List)
          .map((e) => ObjectClassificationModel.fromJson(e))
          .toList();
    }).whenComplete(() {
      _api.fetchFilterData(query: 'culture', size: 255).then((culture) {
        cultureList = (culture.data['records'] as List)
            .map((e) => ObjectCultureModel.fromJson(e))
            .toList();
      });
    });*/

    Response response =
        await _api.fetchFilterData(query: 'classification', size: 63);
    classificationList = (response.data['records'] as List)
        .map((e) => ObjectClassificationModel.fromJson(e))
        .toList();
    response = await _api.fetchFilterData(query: 'culture', size: 255);
    cultureList = (response.data['records'] as List)
        .map((e) => ObjectCultureModel.fromJson(e))
        .toList();

    emit(
      FetchClassificationFilter(
          classificationList: classificationList, cultureList: cultureList),
    );
  }
}
