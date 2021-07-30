import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FlareActor(
          "assets/animations/Success Check.flr",
          animation: 'Untitled',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
