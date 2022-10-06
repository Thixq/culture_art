part of 'splash_cubit.dart';

@immutable
abstract class HomeViewModelState {}

class HomeViewModelInitial extends HomeViewModelState {}

class HomeViewModelLoading extends HomeViewModelState {}

class HomeViewModelLoaded extends HomeViewModelState {
  List<ObjectModel> objects;
  HomeViewModelLoaded({required this.objects});
}

class HomeViewModelError extends HomeViewModelState {}
