// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todo/view/HealthCare.dart';
import 'package:todo/view/MapScreen.dart';
import 'package:todo/view/MyHomePage.dart';
// import 'package:todo/view/Notif.dart';
import 'package:todo/view/location.dart';

class MenuTitle extends StatelessWidget {
  const MenuTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Divider(
              color: Color.fromARGB(60, 0, 0, 0),
              height: 1,
            )),
        ListTile(
          leading: SizedBox(
            height: 34,
            width: 34,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: ''),
                  ),
                );
              },
              icon: const Icon(
                Icons.home,
                color: const Color.fromRGBO(5, 45, 107, 1.0),
              ),
            ),
          ),
          title: const Text(
            "Home",
            style: TextStyle(
              color: const Color.fromRGBO(5, 45, 107, 1.0),
            ),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Divider(
              color: Color.fromARGB(60, 0, 0, 0),
              height: 1,
            )),
        ListTile(
          leading: SizedBox(
            height: 34,
            width: 34,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HealthCare(),
                  ),
                );
              },
              icon: const Icon(
                Icons.health_and_safety,
                color: const Color.fromRGBO(5, 45, 107, 1.0),
              ),
            ),
          ),
          title: const Text(
            "Health Care",
            style: TextStyle(
              color: const Color.fromRGBO(5, 45, 107, 1.0),
            ),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Divider(
              color: Color.fromARGB(60, 0, 0, 0),
              height: 1,
            )),
        ListTile(
          leading: SizedBox(
            height: 34,
            width: 34,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MapSample(),
                  ),
                );
              },
              icon: const Icon(
                Icons.location_city,
                color: const Color.fromRGBO(5, 45, 107, 1.0),
              ),
            ),
          ),
          title: const Text(
            "Location",
            style: TextStyle(
              color: const Color.fromRGBO(5, 45, 107, 1.0),
            ),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Divider(
              color: Color.fromARGB(60, 0, 0, 0),
              height: 1,
            )),
        ListTile(
          leading: SizedBox(
            height: 34,
            width: 34,
            child: IconButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const MapSample(),
                //   ),
                // );
              },
              icon: const Icon(
                Icons.chat,
                color: const Color.fromRGBO(5, 45, 107, 1.0),
              ),
            ),
          ),
          title: const Text(
            "Chat",
            style: TextStyle(
              color: const Color.fromRGBO(5, 45, 107, 1.0),
            ),
          ),
        ),
      ],
    );
  }
}

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Divider(
              color: Color.fromARGB(60, 0, 0, 0),
              height: 1,
            )),
        ListTile(
          leading: SizedBox(
            height: 34,
            width: 34,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HealthCare(),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings,
                color: const Color.fromRGBO(5, 45, 107, 1.0),
              ),
            ),
          ),
          title: const Text(
            "Settings",
            style: TextStyle(
              color: const Color.fromRGBO(5, 45, 107, 1.0),
            ),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Divider(
              color: Color.fromARGB(60, 0, 0, 0),
              height: 1,
            )),
        ListTile(
          leading: SizedBox(
            height: 34,
            width: 34,
            child: IconButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const Notifi(),
                //   ),
                // );
              },
              icon: const Icon(
                Icons.notifications,
                color: const Color.fromRGBO(5, 45, 107, 1.0),
              ),
            ),
          ),
          title: const Text(
            "Notifications",
            style: TextStyle(
              color: const Color.fromRGBO(5, 45, 107, 1.0),
            ),
          ),
        ),
      ],
    );
  }
}
