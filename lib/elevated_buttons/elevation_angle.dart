import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/text_filed_widget.dart';

class ElevationAngle extends StatefulWidget {
  const ElevationAngle({Key? key}) : super(key: key);

  @override
  _ElevationAngleState createState() => _ElevationAngleState();
}

class _ElevationAngleState extends State<ElevationAngle> {
  late TextEditingController _z1controller;
  late TextEditingController _l3controller;
  late TextEditingController _l1controller;
  double result = 0.0;
  double calculate = 0;

  @override
  void initState() {
    super.initState();
    _z1controller = TextEditingController();
    _l3controller = TextEditingController();
    _l1controller = TextEditingController();
  }

  @override
  void dispose() {
    _z1controller.dispose();
    _l3controller.dispose();
    _l1controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: const Text(
          'Horizontal distance',
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
            imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Image.asset(
              'images/pexels-pixabay-416405.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Column(
                children: [
                  Card(
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Horizontal distance (Elevation angle)',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFiledWidget(
                    controller: _z1controller,
                    textInputType: TextInputType.number,
                    lableText: 'Z:',
                    maxHeight: 60,
                    maxWidth: 250,
                    minHeight: 40,
                    minWidth: 250,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFiledWidget(
                    controller: _l3controller,
                    textInputType: TextInputType.number,
                    lableText: 'L3:',
                    maxHeight: 60,
                    maxWidth: 250,
                    minHeight: 40,
                    minWidth: 250,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFiledWidget(
                    controller: _l1controller,
                    textInputType: TextInputType.number,
                    lableText: 'L1',
                    maxHeight: 60,
                    maxWidth: 250,
                    minHeight: 40,
                    minWidth: 250,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Calculate();
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      fixedSize: const Size(230, 48),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            ' Horizontal distance',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.black12,
                            alignment: Alignment.center,
                            height: 40,
                            child: Text(
                              result.toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 100,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Text('The calculate result:'),
                        const Text('angle = 90+Z'),
                        const Text('Dh=100*(L3-L1)*cos(angle)'),
                        Text('=${calculate}')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: Card(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: const [
                Text(
                  'Note: N.B These three input is from the level device',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Calculate() {
    if (checkData()) {
      calculate = equ();
      setState(() {
        result = calculate;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar('Calculated!', Colors.green)
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
       snackBar('Error,Enter required value!', Colors.red)
      );
    }
  }
  SnackBar snackBar(String snakBarMassage,Color color) {
    return SnackBar(
      content: Text(snakBarMassage),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
    );
  }

  bool checkData() {
    if (_z1controller.text.isNotEmpty &&
        _l3controller.text.isNotEmpty &&
        _l1controller.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  double equ() {
    double z = double.parse(_z1controller.value.text);
    double l3 = double.parse(_l3controller.value.text);
    double l1 = double.parse(_l1controller.value.text);
    double angle = 90 - z;
    double dh = 100 * (l3 - l1) * cos(angle);
    return dh;
  }
}
