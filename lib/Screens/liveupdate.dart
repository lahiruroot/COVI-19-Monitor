import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class Liveupdate extends StatefulWidget {
  @override
  _LiveupdateState createState() => _LiveupdateState();
}

class _LiveupdateState extends State<Liveupdate> {
  bool ready = false;
  bool isDark = true;

  int totalCasseslocal = 0000;
  int totalActivelocal = 0000;
  int totalDeathsLocal = 0000;
  int totalRecoverLocal = 0000;
  String ltsupdate = "";
  // int totalCasesLocal = 0;
  void getData() {
    Dio()
        .get('https://hpb.health.gov.lk/api/get-current-statistical')
        .then((value) {
      setState(() {
        totalCasseslocal = value.data['data']['local_total_cases'];
        totalActivelocal = value.data['data']['local_active_cases'];
        totalDeathsLocal = value.data['data']['local_deaths'];
        totalRecoverLocal = value.data['data']['local_recovered'];
        ltsupdate = value.data['data']['update_date_time'];
        ready = true;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                Get.changeTheme(isDark ? ThemeData.light() : ThemeData.dark());
                setState(() {
                  isDark = !isDark;
                });
              })
        ],
        title: Text(
          'Vaccination',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Drawer Header',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("My Profile", style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.medical_services),
              title:
                  Text("Vaccination Centers", style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.eject_rounded),
              title: Text("Availble Vaccines in Srilanka",
                  style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info_sharp),
              title: Text("Informations", style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.coronavirus),
              title: Text("COVID-19 Live Situation",
                  style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
            SizedBox(
              height: 100,
            ),
            ListTile(
              leading: Icon(Icons.developer_mode),
              title: Text("Developre", style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Heddre start
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'COVID-19 Live Situation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 05,
                  ),
                  Text('Last updated at:$ltsupdate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      const ListTile(
                        tileColor: Colors.indigo,
                        title: Text(
                          'Cases:',
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$totalCasseslocal',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ListTile(
                        tileColor: Colors.indigo,
                        title: Text(
                          'Hospitalized',
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$totalActivelocal',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ListTile(
                        tileColor: Colors.indigo,
                        title: Text(
                          'Recoveries',
                          style: TextStyle(
                              color: Colors.lightGreenAccent, fontSize: 28),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$totalRecoverLocal',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ListTile(
                        tileColor: Colors.indigo,
                        title: Text(
                          'Deaths',
                          style: TextStyle(color: Colors.red, fontSize: 28),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '$totalDeathsLocal',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ]),
                  ),
                ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
