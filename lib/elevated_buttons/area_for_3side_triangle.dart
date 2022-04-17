import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/text_filed_widget.dart';

class AreaFor3SideTriangle extends StatefulWidget {
  const AreaFor3SideTriangle({Key? key}) : super(key: key);

  @override
  _AreaFor3SideTriangleState createState() => _AreaFor3SideTriangleState();
}

class _AreaFor3SideTriangleState extends State<AreaFor3SideTriangle> {
  late TextEditingController _xacontroller;
  late TextEditingController _xbcontroller;
  late TextEditingController _xccontroller;
  late TextEditingController _yacontroller;
  late TextEditingController _ybcontroller;
  late TextEditingController _yccontroller;
  double result = 0.0;
  double calculate = 0;

  @override
  void initState() {

    super.initState();
    _xacontroller = TextEditingController();
    _xbcontroller = TextEditingController();
    _xccontroller = TextEditingController();
    _yacontroller = TextEditingController();
    _ybcontroller = TextEditingController();
    _yccontroller = TextEditingController();
  }

  @override
  void dispose() {
    _xacontroller.dispose();
    _xbcontroller.dispose();
    _xccontroller.dispose();
    _yacontroller.dispose();
    _ybcontroller.dispose();
    _yccontroller.dispose();
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
          'Area for 3 side triangle',
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
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFiledWidget(
                            controller: _xacontroller,
                            textInputType: TextInputType.number,
                            lableText: 'X(a):',
                            maxHeight: 60,
                            maxWidth: 90,
                            minHeight: 60,
                            minWidth: 90),
                        SizedBox(width: 5,),
                        TextFiledWidget(
                            controller: _xbcontroller,
                            textInputType: TextInputType.number,
                            lableText: 'X(b):',
                            maxHeight: 60,
                            maxWidth: 90,
                            minHeight: 60,
                            minWidth: 90),
                        SizedBox(width: 5,),
                        TextFiledWidget(
                            controller: _xccontroller,
                            textInputType: TextInputType.number,
                            lableText: 'X(c):',
                            maxHeight: 60,
                            maxWidth: 90,
                            minHeight: 60,
                            minWidth: 90),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFiledWidget(
                            controller: _yacontroller,
                            textInputType: TextInputType.number,
                            lableText: 'Y(a):',
                            maxHeight: 60,
                            maxWidth: 90,
                            minHeight: 60,
                            minWidth: 90),
                        SizedBox(width: 5,),
                        TextFiledWidget(
                            controller: _ybcontroller,
                            textInputType: TextInputType.number,
                            lableText: 'Y(b):',
                            maxHeight: 60,
                            maxWidth: 90,
                            minHeight: 60,
                            minWidth: 90),
                        SizedBox(width: 5,),
                        TextFiledWidget(
                            controller: _yccontroller,
                            textInputType: TextInputType.number,
                            lableText: 'Y(c):',
                            maxHeight: 60,
                            maxWidth: 90,
                            minHeight: 60,
                            minWidth: 90),
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
                  height: 50,
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
                            ' Area of triangle ABC',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.black12,
                            alignment: Alignment.center,
                            height: 50,
                            child: Text(
                              result.toString(),
                              style: const TextStyle(fontSize: 12),
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
                      const Text('S(ABC)='),
                      const Text('xa*(yb - yc)+ xb*(yc - ya)+ xc*(ya - yb)'),
                      Text('=${calculate}')
                    ],
                  ),
                ),
              ],
            ),
          ),

          //
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
        _xccontroller.text.isNotEmpty &&
        _yacontroller.text.isNotEmpty &&
        _ybcontroller.text.isNotEmpty &&
        _yccontroller.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  double equ() {
    double xa = double.parse(_xacontroller.value.text);
    double xb = double.parse(_xbcontroller.value.text);
    double xc = double.parse(_xccontroller.value.text);
    double ya = double.parse(_yacontroller.value.text);
    double yb = double.parse(_ybcontroller.value.text);
    double yc = double.parse(_yccontroller.value.text);
    double s = ((xa * (yb - yc)) + (xb * (yc - ya)) + (xc * (ya - yb))) / 2;
    return s.abs();
  }
}
