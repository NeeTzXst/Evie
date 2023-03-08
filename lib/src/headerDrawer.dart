import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps/Howtouse/Howtouse.dart';
import 'package:google_maps/src/Eviepotins.dart';
import 'package:google_maps/src/Financialnews.dart';
import 'package:google_maps/src/Helpcenter.dart';
import 'package:google_maps/src/History.dart';
import 'package:google_maps/src/Mycar.dart';
import 'package:google_maps/src/Payment.dart';
import 'package:google_maps/src/Setting.dart';
import 'package:google_maps/src/Profile.dart';
import 'package:google_maps/src/HomePage.dart';

class MyheaderDrawer extends StatefulWidget {
  const MyheaderDrawer({super.key});

  @override
  State<MyheaderDrawer> createState() => _MyheaderDrawerState();
}

class _MyheaderDrawerState extends State<MyheaderDrawer> {
  final drawerMemu = GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(22, 40, 88, 1)));
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[header(context), MenuItems(context)],
      ),
    ));
  }
}

final drawerText = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(26, 116, 226, 1)));

Widget header(BuildContext context) => Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pop(MaterialPageRoute(builder: ((context) => Home())));
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 45,
                  color: Color.fromRGBO(26, 116, 226, 1),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Profile())));
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Color.fromRGBO(119, 173, 255, 1),
                ),
                SizedBox(
                  width: 30,
                ),
                Text("Profile", style: drawerText),
              ],
            ),
          ),
        ],
      ),
    );

Widget MenuItems(BuildContext context) {
  return Container(
      padding: EdgeInsets.only(
        left: 5,
      ),
      child: Wrap(
        runSpacing: -5,
        children: [
          ListTile(
            //leading: Icon(Icons.home),
            title: Text("My Payment Methods", style: drawerText),
            onTap: (() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Payment())));
            }),
          ),
          ListTile(
            //leading: Icon(Icons.home),
            title: Text(
              "My Car",
              style: drawerText,
            ),
            onTap: (() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Mycar())));
            }),
          ),
          ListTile(
            //leading: Icon(Icons.home),
            title: Text(
              "History",
              style: drawerText,
            ),
            onTap: (() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => History())));
            }),
          ),
          ListTile(
            //leading: Icon(Icons.home),
            title: Text(
              "Financial News",
              style: drawerText,
            ),
            onTap: (() {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => Financialnews())));
            }),
          ),
          ListTile(
            //leading: Icon(Icons.home),
            title: Text(
              "Evie Poitns",
              style: drawerText,
            ),
            onTap: (() {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => Eviepoints())));
            }),
          ),
          ListTile(
            //leading: Icon(Icons.home),
            title: Text(
              "Help center",
              style: drawerText,
            ),
            onTap: (() {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => Helpcenter())));
            }),
          ),
          ListTile(
            //leading: Icon(Icons.home),
            title: Text(
              "How to use",
              style: drawerText,
            ),
            onTap: (() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Howtouse())));
            }),
          ),
          ListTile(
            //leading: Icon(Icons.home),
            title: Text(
              "Setting",
              style: drawerText,
            ),
            onTap: (() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Setting())));
            }),
          ),
        ],
      ));
}
