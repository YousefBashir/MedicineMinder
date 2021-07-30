import 'dart:convert';

import 'package:project2/models/Medicine.dart';
import 'package:rxdart/rxdart.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ControlBehavior {
  BehaviorSubject<List<Medicine>> _medicineList;

  BehaviorSubject<List<Medicine>> get medicineList => _medicineList;

  ControlBehavior() {
    _medicineList = BehaviorSubject<List<Medicine>>.seeded([]);
  }

  Future makeMedicineList() async {
    SharedPreferences userSharedPreferences =
        await SharedPreferences.getInstance();
    List<String> jsonList = userSharedPreferences.getStringList('medicine');
    List<Medicine> prefList = [];
    if (jsonList == null) {
      return;
    } else {
      for (String jsonMedicine in jsonList) {
        Map userMap = jsonDecode(jsonMedicine);
        Medicine tempMedicine = Medicine.fromJson(userMap);
        prefList.add(tempMedicine);
      }
      _medicineList.add(prefList);
    }
  }

  Future updateMedicineList(Medicine newMedicine) async {
    var pref = _medicineList.value;
    pref.add(newMedicine);
    _medicineList.add(pref);
    Map<String, dynamic> tempMap = newMedicine.toJson();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String newMedicineJson = jsonEncode(tempMap);
    List<String> medicineJsonList = [];
    if (sharedPreferences.getStringList('medicine') == null) {
      medicineJsonList.add(newMedicineJson);
    } else {
      medicineJsonList = sharedPreferences.getStringList('medicines');
      medicineJsonList.add(newMedicineJson);
    }
    sharedPreferences.setStringList('medicines', medicineJsonList);
  }
  Future removeMedicine(Medicine medicineToRemove)async{
    var pref=_medicineList.value;
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    List<String> medicineJsonList=[];
    pref.removeWhere((medicine) => medicine.medicineName== medicineToRemove.medicineName);
    if(pref.length!=0){


    }


  }
}
