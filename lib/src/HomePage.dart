import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps/map/locationDes.dart';
import 'package:google_maps/src/Getdirection.dart';
import 'package:google_maps/src/SelectCar.dart';
import 'package:google_maps/src/Timeremining.dart';
import 'package:google_maps/src/headerDrawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

const kGoogleApiKey = 'AIzaSyACIHi_JOm4JFO5EuUQWZ-vuQE-_9U8m00';

class _Home extends State<Home> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(13.751524063317138, 100.4927341283359);

  LatLng _originLocation = LatLng(desla!, deslong!);
  LatLng _destinationLocation = LatLng(currentla, currentlong);

  Set<Polyline> polyline = {};
  List<LatLng> routeCoords = [];
  GoogleMapPolyline _googleMapPolyline =
      new GoogleMapPolyline(apiKey: kGoogleApiKey);

  Map<PolylineId, Polyline> _polylines = <PolylineId, Polyline>{};

  PolylinePoints polylinePoints = PolylinePoints();

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Marker> _markers = <Marker>[];

  Future<void> desinationLocation() async {
    // print("Home desla ${desla}");
    // print("Home deslong ${deslong}");
    // print("Home desLocation ${desLocation}");
    return _markers.add(Marker(
      markerId: MarkerId("0"),
      position: LatLng(desla!, deslong!),
      infoWindow: InfoWindow(title: desLocation!),
    ));
  }

  _getPolylinesWithLocation() async {
    List<LatLng>? _coordinates =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _originLocation,
            destination: _destinationLocation,
            mode: RouteMode.driving);

    setState(() {
      _polylines.clear();
    });
    _addPolyline(_coordinates);
  }

  _addPolyline(List<LatLng>? _coordinates) {
    PolylineId id = PolylineId("1");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.blueAccent,
        points: _coordinates!,
        width: 4,
        onTap: () {});

    setState(() {
      _polylines[id] = polyline;
    });
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("Error");
    });

    return await Geolocator.getCurrentPosition();
  }

  Future<void> loadData() async {
    getUserCurrentLocation().then(
      (value) async {
        print("My current location");
        print(value.latitude.toString() + " " + value.longitude.toString());
        List<Placemark> placemarks =
            await placemarkFromCoordinates(value.latitude, value.longitude);
        Placemark place = placemarks[0];
        String address = "${place.name}, ${place.locality}, ${place.country}";
        print("Current location address: $address");
        print("Desination = " + desLocation.toString());
        print(desla.toString() + " " + deslong.toString());
        currentLo = address;
        currentla = value.latitude;
        currentlong = value.longitude;

        _markers.add(
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: InfoWindow(title: "My current location"),
          ),
        );

        CameraPosition cameraPosition = CameraPosition(
            zoom: 14, target: LatLng(value.latitude, value.longitude));

        final GoogleMapController? controller = await mapController;

        controller
            ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
    desinationLocation();
    _getPolylinesWithLocation();
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
              GoogleMap(
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                compassEnabled: false,
                markers: Set<Marker>.of(_markers),
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                onMapCreated: _onMapCreated,
                polylines: Set<Polyline>.of(_polylines.values),
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => SelectCar())));
                },
                child: Align(
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
                            Icons.notifications_none_outlined,
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
                          zoom: 17,
                          target: LatLng(value.latitude, value.longitude));

                      final GoogleMapController? controller =
                          await mapController;

                      controller?.animateCamera(
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
