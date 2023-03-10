import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps/src/HomePage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps/map/locationDes.dart';

class GetDirection extends StatefulWidget {
  const GetDirection({super.key});

  @override
  State<GetDirection> createState() => _GetDirectionState();
}

class _GetDirectionState extends State<GetDirection> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _currenText = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = "122344";
  List<dynamic> _placesList = [];
  bool _isVisible = true;
  bool _textFromfield = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }

    getSuggesion(_controller.text);
  }

  void getSuggesion(String input) async {
    String kPLACES_API_KEY = 'AIzaSyACIHi_JOm4JFO5EuUQWZ-vuQE-_9U8m00';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken&language=multi';

    var response = await http.get(Uri.parse(request));
    //var data = response.body.toString();

    //print("data");
    //print(data);
    //print(response.body.toString());
    if (response.statusCode == 200) {
      setState(() {
        _placesList = jsonDecode(response.body.toString())["predictions"];
      });
    } else {
      throw Exception("Fail to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pop(MaterialPageRoute(builder: ((context) => Home())));
          },
          child: Icon(
            Icons.arrow_back,
            size: 40,
            color: Color.fromRGBO(26, 116, 226, 1),
          ),
        ),
        title: Text(
          "Get Directions",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(26, 116, 226, 1),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: TextFormField(
                controller: _currenText,
                decoration: InputDecoration(
                  hintText: "Where are you heading from?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(107, 207, 255, 0.5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    _isVisible = true;
                    _textFromfield = true;
                  });
                },
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Where are you going to?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(107, 207, 255, 0.5),
                ),
              ),
            ),
            Visibility(
              visible: !_textFromfield,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    print("currnt la  $currentla");
                    print("currnt long $currentlong");
                    print("currnt Location  $currentLo");
                    _currenText.text = currentLo;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.near_me,
                          size: 40,
                          color: Color.fromRGBO(26, 116, 226, 1),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Current station",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !_textFromfield,
              child: Divider(
                color: Color.fromARGB(255, 148, 146, 146),
                height: 15,
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
            ),
            Visibility(
              visible: !_textFromfield,
              child: SizedBox(
                height: 20,
              ),
            ),
            Visibility(
              visible: !_textFromfield,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.map,
                          size: 40,
                          color: Color.fromRGBO(26, 116, 226, 1),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Chose on map",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: Expanded(
                child: ListView.builder(
                  itemCount: _placesList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        onTap: () async {
                          List<Location> locations = await locationFromAddress(
                              _placesList[index]['description']);
                          desla = locations.last.latitude;
                          deslong = locations.last.longitude;
                          desLocation = _placesList[index]['description'];
                          print(
                              "${_placesList[index]['description']} latitude : ${locations.last.latitude}");
                          print(
                              "${_placesList[index]['description']} longitude : ${locations.last.longitude}");
                          setState(() {
                            _controller.text =
                                _placesList[index]['description'];
                            _placesList = [];
                            _isVisible = false;
                            _textFromfield = false;
                          });
                        },
                        title: Text(_placesList[index]['description']),
                      ),
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: !_isVisible,
              child: ElevatedButton(
                onPressed: () {
                  print("desla $desla");
                  print("deslong $deslong");
                  print("desLocation $desLocation");
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => Home()),
                    ),
                  );
                },
                child: Text("Get Direction"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
