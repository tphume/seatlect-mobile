import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:entity/entity.dart' as entity;
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:meta/meta.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial()) {
    getCurrentLocation();
  }

  Future<void> resetLocation() async {
    emit(LocationInitial());
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      emit(LocationSelected(
          location: entity.Location(
              latitude: position.latitude, longitude: position.longitude),
          address:
              '${placemarks[0].street}, ${placemarks[0].administrativeArea}'));
    } catch (e) {}
  }
}
