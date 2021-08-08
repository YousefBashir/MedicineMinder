import 'package:flutter/material.dart';

class MedicineCardView extends StatelessWidget {
  String iconValue;

  //int.parse(iconValue);
  String type;
  int interval;

  MedicineCardView(
      {@required this.iconValue, @required this.type, @required this.interval});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: 80,
                height: 80,
                color: Colors.white70,
                child: Icon(
                  IconData(int.parse(iconValue), fontFamily: "Ic"),
                  color: Color(0xFF3EB16F),
                  size: 70,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                type,
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFF3EB16F),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Every $interval hours',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFC9C9C9),
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
