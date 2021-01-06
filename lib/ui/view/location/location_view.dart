import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:serving_humanity/ui/view/location/location_view_model.dart';
import 'package:serving_humanity/ui/widgets/input_field.dart';
import 'package:stacked/stacked.dart';

class LocationView extends StatelessWidget {
  final TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Stack(
                children: <Widget>[
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(23.0468, 72.5310), zoom: 15),
                    onMapCreated: (GoogleMapController controller) =>
                        model.onMapCreated(controller),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    mapType: MapType.normal,
                    compassEnabled: true,
                  ),
                  Positioned(
                    right: 15.0,
                    left: 15.0,
                    bottom: 30.0,
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: InputField(
                        placeholder: "Enter Address",
                        controller: address,
                        search: true,
                        onTapFunction: () =>
                            model.searchandNavigate(address.text),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        viewModelBuilder: () => LocationViewModel());
  }
}
