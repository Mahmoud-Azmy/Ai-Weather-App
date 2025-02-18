import 'package:ai_weather_app/features/home/presentation/controllers/get_location_cubit/get_location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState()) {
    // Automatically fetch location on startup
  }

  Future<void> fetchLocation() async {
    try {
      emit(state.copyWith(status: "loading"));

      bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        emit(state.copyWith(status: "Please enable GPS"));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(state.copyWith(status: "Location permission denied"));
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        emit(state.copyWith(
            status: "Permission permanently denied. Enable in settings."));
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        emit(state.copyWith(
          city: place.locality ?? "Unknown City",
          country: place.country ?? "Unknown Country",
          lat: position.latitude.toString(),
          long: position.longitude.toString(),
          status: "success",
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: "Error getting location"));
    }
  }
}
