import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/models/Medicine.dart';
import 'package:project2/widgets/medicine_main_info.dart';
import 'package:project2/widgets/medicine_optional_info.dart';

class MediminderDetails extends StatefulWidget {
  Medicine medicine;
  MediminderDetails(this.medicine);
  @override
  _MediminderDetailsState createState() => _MediminderDetailsState();
}

class _MediminderDetailsState extends State<MediminderDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Mediminder Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.30,
            child: Row(
              children: [
                Container(

                  margin: EdgeInsets.only(left: 10, right: 30),
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Icon(
                    IconData(0xe901, fontFamily: "Ic"),
                    color: Color(0xFF3EB16F),
                    size: 180,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      MedicineManinIfo(
                          fieldTitle: 'Medicine Name', fieldInfo: 'Panadol'),
                      MedicineManinIfo(
                          fieldTitle: 'Dosage', fieldInfo: '100 mg'),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MedicineOptionalInfo(
            fieldTitle: 'Medicine Type',
            fieldInfo: 'Pill',
          ),
          MedicineOptionalInfo(
            fieldTitle: 'Dosage Interval',
            fieldInfo: 'Every 8 hours | 3 time(s) a day',
          ),
          MedicineOptionalInfo(
            fieldTitle: 'Start Time',
            fieldInfo: '20.00',
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              height:MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width*0.7,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Delete Mediminder',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary:Color(0xFF3EB16F),
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(60)
                  ),
                    padding: EdgeInsets.all(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
