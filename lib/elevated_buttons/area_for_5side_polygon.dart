import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/text_filed_widget.dart';

class AreaFor5SidePolygon extends StatefulWidget {
  const AreaFor5SidePolygon({Key? key}) : super(key: key);

  @override
  _AreaFor5SidePolygonState createState() => _AreaFor5SidePolygonState();
}

class _AreaFor5SidePolygonState extends State<AreaFor5SidePolygon> {
  late TextEditingController _xacontroller;
  late TextEditingController _xbcontroller;
  late TextEditingController _xccontroller;
  late TextEditingController _xdcontroller;
  late TextEditingController _xecontroller;
  late TextEditingController _yacontroller;
  late TextEditingController _ybcontroller;
  late TextEditingController _yccontroller;
  late TextEditingController _ydcontroller;
  late TextEditingController _yecontroller;

  double result = 0.0;
  double calculate = 0;


  @override
  void initState() {
    super.initState();
    _xacontroller = TextEditingController();
    _xbcontroller = TextEditingController();
    _xccontroller = TextEditingController();
    _xdcontroller = TextEditingController();
    _xecontroller = TextEditingController();
    _yacontroller = TextEditingController();
    _ybcontroller = TextEditingController();
    _yccontroller = TextEditingController();
    _ydcontroller = TextEditingController();
    _yecontroller = TextEditingController();
  }

  @override
  void dispose() {
    _xacontroller.dispose();
    _xbcontroller.dispose();
    _xccontroller.dispose();
    _xdcontroller.dispose();
    _xecontroller.dispose();
    _yacontroller.dispose();
    _ybcontroller.dispose();
    _yccontroller.dispose();
    _ydcontroller.dispose();
    _yecontroller.dispose();
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
          'Area for 5 side polygon',
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFiledWidget(controller: _xacontroller, textInputType: TextInputType.number, lableText: 'X(a):',  maxHeight: 60,
                            maxWidth: 70,
                            minHeight: 60,
                            minWidth: 70),
                        SizedBox(width: 5,),
                        TextFiledWidget(controller: _xbcontroller, textInputType: TextInputType.number, lableText: 'X(b):',  maxHeight: 60,
                            maxWidth: 70,
                            minHeight: 60,
                            minWidth: 70),
                        SizedBox(width: 5,),
                        TextFiledWidget(controller: _xccontroller, textInputType: TextInputType.number, lableText: 'X(c):',  maxHeight: 60,
                            maxWidth: 70,
                            minHeight: 60,
                            minWidth: 70),
                        SizedBox(width: 5,),
                        TextFiledWidget(controller: _xdcontroller, textInputType: TextInputType.number, lableText: 'X(d):',  maxHeight: 60,
                            maxWidth: 70,
                            minHeight: 60,
                            minWidth: 70),
                        SizedBox(width: 5,),
                        TextFiledWidget(controller: _xecontroller, textInputType: TextInputType.number, lableText: 'X(e):',  maxHeight: 60,
                            maxWidth: 70,
                            minHeight: 60,
                            minWidth: 70),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 70),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFiledWidget(controller: _yacontroller, textInputType: TextInputType.number, lableText: 'Y(a):',  maxHeight: 60,
                            maxWidth: 70,
                            minHeight: 60,
                            minWidth: 70),
                        SizedBox(width: 5,),
                        TextFiledWidget(controller: _ybcontroller, textInputType: TextInputType.number, lableText: 'Y(b):',  maxHeight: 60,
                            maxWidth: 70,
                            minHeight: 60,
                            minWidth: 70),
                        SizedBox(width: 5,),
                        TextFiledWidget(controller: _yccontroller, textInputType: TextInputType.number, lableText: 'Y(c):',  maxHeight: 60,
                            maxWidth: 70,
                            minHeight: 60,
                            minWidth: 70),
                        SizedBox(width: 5,),
                        TextFiledWidget(controller: _ydcontroller, textInputType: TextInputType.number, lableText: 'Y(d):',  maxHeight: 60,
                            maxWidth: 70,
                            minHeight: 60,
                            minWidth: 70),
                        SizedBox(width: 5,),
                       TextFiledWidget(controller: _yecontroller, textInputType: TextInputType.number, lableText: 'Y(e):',  maxHeight: 60,
                           maxWidth: 70,
                           minHeight: 60,
                           minWidth: 70),

                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
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
                    primary: Colors.blueAccent,
                    fixedSize: const Size(230, 48),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            ' Area of triangle ABCDE',
                            style: TextStyle(
                              fontSize: 17,
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
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 150,
                  width: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Text('The calculate result:'),
                      const Text('S(ABCDE)='),
                      const Text("V=(xa * yb) + (xb * yc) + (xc * yd) + (xd * ye)"),
                      const Text('V\'=(xb * ya) + (xc * yb) + (xd * yc) + (xe * yd)'),
                      const Text('S=|V-V\'|/2'),

                      Text('=${calculate}')
                    ],
                  ),
                ),
              ],
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
      calculate = equ();
      setState(() {
        result = calculate;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar('Calculated!', Colors.green),
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
        _xccontroller.text.isNotEmpty &&
        _xdcontroller.text.isNotEmpty &&
        _xecontroller.text.isNotEmpty &&
        _yacontroller.text.isNotEmpty &&
        _ybcontroller.text.isNotEmpty &&
        _yccontroller.text.isNotEmpty &&
        _ydcontroller.text.isNotEmpty &&
        _yecontroller.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  double equ() {
    double xa = double.parse(_xacontroller.value.text);
    double xb = double.parse(_xbcontroller.value.text);
    double xc = double.parse(_xccontroller.value.text);
    double xd = double.parse(_xdcontroller.value.text);
    double xe = double.parse(_xdcontroller.value.text);
    double ya = double.parse(_yacontroller.value.text);
    double yb = double.parse(_ybcontroller.value.text);
    double yc = double.parse(_yccontroller.value.text);
    double yd = double.parse(_ydcontroller.value.text);
    double ye = double.parse(_ydcontroller.value.text);
    double v1 = (xa * yb) + (xb * yc) + (xc * yd) + (xd * ye);
    double v2 = (xb * ya) + (xc * yb) + (xd * yc) + (xe * yd);
    double s = (v1 - v2).abs() / 2.abs();
    return s;
  }
}
