import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps/src/HomePage.dart';

class SelectCar extends StatefulWidget {
  const SelectCar({super.key});

  @override
  State<SelectCar> createState() => _SelectCarState();
}

class _SelectCarState extends State<SelectCar> {
  int sum = 50;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(
                MaterialPageRoute(
                  builder: ((context) => Home()),
                ),
              );
            },
            child: Icon(
              Icons.arrow_back,
              size: 40,
              color: Color.fromRGBO(26, 116, 226, 1),
            ),
          ),
          title: Text(
            "Select your Vehicels",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(26, 116, 226, 1),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: sum,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: ListTile(
                  selected: true,
                  leading: Image.asset('assets/tesla.jpg'),
                  title: Text("data"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
