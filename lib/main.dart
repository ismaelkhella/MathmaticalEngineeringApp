import 'package:flutter/material.dart';
import 'package:matmatical_engineering_app/screens/home_screen.dart';
import 'package:matmatical_engineering_app/screens/launch_screen.dart';

import 'elevated_buttons/area_for_3side_triangle.dart';
import 'elevated_buttons/area_for_4side_quadrilateral.dart';
import 'elevated_buttons/area_for_5side_polygon.dart';
import 'elevated_buttons/azimuth_calculation.dart';
import 'elevated_buttons/elevation_angle.dart';
import 'elevated_buttons/valley_angle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/valley_angle': (context) => const ValleyAngle(),
        '/elevation_angle': (context) => const ElevationAngle(),
        '/azimuth_calculation': (context) => const AzimuthCalculation(),
        '/area_for_3side_triangle': (context) => const AreaFor3SideTriangle(),
        '/area_for_4side_quadrilateral': (context) => const AreaFor4SideQuadrilateral(),
        '/area_for_5side_polygon': (context) => const AreaFor5SidePolygon(),
      },
    );
  }
}
