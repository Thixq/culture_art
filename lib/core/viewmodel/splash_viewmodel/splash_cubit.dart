import 'package:bloc/bloc.dart';
import 'package:culture_art/core/model/object_model.dart';
import 'package:culture_art/core/services/harvard_art_api_services.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit() : super(HomeViewModelLoading());

  void fetchData() async {
    emit(HomeViewModelLoading());
    HarvardArtApiServices _api = HarvardArtApiServices();
    List<ObjectModel> data = await _api.fetchData();
    emit(HomeViewModelLoaded(objects: data));
  }
}
