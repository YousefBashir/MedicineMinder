import 'package:flutter/material.dart';
import 'package:project2/Helpers/DbHelper.dart';
import 'package:project2/models/Medicine.dart';
import 'package:project2/models/enums/MedicineType.dart';

import 'package:project2/widgets/custom_text_span.dart';
import 'package:project2/widgets/interval_selection.dart';
import 'package:project2/widgets/medicine_type.dart';

class MediminderEntryDetails extends StatefulWidget {
  @override
  _MediminderEntryDetailsState createState() => _MediminderEntryDetailsState();
}

class _MediminderEntryDetailsState extends State<MediminderEntryDetails> {
  String name;
  String dosage;
  String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.green,
        ),
        centerTitle: true,
        title: Text(
          'Add New Mediminder',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          children: [
            TextFormTitle(
              title: 'Medicine Name',
              isRequired: true,
            ),
            TextFormField(
              maxLength: 12,
              style: TextStyle(
                fontSize: 16,
              ),
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              onChanged: (value){
                name= value;
              },
            ),
            TextFormTitle(
              title: 'Dosage in mg',
              isRequired: true,
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 16,
              ),
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              onChanged: (value){
                dosage=value;
              },
            ),
            TextFormTitle(
              title: 'Medicine type',
              isRequired: false,
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MedicineTypeView(
                  name: 'Bottle',
                  medicineType: MedicineType.Bottle,
                  iconValue: 0xe900,
                  isSelected: false,
                ),
                MedicineTypeView(
                  name: 'Pill',
                  medicineType: MedicineType.Pill,
                  iconValue: 0xe901,
                  isSelected: false,
                ),
                MedicineTypeView(
                  name: 'Syringe',
                  medicineType: MedicineType.Syringe,
                  iconValue: 0xe902,
                  isSelected: false,
                ),
                MedicineTypeView(
                  name: 'Tablet',
                  medicineType: MedicineType.Tablet,
                  iconValue: 0xe903,
                  isSelected: false,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            TextFormTitle(title: 'Interval Selection', isRequired: true),
            SizedBox(
              height: 10,
            ),
            IntervalSelection(),
            TextFormTitle(title: 'Starting time', isRequired: true),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Pick Time',
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
                    //side: BorderSide(color:Color(0xFF3EB16F)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.08,
                right: MediaQuery.of(context).size.height * 0.08,
              ),
              child: Container(
                width: 220,
                height: 70,
                child: ElevatedButton(
                  onPressed: () async {
                    await DbHelper.dbHelper.insertMedicine(Medicine(
                        medicineName: 'catamol',
                        medicineDosage: 100,
                        medicineType: 'cabsol',
                        interval: 8,
                        startTime: 'swda'));
                  },
                  child: Text(
                    'Confirm',
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
                        borderRadius: BorderRadius.circular(40),
                        //side: BorderSide(color:Color(0xFF3EB16F)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
