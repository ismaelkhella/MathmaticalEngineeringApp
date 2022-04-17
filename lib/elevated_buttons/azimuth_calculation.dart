import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/text_filed_widget.dart';

class AzimuthCalculation extends StatefulWidget {
  const AzimuthCalculation({Key? key}) : super(key: key);

  @override
  _AzimuthCalculationState createState() => _AzimuthCalculationState();
}

class _AzimuthCalculationState extends State<AzimuthCalculation> {
  late TextEditingController _xacontroller;
  late TextEditingController _xbcontroller;
  late TextEditingController _yacontroller;
  late TextEditingController _ybcontroller;
  double result = 0.0;
  double calculate = 0;
  double angle = 0;
  double xa = 0;

  double xb = 0;

  double ya = 0;

  double yb = 0;

  @override
  void initState() {
    super.initState();
    _xacontroller = TextEditingController();
    _xbcontroller = TextEditingController();
    _yacontroller = TextEditingController();
    _ybcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _xacontroller.dispose();
    _xbcontroller.dispose();
    _yacontroller.dispose();
    _ybcontroller.dispose();
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
          'Azimuth calculation',
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
              padding: const EdgeInsets.only(
                right: 45,
                left: 45,
                top: 50,
              ),
              child: Column(
                children: [
                  TextFiledWidget(
                      controller: _xacontroller,
                      textInputType: TextInputType.number,
                      lableText: 'X(a):',
                    maxHeight: 60,
                    maxWidth: 250,
                    minHeight: 40,
                    minWidth: 250,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFiledWidget(
                      controller: _xbcontroller,
                      textInputType: TextInputType.number,
                      lableText: 'X(b):',
                    maxHeight: 60,
                    maxWidth: 250,
                    minHeight: 40,
                    minWidth: 250,

                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFiledWidget(
                      controller: _yacontroller,
                      textInputType: TextInputType.number,
                      lableText: 'y(a):',
                    maxHeight: 60,
                    maxWidth: 250,
                    minHeight: 40,
                    minWidth: 250,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFiledWidget(
                      controller: _ybcontroller,
                      textInputType: TextInputType.number,
                      lableText: 'Y(b):',
                    maxHeight: 60,
                    maxWidth: 250,
                    minHeight: 40,
                    minWidth: 250,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Calculate();
                      angle = 0;
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
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
                          flex: 1,
                          child: Text(
                            ' G_ab',
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
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
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
                  'Note: Cartesian coordinate of the points',
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
      setState(() {
        if (xb > xa && yb < ya) {
          result = equ() + 20;
        } else if (xa == xb && yb < ya) {
          result = equ() + 20;
        } else if (xb < xa && yb < ya) {
          result = equ() + 20;
        } else if (xb < xa && yb > ya) {
          result = equ() + 20;
        } else {
          result = equ();
        }
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
    if (_xacontroller.text.isNotEmpty &&
        _xbcontroller.text.isNotEmpty &&
        _yacontroller.text.isNotEmpty &&
        _ybcontroller.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  double equ() {
    xa = double.parse(_xacontroller.value.text);
    xb = double.parse(_xbcontroller.value.text);
    ya = double.parse(_yacontroller.value.text);
    yb = double.parse(_ybcontroller.value.text);

    double dx = (xb - xa);
    double dy = (yb - ya);
    angle = atan((dx / dy));

    if (xb == xa) {
      angle = pi / 2.0;
      if (yb == ya) {
        angle = 0.0;
      } else if (yb < ya) {
        angle = 3.0 * pi / 2.0;
      }
    } else if (xb > xa && yb > ya) {
      angle = atan(dx / dy);
    } else if (xb > xa && yb < ya) {
      angle = ((pi / 2) + atan(-dy / dx));
    } else if (xb < xa && yb < ya) {
      angle = pi + atan(dx / dy);
    } else if (xb < xa && yb > ya) {
      angle = 3.0 * pi / 2.0 + atan(dy / -dx);
    }
    return (angle * 180 / (pi));
  }
}
