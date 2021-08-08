import 'package:flutter/material.dart';
import 'package:project2/ui/hometest.dart';
import 'package:project2/ui/mediminder_details/mediminder_details_newEntry.dart';
import 'package:project2/ui/success_page.dart';
import 'package:project2/widgets/select_time.dart';

import 'Helpers/DbHelper.dart';
import 'card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(
    MaterialApp(
      routes: {
        Home.routeName: (ctx) => Home(),
        SuccessPage.routeName: (ctx) => SuccessPage(),
    MediminderEntryDetails.routeName: (ctx) => MediminderEntryDetails(),
      },
      initialRoute: Home.routeName,
      // home: Home(),
    ),
  );
}
