import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class LocationViewModel extends BaseViewModel {
  GoogleMapController _googleMapController;
  GoogleMapController get googleMapController => _googleMapController;

  onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
    notifyListeners();
  }

  searchandNavigate(String searchAddr){
    try {
      Geolocator().placemarkFromAddress(searchAddr).then((result) {
        _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(
                    result[0].position.latitude, result[0].position.longitude),
                zoom: 10.0)));
      });
    } catch (e) {
      if (e is PlatformException) {
        print(e);
      }
    }

    print(searchAddr);
    notifyListeners();
  }
}
