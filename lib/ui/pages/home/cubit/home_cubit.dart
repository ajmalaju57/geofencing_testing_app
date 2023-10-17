// ignore_for_file: depend_on_referenced_packages, prefer_conditional_assignment

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_geofencing/enums/geofence_status.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_app/utils/shared/helper_current_location.dart';
import 'package:easy_geofencing/easy_geofencing.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.context) : super(HomeInitial()) {
    initPage();
  }
  BuildContext context;
  Position? location;
  StreamSubscription<GeofenceStatus>? geofenceStatusStream;
  TextEditingController changeStatus = TextEditingController();
  initPage() async {
    final result = await LocationHelper().getCurrentLocation(context);
    location = result;
    debugPrint(
        "${result?.latitude.toString()}...${result?.longitude.toString()}");
  }

  geofencing() {
    EasyGeofencing.startGeofenceService(
        pointedLatitude: "10.010092",
        pointedLongitude: "76.336313",
        radiusMeter: "200",
        eventPeriodInSeconds: 1);
    if (geofenceStatusStream == null) {
      geofenceStatusStream =
          EasyGeofencing.getGeofenceStream()!.listen((GeofenceStatus status) {
        print("${status.toString()}.....");
        changeStatus.text = status.toString();
        emit(HomeInitial());
      });
    }
  }
}
