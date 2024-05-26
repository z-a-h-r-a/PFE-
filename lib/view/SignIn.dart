// ignore_for_file: file_names, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:todo/service/database.dart';
import 'package:todo/view/Login.dart';
// import 'package:todo/view/HealthCare.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    super.key,
  });
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController farmNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  String get title => 'create an account';

  get emailAddress => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 45, 107, 1.0),
      // appBar: AppBar(
      //   // centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(builder: (context) => const HealthCare()),
      //         );
      //       },
      //       icon: const Icon(Icons.home, color: Colors.white),
      //     ),
      //   ],
      //   title: const Text(
      //     "ISAN",
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '𝐂𝐫𝐞𝐚𝐭𝐞 𝐲𝐨𝐮𝐫 𝐚𝐜𝐜𝐨𝐮𝐧𝐭!',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '𝐔𝐬𝐞𝐫 𝐍𝐚𝐦𝐞',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                  ),
                  // validator: (value) {
                  //   if ( value!.isEmpty) {
                  //     return 'Please enter your Name';
                  //   }
                  //   return null;
                  // },
                  onSaved: (value) {
                    // Save the value of the name field
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "𝐄𝐦𝐚𝐢𝐥",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.mail, color: Colors.white),
                  ),
                  validator: (value) {
                    // if ( value!.isEmpty) {
                    //   return 'Please enter your email';
                    // }
                    // if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                    //     .hasMatch(value!)) {
                    //   return 'Please enter a valid email address';
                    // }
                    // return null;
                  },
                  onSaved: (value) {
                    // Save the value of the email field
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: farmNameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '𝐅𝐚𝐫𝐦 𝐍𝐚𝐦𝐞',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.house_sharp, color: Colors.white),
                  ),
                  validator: (value) {
                    // if (value!.isEmpty) {
                    //   return 'Please enter your Farm Name';
                    // }
                    if (value!.length > 10) {
                      return ' The farm name is too long !';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    // Save the value of the farm name field
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  obscureText: true,
                  controller: passwordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '𝐏𝐚𝐬𝐬𝐰𝐨𝐫𝐝',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.password, color: Colors.white),
                  ),
                  validator: (value) {
                    // if ( value!.isEmpty) {
                    //   return 'Please enter your password';
                    // }
                    // if (value!.length < 8) {
                    //   return ' Password must be at least 8 characters long !';
                    // }
                    // return null;
                  },
                  onSaved: (value) {
                    // Save the value of the password field
                  },
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      String id = randomAlphaNumeric(10);
                      Map<String, dynamic> userlInfoMap = {
                        "User Name": nameController.text,
                        "Email": emailController.text,
                        "Farm Name": farmNameController.text,
                        "Password": passwordController.text,
                        "Id": id,
                      };
                      await UsersMethods()
                          .userDetails(userlInfoMap, id)
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: "Wellcome to SAN!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Color.fromARGB(255, 129, 171, 218),
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });

                      try {
                        Navigator.of(context).pushReplacementNamed("Login");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                      if (_formKey.currentState!.validate()) {
                        // Navigate the user to the Home page
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('𝐒𝐢𝐠𝐧 𝐔𝐩'),
                  ),
                ),
              ),
              // Container(
              //   height: 50,
              //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //   child: ElevatedButton(
              //     child: const Text('Sign Up'),
              //     onPressed: () {
              //       print(nameController.text);
              //       print(passwordController.text);
              //     },
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '𝐀𝐥𝐫𝐞𝐚𝐝𝐲 𝐡𝐚𝐯𝐞 𝐚𝐧 𝐚𝐜𝐜𝐨𝐮𝐧𝐭?',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      '𝐋𝐨𝐠 𝐈𝐧',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(1, 141, 245, 1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
