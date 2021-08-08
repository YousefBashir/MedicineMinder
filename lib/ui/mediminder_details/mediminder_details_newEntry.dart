import 'package:flutter/material.dart';
import 'package:project2/Helpers/DbHelper.dart';
import 'package:project2/models/Medicine.dart';

import 'package:project2/widgets/custom_text_span.dart';
import 'package:project2/widgets/interval_selection.dart';
import 'package:project2/widgets/medicine_type.dart';
import 'package:project2/widgets/select_time.dart';

import '../success_page.dart';

class MediminderEntryDetails extends StatefulWidget {
  static final routeName = '/mediminder-entry-details';

  @override
  _MediminderEntryDetailsState createState() => _MediminderEntryDetailsState();
}

class _MediminderEntryDetailsState extends State<MediminderEntryDetails> {
  String name;
  int dosage;
  String type;
  int interval;
  String startTime;
  TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;
  bool isSelected = false;
 int selectedIcon=0;
 selectIcon(int code){
   this.selectedIcon=code;
   setState(() {

   });
 }
  //List<bool> cardsList=[false,false];

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

  TextEditingController nameController;
  TextEditingController dosageController;

  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
  }

  var intervals = [
    6,
    8,
    12,
    24,
  ];
  var selected = 0;

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
              controller: nameController,
              maxLength: 12,
              style: TextStyle(
                fontSize: 16,
              ),
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              onChanged: (value) {
                name = value;
              },
            ),
            TextFormTitle(
              title: 'Dosage in mg',
              isRequired: true,
            ),
            TextFormField(
              controller: dosageController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 16,
              ),
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              onChanged: (value) {
                dosage = value as int;
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
                  fun:selectIcon ,
                  name: 'Bottle',
                  //medicineType: MedicineType.Bottle,
                  iconValue: 0xe900,
                  isSelected: selectedIcon== 0xe900,
                ),
                MedicineTypeView(
                  fun:selectIcon ,
                  name: 'Pill',
                  // medicineType: MedicineType.Pill,
                  iconValue: 0xe901,
                  isSelected:  selectedIcon==0xe901,
                ),
                MedicineTypeView(
                  fun:selectIcon ,
                  name: 'Syringe',
                  // medicineType: MedicineType.Syringe,
                  iconValue: 0xe902,
                  isSelected: selectedIcon==0xe902,
                ),
                MedicineTypeView(
                  fun:selectIcon ,
                  name: 'Tablet',
                  // medicineType: MedicineType.Tablet,
                  iconValue: 0xe903,
                  isSelected: selectedIcon==0xe903,
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
            //IntervalSelection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Remind me every',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
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
                SizedBox(
                  width: 10,
                ),
                Text(
                  'hours',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            TextFormTitle(title: 'Starting time', isRequired: true),
            SizedBox(
              height: 20,
            ),
            //SelectTime(),
            Container(
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
                )),
            SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
              'Selected starting time: ' + '${_time.format(context)}',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            )),
            SizedBox(
              height: 60,
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
                    //String medicineName;
                    //int dosage;
                    if (nameController.text == "") {
                      SnackBar snackBar = SnackBar(
                        content: Text('Please enter medicine name'),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (nameController.text != "") {
                      name = nameController.text;
                    }
                    if (dosageController.text == "") {
                      dosage = 0;
                    }
                    if (dosageController.text != "") {
                      dosage = int.parse(dosageController.text);
                    }
                    await DbHelper.dbHelper.insertMedicine(Medicine(
                        medicineName: name,
                        medicineDosage: dosage,
                        medicineType: type,
                        interval: selected,
                        startTime: _time.format(context)));

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return SuccessPage();
                        },
                      ),
                    );
                    //DbHelper.dbHelper.getTablesName();
                    /*Medicine mm =
                        await DbHelper.dbHelper.getSpecificMedicine(7);
                    print(mm.toMap());*/
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
