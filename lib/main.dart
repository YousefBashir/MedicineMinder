import 'package:flutter/material.dart';
import 'package:project2/ui/home_page.dart';

import 'Helpers/DbHelper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(MaterialApp(home: HomePage(),));
}

