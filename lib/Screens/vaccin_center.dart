import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class Vaccin_centers extends StatefulWidget {
  const Vaccin_centers({Key? key}) : super(key: key);

  @override
  _Vaccin_centersState createState() => _Vaccin_centersState();
}

class _Vaccin_centersState extends State<Vaccin_centers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text(
          'Vaccination Centers',
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
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Vaccin_centers()));
              },
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
    );
  }
}
