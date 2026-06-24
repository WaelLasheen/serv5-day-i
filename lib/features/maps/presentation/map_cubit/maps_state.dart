import 'package:equatable/equatable.dart';
import 'package:day_i/features/maps/domain/entities/place_entity.dart';

abstract class MapsState extends Equatable {
  const MapsState();

  @override
  List<Object?> get props => [];
}

class MapsInitial extends MapsState {
  const MapsInitial();
}

class MapsSearchLoading extends MapsState {
  const MapsSearchLoading();
}

class MapsSearchSuccess extends MapsState {
  final List<PlaceEntity> places;

  const MapsSearchSuccess(this.places);

  @override
  List<Object?> get props => [places];
}

class MapsSearchFailure extends MapsState {
  final String message;

  const MapsSearchFailure(this.message);

  @override
  List<Object?> get props => [message];
}
