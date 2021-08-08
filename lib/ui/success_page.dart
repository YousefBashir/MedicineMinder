import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:project2/ui/hometest.dart';


class SuccessPage extends StatefulWidget {
  static final routeName = '/success';
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 3880),
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Home();
                },
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Container(
          child: Center(
            child: FlareActor(
              "assets/animations/Success Check.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: "Untitled",
            ),
          ),
        ),
      ),
    );
  }
}

