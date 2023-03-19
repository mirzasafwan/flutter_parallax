import 'package:flutter/material.dart';
// ignore: unused_import
// import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parallax',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String asset;
  double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateThree = 0;
  double rateFour = 0;
  double rateFive = 0;
  double rateSix = 0;
  double rateSeven = 0;
  double rateEight = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            setState(() {
              rateEight -= v.scrollDelta! / 5;
              rateSeven -= v.scrollDelta! / 4.5;
              rateSix -= v.scrollDelta! / 4;
              rateFive -= v.scrollDelta! / 3.5;
              rateFour -= v.scrollDelta! / 3;
              rateThree -= v.scrollDelta! / 2.5;
              rateTwo -= v.scrollDelta! / 2;
              rateOne -= v.scrollDelta! / 1.5;
              rateZero -= v.scrollDelta! / 1;
              // print(rateEight);
            });
          }

          return true;
        },
        child: Stack(
          children: <Widget>[
            ParallaxWidget(top: rateZero, asset: "parallax0"),
            ParallaxWidget(top: rateOne, asset: "parallax1"),
            ParallaxWidget(top: rateTwo, asset: "parallax2"),
            ParallaxWidget(top: rateThree, asset: "parallax3"),
            ParallaxWidget(top: rateFour, asset: "parallax4"),
            ParallaxWidget(top: rateFive, asset: "parallax5"),
            ParallaxWidget(top: rateSix, asset: "parallax6"),
            ParallaxWidget(top: rateSeven, asset: "parallax7"),
            ParallaxWidget(top: rateEight, asset: "parallax8"),
            ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 1,
                  color: Colors.transparent,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 70),
                  color: Color(0xff21002),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Parallax',
                          style:
                              TextStyle(fontSize: 50, color: Color(0xffffaf00)),
                        )
                      ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    Key? key,
    required this.top,
    required this.asset,
  }) : super(key: key);

  final double top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Image.asset(
          "assets/$asset.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
