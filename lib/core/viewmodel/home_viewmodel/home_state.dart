part of 'home_cubit.dart';

@immutable
abstract class HomeViewModelState {}

class HomeViewModelInitial extends HomeViewModelState {}

class HomeViewModelLoading extends HomeViewModelState {
  final List<ObjectModel> oldObjects;
  final bool isFirstFetch;

  HomeViewModelLoading(this.oldObjects, {this.isFirstFetch = false});
}

class HomeViewModelLoaded extends HomeViewModelState {
  List<ObjectModel> objects;
  HomeViewModelLoaded({required this.objects});
}

class HomeViewModelError extends HomeViewModelState {}
