import 'package:flutter/foundation.dart';

class Medicine {
  final String medicineName;
  final int medicineDosage;
  final String medicineType;
  final int interval;
  final String startTime;

  Medicine(
      {this.medicineName,
      this.medicineDosage,
      this.medicineType,
      this.interval,
      this.startTime});
  int get getDosage =>medicineDosage;
  String get getType => medicineType;
  int get getInterval => interval;
  String get getStartTime => startTime;


  factory Medicine.fromJson(Map<String, dynamic> parsedJson) {
    return Medicine(
      medicineName: parsedJson['name'],
      medicineDosage: parsedJson['dosage'],
      medicineType: parsedJson['type'],
      startTime: parsedJson['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.medicineName,
      'dosage':this.medicineDosage,
      'type':this.medicineType,
      'time':this.startTime,
    };
  }

}
