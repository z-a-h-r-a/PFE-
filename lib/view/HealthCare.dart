// ignore_for_file: file_names, library_private_types_in_public_api
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/service/notif_service.dart';
import 'package:todo/view/side_menu.dart';

class HealthCare extends StatefulWidget {
  const HealthCare({super.key});

  @override
  State createState() => _HealthCareState();
}

class _HealthCareState extends State<HealthCare> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double heartRateBPM = 0; 
  double temperature = 0;
  final Notif notif = Notif();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Set up real-time listener for heart rate
    FirebaseFirestore.instance
        .collection('heart_rates')
        .doc('BPM')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        setState(() {
          heartRateBPM = snapshot.data()?['BPM'] ?? 0; // Update the BPM value
        });
        checkForAlerts(); // Check if notification should be sent
      }
    });

    // Set up real-time listener for temperature
    FirebaseFirestore.instance
        .collection('temperature')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          temperature = snapshot.docs.first.data()['temperature'] ?? 0; // Update the temperature value
        });
        checkForAlerts(); // Check if notification should be sent
      }
    });
  }

  void checkForAlerts() {
    if (temperature < 36 || temperature > 39 || heartRateBPM < 80 || heartRateBPM > 100) {
      notif.showNotification(
        'Health Alert',
        'Temperature or heart rate is out of range!',
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 45, 107, 1.0),
        title: const Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "𝐇𝐞𝐚𝐥𝐭𝐡",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                " 𝐂𝐚𝐫𝐞",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )
            ]),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'HeartRate'),
            Tab(text: 'Temperature'),
          ],
        ),
      ),
      drawer: const Drawer(
          // backgroundColor: const Color.fromARGB(0, 25, 62, 100),
          child: SideMenu()),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "lib/assets/image/heart.png",
                    width: 300,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Text(
                    'BPM: $heartRateBPM',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ), // Display the BPM value here

                  const SizedBox(
                    height: 100,
                  ),
                  IconButton(onPressed:(){ notif.showNotification("Test Title","Test body");}, icon: Icon(Icons.notification_add))

                  // Wrap(
                  //   children: <Widget>[
                  //     Card(
                  //         elevation: 20,
                  //         color: Color.fromRGBO(103, 152, 225, 1),
                  //         child: Padding(
                  //             padding: EdgeInsets.all(30.0),
                  //             child: Column(
                  //                 mainAxisSize: MainAxisSize.min,
                  //                 children: <Widget>[
                  //                   SizedBox(height: 8),
                  //                   Text('Lowest'),
                  //                 ]))),
                  //     Card(
                  //         elevation: 20,
                  //         color: Color.fromRGBO(103, 152, 225, 1),
                  //         child: Padding(
                  //             padding: EdgeInsets.all(30.0),
                  //             child: Column(
                  //                 mainAxisSize: MainAxisSize.min,
                  //                 children: <Widget>[
                  //                   SizedBox(height: 8),
                  //                   Text('Highest'),
                  //                 ]))),
                  //     Card(
                  //         elevation: 20,
                  //         color: Color.fromRGBO(103, 152, 225, 1),
                  //         child: Padding(
                  //             padding: EdgeInsets.all(30.0),
                  //             child: Column(
                  //                 mainAxisSize: MainAxisSize.min,
                  //                 children: <Widget>[
                  //                   SizedBox(height: 8),
                  //                   Text('Time'),
                  //                 ]))),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "lib/assets/image/temperature.png",
                      width: 300,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Temperature: $temperature', // Affiche la température récupérée
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                    // Text('condition :'),
                  ])),
        ],
      ),
    );
  }
}
