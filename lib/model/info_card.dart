import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class infocard extends StatelessWidget {
  const infocard({
    super.key,
    required this.name,
    required this.farmName, required Color color,
  });

  final String name, farmName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        farmName,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
