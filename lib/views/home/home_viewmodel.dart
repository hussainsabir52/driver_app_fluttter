import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomeViewModel extends IndexTrackingViewModel {

  late Function locationUpdateCallback;
  HomeViewModel(){
    _fetchCurrentLocation();
  }
  LatLng center = LatLng(24.9288488, -119.034556);
  LatLng start = LatLng(24.9288488, 67.034556);
  LatLng end = LatLng(25.9288488, 67.034556);


  _fetchCurrentLocation() async{
    Position pos;
    pos = await Geolocator.getCurrentPosition();
    center = LatLng(pos.latitude, pos.longitude);
    locationUpdateCallback();
  }

}
