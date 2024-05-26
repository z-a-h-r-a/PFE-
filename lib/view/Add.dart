// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:todo/service/database.dart';
import 'package:todo/view/MyHomePage.dart';
import 'package:todo/view/side_menu.dart';
// import 'package:todo/view/MyHomePage.dart';

class Add extends StatefulWidget {
  const Add({
    super.key,
  });
  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController necklacenumController = TextEditingController();
  TextEditingController animalnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 45, 107, 1.0),
        title: const Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "𝐀𝐝𝐝",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                " 𝐀𝐧𝐢𝐦𝐚𝐥",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
      drawer: const Drawer(
          // backgroundColor: const Color.fromARGB(0, 25, 62, 100),
          child: SideMenu()),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "𝐀𝐧𝐢𝐦𝐚𝐥'𝐬 𝐍𝐚𝐦𝐞",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: animalnameController,
              decoration: const InputDecoration(border: InputBorder.none),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Necklace num';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "𝐍𝐞𝐜𝐤𝐥𝐚𝐜𝐞 𝐈𝐝",
            style: TextStyle(
              color:  Colors.blue,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: necklacenumController,
              decoration: const InputDecoration(border: InputBorder.none),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your Animal's Name";
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    String id = randomAlphaNumeric(10);
                    Map<String, dynamic> animalInfoMap = {
                      "Animal's Name": animalnameController.text,
                      "Necklace num": necklacenumController.text,
                      "Id": id,
                    };
                    await DatabaseMethods()
                        .addAnimalDetails(animalInfoMap, id)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "List details has been uploaded successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color.fromARGB(255, 129, 171, 218),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                                title: '',
                              )),
                    );
                  },
                  child: const Text(
                    "𝐀𝐝𝐝",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
        ]),
      ),
    );
  }
}
