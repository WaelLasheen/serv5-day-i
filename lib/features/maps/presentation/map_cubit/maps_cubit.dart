import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/maps/domain/usecases/search_places_usecase.dart';
import 'package:day_i/features/maps/presentation/map_cubit/maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final SearchPlacesUseCase _searchPlacesUseCase;

  MapsCubit(this._searchPlacesUseCase) : super(const MapsInitial());

  Future<void> searchPlaces(String query) async {
    if (query.trim().isEmpty) {
      emit(const MapsInitial());
      return;
    }

    emit(const MapsSearchLoading());

    final result = await _searchPlacesUseCase(query);

    result.fold(
      (failure) => emit(MapsSearchFailure(failure.message)),
      (places) => emit(MapsSearchSuccess(places)),
    );
  }

  void clearSearch() {
    emit(const MapsInitial());
  }
}
