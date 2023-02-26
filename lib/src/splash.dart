import 'package:flutter/material.dart';
import '../Howtouse/Howtouse.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Howtouse(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/EVIE.png',
            fit: BoxFit.cover,
            width: 300,
          ),
        ),
      ),
    );
  }
}
