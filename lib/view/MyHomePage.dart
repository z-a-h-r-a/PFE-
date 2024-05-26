// ignore: file_names
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/service/database.dart';
import 'package:todo/view/Add.dart';
import 'package:todo/view/side_menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController necklacenumController = TextEditingController();
  TextEditingController animalnameController = TextEditingController();
  Stream? AnimalsStream;

  getontheload() async {
    AnimalsStream = await DatabaseMethods().getAnimalsDetails();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allAnimalsDetails() {
    return StreamBuilder(
        stream: AnimalsStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "𝐀𝐧𝐢𝐦𝐚𝐥'𝐬 𝐍𝐚𝐦𝐞: " +
                                          ds["Animal's Name"],
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        animalnameController.text =
                                            ds["Animal's Name"];
                                        necklacenumController.text =
                                            ds["Necklace num"];
                                        EditAnimalsDetails(ds["Id"]);
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await DatabaseMethods()
                                            .deleteAnimalsDetails(ds["Id"]);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "𝐍𝐞𝐜𝐤𝐥𝐚𝐜𝐞 𝐈𝐝: " +
                                      ds["Necklace num"],
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Add()),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "𝐀𝐧𝐢𝐦𝐚𝐥",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                " 𝐋𝐢𝐬𝐭",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
      drawer: Builder(
        builder: (context) => Drawer(
            // backgroundColor: const Color.fromARGB(0, 25, 62, 100),
            child: SideMenu()),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
          child: Column(children: [
            Expanded(child: allAnimalsDetails()),
          ])),
    );
  }

  Future EditAnimalsDetails(String id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel),
                    ),
                    SizedBox(
                      width: 60.0,
                    ),
                    Text(
                      "𝐄𝐝𝐢𝐭",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " 𝐃𝐞𝐭𝐚𝐢𝐥𝐬",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "𝐀𝐧𝐢𝐦𝐚𝐥'𝐬 𝐍𝐚𝐦𝐞",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: animalnameController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "𝐍𝐞𝐜𝐤𝐥𝐚𝐜𝐞 𝐈𝐝",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: necklacenumController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          Map<String, dynamic> updateInfo = {
                            "𝐀𝐧𝐢𝐦𝐚𝐥'𝐬 𝐍𝐚𝐦𝐞":
                                animalnameController.text,
                            "𝐍𝐞𝐜𝐤𝐥𝐚𝐜𝐞 𝐈𝐝": necklacenumController.text,
                            "Id": id,
                          };
                          await DatabaseMethods()
                              .updateAnimalsDetails(id, updateInfo)
                              .then((value) {
                            Navigator.pop(context);
                          });
                        },
                        child: Text("𝐔𝐩𝐝𝐚𝐭𝐞")))
              ],
            ),
          ));
}
