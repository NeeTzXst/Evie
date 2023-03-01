// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps/src/Timeremining.dart';
// //import 'package:qr_flutter/qr_flutter.dart';

// class checkOut extends StatefulWidget {
//   const checkOut({super.key});

//   @override
//   State<checkOut> createState() => _checkOutState();
// }

// class _checkOutState extends State<checkOut> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: ((context) => Timeremining()),
//               ),
//             );
//           },
//           child: Icon(
//             Icons.arrow_back,
//             size: 40,
//             color: Color.fromRGBO(26, 116, 226, 1),
//           ),
//         ),
//         title: Text(
//           "Checkout",
//           style: GoogleFonts.montserrat(
//             textStyle: TextStyle(
//               fontSize: 23,
//               fontWeight: FontWeight.w700,
//               color: Color.fromRGBO(26, 116, 226, 1),
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           Center(
//             child: Text(
//               "Scan this QR Code for Checkout",
//               style: GoogleFonts.montserrat(
//                 textStyle: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: Color.fromRGBO(113, 113, 113, 1),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Center(
//             child: Text(
//               "04 Charging Spot",
//               style: GoogleFonts.montserrat(
//                 textStyle: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromRGBO(0, 0, 0, 1),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           // QrImage(
//           //   version: QrVersions.auto,
//           //   data: "data",
//           //   backgroundColor: Colors.blue,
//           //   foregroundColor: Colors.white,
//           //   size: 250,
//           // ),
//         ],
//       ),
//     );
//   }
// }
