// // ignore_for_file: file_names, avoid_print

// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter/material.dart';

// // class Notifi extends StatefulWidget {
// //   const Notifi({super.key});

// //   @override
// //   State<Notifi> createState() => _NotifiState();
// // }

// // class _NotifiState extends State<Notifi> {
  
// //   late FirebaseMessaging _firebaseMessaging;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _firebaseMessaging = FirebaseMessaging.instance;
// //     _firebaseMessaging.requestPermission();
// //     _firebaseMessaging.getToken().then((token) {
// //       // ignore: avoid_print
// //       print('FCM Token: $token');
// //     });

// //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// //       // ignore: avoid_print
// //       print('onMessage: $message');
// //       showDialog(
// //         context: context,
// //         builder: (context) {
// //           return AlertDialog(
// //             title: Text(message.notification?.title ?? ''),
// //             content: Text(message.notification?.body ?? ''),
// //             actions: <Widget>[
// //               TextButton(
// //                 child: Text('Ok'),
// //                 onPressed: () {
// //                   Navigator.of(context).pop();
// //                 },
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('notification'),
// //       ),
// //       body: Center(child: Text('button')),
// //     );
// //   }
// // }

// // void main() {
// //   runApp(MaterialApp(home: Notifi()));
// // }


// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class Notifi extends StatefulWidget {
//   const Notifi({super.key});

//   @override
//   State<Notifi> createState() => _NotifiState();
// }

// class _NotifiState extends State<Notifi> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize FlutterLocalNotificationsPlugin
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     // Define Android initialization settings
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     // Create InitializationSettings for Android
//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//     // Initialize FlutterLocalNotificationsPlugin with InitializationSettings
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//     onSelectNotification: selectNotification);

//     // Request permission for Firebase Messaging
//     _firebaseMessaging.requestPermission();
//     // Get FCM token and print it
//     _firebaseMessaging.getToken().then((token) {
//       print('FCM Token: $token');
//     });

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       print('onMessage: $message');
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(message.notification?.title ?? ''),
//             content: Text(message.notification?.body ?? ''),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('Ok'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       print('onMessageOpenedApp: $message');
//       _navigateToItemDetail(message.data);
//     });

//     FirebaseMessaging.onBackgroundMessage(myBackgroundHandler);
//   }

//   void _navigateToItemDetail(Map<String, dynamic> message) {
//     // Handle navigation to specific item detail based on the message
//   }

//   Future<void> getToken() async {
//     String? token = await _firebaseMessaging.getToken();
//     print('FCM Token: $token');
//   }

//   Future<void> selectNotification(String? payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//     // Handle notification selection, navigate to specific screen, etc.
//   }

//   Future<void> myBackgroundHandler(RemoteMessage message) async {
//     print("Handling a background message: ${message.messageId}");
//     // Handle background message
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notification'),
//       ),
//       body: Center(
//         child: Text('Button'),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(home: Notifi()));
// }
