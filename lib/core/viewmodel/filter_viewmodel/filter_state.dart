// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_cubit.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}

class FetchClassificationFilter extends FilterState {
  List<ObjectClassificationModel> classificationList;
  List<ObjectCultureModel> cultureList;
  FetchClassificationFilter({
    required this.classificationList,
    required this.cultureList,
  });
}
