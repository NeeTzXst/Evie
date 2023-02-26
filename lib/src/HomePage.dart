//import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps/src/Getdirection.dart';
import 'package:google_maps/src/Timeremininh.dart';
import 'package:google_maps/src/headerDrawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:google_api_headers/google_api_headers.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _Map();
}

const kGoogleApiKey = 'AIzaSyACIHi_JOm4JFO5EuUQWZ-vuQE-_9U8m00';

class _Map extends State<Map> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(13.751524063317138, 100.4927341283359);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Marker> _markers = <Marker>[];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("Error");
    });

    return await Geolocator.getCurrentPosition();
  }

  loadData() {
    getUserCurrentLocation().then(
      (value) async {
        print("My current location");
        print(value.latitude.toString() + " " + value.longitude.toString());

        _markers.add(
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: InfoWindow(title: "My current location"),
          ),
        );

        CameraPosition cameraPosition = CameraPosition(
            zoom: 14, target: LatLng(value.latitude, value.longitude));

        final GoogleMapController controller = await mapController;

        controller
            .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          child: MyheaderDrawer(),
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                child: GoogleMap(
                  myLocationEnabled: true,
                  compassEnabled: false,
                  tiltGesturesEnabled: false,
                  markers: Set<Marker>.of(_markers),
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                  onMapCreated: _onMapCreated,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.blue,
                        size: 45,
                      ),
                      onPressed: () => scaffoldKey.currentState?.openDrawer()),
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    //_handlePressButton();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => GetDirection()),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                        ),
                        Icon(
                          Icons.search,
                          color: Color.fromRGBO(26, 116, 226, 1),
                          size: 30,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Where are you going to ?",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(26, 116, 226, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 15),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3)),
                        ],
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.directions_car,
                          size: 35,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => Timeremining())));
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 135, right: 15),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 3)),
                          ],
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(
                            Icons.notifications,
                            size: 35,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  getUserCurrentLocation().then(
                    (value) async {
                      print("My current location");
                      print(value.latitude.toString() +
                          " " +
                          value.longitude.toString());

                      _markers.add(
                        Marker(
                          markerId: MarkerId("2"),
                          position: LatLng(value.latitude, value.longitude),
                          infoWindow: InfoWindow(title: "My current location"),
                        ),
                      );

                      CameraPosition cameraPosition = CameraPosition(
                          zoom: 14,
                          target: LatLng(value.latitude, value.longitude));

                      final GoogleMapController controller =
                          await mapController;

                      controller.animateCamera(
                          CameraUpdate.newCameraPosition(cameraPosition));
                      setState(() {});
                    },
                  );
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 190, right: 15),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 3)),
                          ],
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(
                            Icons.explore_outlined,
                            size: 35,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
