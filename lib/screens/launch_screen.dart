import 'dart:ui';

import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, '/home_screen');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
              child: Image.asset(
                'images/math_launch.jpeg',
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Image.asset(
              'images/Rectangle 36.png',
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Mathematical',
                  style: TextStyle(
                      fontFamily: 'Great Vibes',
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      // backgroundColor: Colors.white
                  ),
                ),
                Text(
                  '       Engineering',
                  style: TextStyle(
                    fontFamily: 'Great Vibes',
                    fontSize: 26,
                    fontWeight: FontWeight.normal,
                    // backgroundColor: Colors.white
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
