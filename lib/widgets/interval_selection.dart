import 'package:flutter/material.dart';
import 'package:project2/widgets/custom_text_span.dart';

class IntervalSelection extends StatefulWidget {
  @override
  _IntervalSelectionState createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  var intervals = [
    6,
    8,
    12,
    24,
  ];
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Remind me every',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(width: 10,),
        DropdownButton<int>(
            iconEnabledColor: Color(0xFF3EB16F),
            hint: selected == 0
                ? Text(
                    'Select an interval',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  )
                : null,
            value: selected == 0 ? null : selected,
            items: intervals.map((int value) {
              return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ));
            }).toList(),
          onChanged: (newVal) {
            setState(() {
              selected = newVal;
            });
          },
        ),
        SizedBox(width: 10,),
        Text(selected==1?'hour':'hours', style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),),

        

      ],
    );
  }
}
