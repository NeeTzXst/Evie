import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps/src/HomePage.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
              Navigator.of(context)
                  .pop(MaterialPageRoute(builder: ((context) => Map())));
            },
            child: Icon(
              Icons.arrow_back,
              size: 40,
              color: Color.fromRGBO(26, 116, 226, 1),
            ),
          ),
          title: Text(
            "History",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(26, 116, 226, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
