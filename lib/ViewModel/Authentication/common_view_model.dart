import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pubfix/global/global_var.dart';

class CommonViewModel {
  getCurrentLocation() async {
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    position = cPosition;
    placeMark =
        await placemarkFromCoordinates(cPosition.latitude, cPosition.longitude);
    Placemark placeMarkVAR = placeMark![0];
    fullAddress =
        "${placeMarkVAR.subThoroughfare} ${placeMarkVAR.thoroughfare},${placeMarkVAR.subLocality} ${placeMarkVAR.locality},${placeMarkVAR.subAdministrativeArea} ${placeMarkVAR.administrativeArea},${placeMarkVAR.postalCode} ${placeMarkVAR.country},";
    print(placeMarkVAR.subThoroughfare);
    return fullAddress;
  }

  /* showSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }*/

  showSnackBar(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Erreur"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
