import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_maps/Checkout.dart';
import 'package:google_maps/src/HomePage.dart';
import 'package:slide_countdown/slide_countdown.dart';

class Timeremining extends StatefulWidget {
  const Timeremining({super.key});

  @override
  State<Timeremining> createState() => _TimereminingState();
}

class _TimereminingState extends State<Timeremining> {
  Duration _duration = Duration(hours: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: ((context) => Map())));
          },
          child: Icon(
            Icons.arrow_back,
            size: 40,
            color: Color.fromRGBO(26, 116, 226, 1),
          ),
        ),
        title: Text(
          "Time Remining",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(26, 116, 226, 1),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/messageImage_1677661037176.jpg',
                width: 300,
                height: 250,
              ),
            ),
            Container(
              child: Text(
                "Parking time",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: SlideCountdown(
                  duration: _duration,
                  slideDirection: SlideDirection.down,
                  separator: ":",
                  separatorType: SeparatorType.symbol,
                  decoration: BoxDecoration(color: Colors.white),
                  textStyle: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: ((context) => checkOut()),
                //   ),
                // );
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    "Finished",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
