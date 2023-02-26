import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({super.key});

  @override
  State<ConvertLatLangToAddress> createState() =>
      _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {
  String stAdress = '', stAdd = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Convert"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(stAdress),
          Text(stAdd),
          GestureDetector(
            onTap: () async {
              List<Location> locations =
                  await locationFromAddress("Gronausestraat 710, Enschede");
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(52.2165157, 6.9437819);

              //final coordinates = new Coordinates(33.6992, 72.9744);

              setState(() {
                stAdress = locations.last.longitude.toString() +
                    " " +
                    locations.last.longitude.toString();
                stAdd = placemarks.reversed.last.country.toString() +
                    " " +
                    placemarks.reversed.last.locality.toString() +
                    " " +
                    placemarks.reversed.last.subAdministrativeArea.toString();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.green),
                child: Center(child: Text("Convert")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
