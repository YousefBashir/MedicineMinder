import 'package:flutter/material.dart';
import 'package:project2/Helpers/DbHelper.dart';
import 'package:project2/models/Medicine.dart';
import 'package:project2/widgets/medicine_type.dart';

import '../card.dart';

class TestHomeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3EB16F),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF3EB16F),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(50, 27),
                  bottomRight: Radius.elliptical(50, 27),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Mediminder',
                    style: TextStyle(
                      fontFamily: 'Angel',
                      fontSize: 65,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.green.shade100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Number of Mediminders',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Neu",
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child:
                   Container(
                      color: Color(0xFFF6F8FC),
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: 12),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: 30,
                        itemBuilder: (BuildContext context, int index) {
                          return  MedicineCardView(iconValue: '0xe900', type: 'panadol', interval: 8);
                        },
                      ),
                    ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: Color(0xFF3EB16F),
        child: Icon(
          Icons.add,
        ),
        onPressed: () {

        },
      ),
    );
  }
}
