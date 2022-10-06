import 'package:culture_art/core/model/object_model.dart';
import 'package:culture_art/core/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HarvardArtApiServices extends IApiServices {
  Dio dio = Dio(
    BaseOptions(baseUrl: "https://api.harvardartmuseums.org/"),
  );

  @override
  Future<List<ObjectModel>> fetchData() async {
    try {
      Response response = await dio.get(
        'object?',
        queryParameters: {
          'apikey': '9c97e169-23d7-47bf-b66d-68a1664188bd',
          'size': '50',
          'q': 'Turkish',
          'hasimage': '1',
        },
      );
      List<ObjectModel> FetchedData = (response.data['records'] as List)
          .map((e) => ObjectModel.fromJson(e))
          .toList();
      return FetchedData;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<ObjectModel>> queryFetchData(
      {Map<String, dynamic>? query}) async {
    try {
      Map<String, dynamic>? queryData = {
        'apikey': '9c97e169-23d7-47bf-b66d-68a1664188bd',
      };
      query!.forEach((key, value) {
        queryData[key] = value;
      });
      Response response = await dio.get(
        'object?',
        queryParameters: queryData,
      );
      List<ObjectModel> FetchedData = (response.data['records'] as List)
          .map((e) => ObjectModel.fromJson(e))
          .toList();
      return FetchedData;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
