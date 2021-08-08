import 'package:flutter/material.dart';

class SelectTime extends StatefulWidget {
  @override
  _SelectTimeState createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  String convertTime(String minutes) {
    if (minutes.length == 1) {
      return "0" + minutes;
    } else {
      return minutes;
    }
  }

  Future<TimeOfDay> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,

    );
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;

      });
    }
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 4),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectTime(context);
              });
            },
            child: Text(
              "Pick Time",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF3EB16F)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),

                ),
              ),
            ),
          ),

        ));
  }
}
