import 'package:flutter/material.dart';
import 'package:project2/Helpers/DbHelper.dart';
import 'package:project2/models/Medicine.dart';
import 'mediminder_details/mediminder_details_newEntry.dart';

class Home extends StatelessWidget {
  static final routeName = '/';
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
                  FutureBuilder(
                      future: DbHelper.dbHelper.getAllMedicine(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          List<Medicine> medicine = snapshot.data;
                          return Text(
                            !snapshot.hasData
                                ? '0'
                                : medicine.length.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Neu",
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('ERRoR'),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                      /* */
                      ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child: FutureBuilder(
                future: DbHelper.dbHelper.getAllMedicine(),
                builder: (context, AsyncSnapshot<List<Medicine>> snapshot) {
                  List<Medicine> medicine = snapshot.data;
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        "Press + to add a Mediminder",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    return FutureBuilder<List<Map<String,dynamic>>>(
                      future: DbHelper.dbHelper.getSpecific(),
                      builder: (context, snapshot) {
                        return Container(
                          color: Color(0xFFF6F8FC),
                          child: GridView.builder(
                            padding: EdgeInsets.only(top: 12),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return null;//MedicineCardView(iconValue: ,type: ,interval: ,);
                            },
                          ),
                        );
                      }
                    );
                  }}),
            /*FutureBuilder(
                future: DbHelper.dbHelper.getAllMedicine(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<Medicine> medicine = snapshot.data;
                    if(!snapshot.hasData){
                      return Center(
                        child: Text(
                          "Press + to add a Mediminder",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                  }
                  else{
                    return Container(
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: 12),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: 30,
                        itemBuilder: (BuildContext context, int index) {
                          return null;
                          //MedicineCardView(iconValue: ,type: ,interval: ,);
                        },
                      ),

                    );
                  }
                }),*/

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
          DbHelper.dbHelper.getSpecific();
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => MediminderEntryDetails(),
          //   ),
          // )
        },
      ),
    );
  }
}
