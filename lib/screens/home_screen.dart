import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: const Text(
          'Mathematical Engineering',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Playfair Display',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 6,sigmaY: 6),
              child: Image.asset(
            'images/pexels-pixabay-416405.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
          ),),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/valley_angle');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                  ),
                  child: Text('Horizontal distance (Valley angle)'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/elevation_angle');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                  ),
                  child: const Text('Horizontal distance (elevation angle)'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/azimuth_calculation');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                  ),
                  child: const Text('Azimuth calculation'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/area_for_3side_triangle');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                  ),
                  child: Text('Area for 3 side triangle'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/area_for_4side_quadrilateral');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                  ),
                  child: Text('Area for 4 side quadrilateral'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/area_for_5side_polygon');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                  ),
                  child: Text('Area for 5 side polygon'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
