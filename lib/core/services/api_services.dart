import 'package:culture_art/core/model/object_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class IApiArtServices {
  Future<dynamic> fetchData();
  Future<dynamic> queryFetchData({Map<String, dynamic>? query});
}
