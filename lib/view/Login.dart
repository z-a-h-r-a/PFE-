// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/view/SignIn.dart';
import 'package:todo/view/MyHomePage.dart';
import 'package:todo/view/VerifPage.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 45, 107, 1.0),
      // appBar: AppBar(
      // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //   title: const Text(
      //     "SAN",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //               builder: (context) => const MyHomePage(
      //                     title: '',
      //                   )),
      //         );
      //       },
      //       icon: const Icon(Icons.home, color: Colors.white),
      //     ),
      //   ],
      // ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "lib/assets/image/horse1.png",
                width: 300,
                height: 300,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: SingleChildScrollView(
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(
                        color: Colors.white), // Set the text color to white
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "𝐄𝐦𝐚𝐢𝐥",
                      prefixIcon: Icon(Icons.mail, color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      // fillColor: Colors
                      //     .grey[800], // Set the background color to a dark grey
                      // filled: true, // Enable the background color
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: SingleChildScrollView(
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      return TextFormField(
                        controller: passwordController,
                        style: const TextStyle(color: Colors.white),
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "𝐏𝐚𝐬𝐬𝐰𝐨𝐫𝐝",
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon:
                              const Icon(Icons.password, color: Colors.white),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // Save the value of the password field
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const VerificationPage()),
                    );
                  },
                  child: const Text(
                    "𝐅𝐨𝐫𝐠𝐨𝐭 𝐏𝐚𝐬𝐬𝐰𝐨𝐫𝐝",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                // width: MediaQuery.of(context).size.width,
                // margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                // decoration:
                //     BoxDecoration(borderRadius: BorderRadius.circular(90)),
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () async {
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16);
                      if (_formKey.currentState!.validate()) {
                        try {
                          // ignore: unused_local_variable
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          // If sign in is successful, navigate to the home screen
                          Navigator.push(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage(
                                      title: '',
                                    )),
                          );
                        } catch (e) {
                          // If sign in fails, show an error message
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Failed to log in. Please check your credentials.')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Please fill in all the required fields.')),
                        );
                      }
                    },
                    child: const Text(
                      '𝐋𝐨𝐠 𝐈𝐧',
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      '𝐂𝐫𝐞𝐚𝐭𝐞 𝐚 𝐧𝐞𝐰 𝐀𝐜𝐜𝐨𝐮𝐧𝐭..!',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        '𝐒𝐢𝐠𝐧 𝐈𝐧',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(1, 141, 245, 1),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
