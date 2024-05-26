import 'package:flutter/material.dart';
// import 'package:todo/view/MyHomePage.dart';
import 'package:todo/model/info_card.dart';
import 'package:todo/model/side_menu_title.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        // color: Color.fromARGB(0, 0, 0, 0),
        child: Column(
          children: [
            const infocard(
              name: "Zahra",
              farmName: "farm", color: Colors.black12,
            ),
            // DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: AppColors.mainColor,
            //   ),
            //   child: UserAccountsDrawerHeader(
            //     decoration: BoxDecoration(color: AppColors.mainColor),
            //     accountName: Row(
            //       children: [
            //         CircleAvatar(
            //           radius: 20,
            //           backgroundColor: Color.fromARGB(255, 237, 239, 237),
            //           child: Text(
            //             AppStorage.readName().toString()[0].toUpperCase(),
            //             style:
            //                 const TextStyle(fontSize: 20.0, color: Colors.blue),
            //           ),
            //         ),
            //         SizedBox(width: 10), // Espace entre le cercle et le nom
            //         Text(
            //           "Zahra",
            //           style: TextStyle(fontSize: 18),
            //         ),
            //       ],
            //     ),
            //     accountEmail: Text("${AppStorage.readEmail()}"),
            //     currentAccountPictureSize: const Size.square(50),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "Browser".toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Color.fromARGB(255, 25, 62, 100),
                    ),
              ),
            ),
            const MenuTitle(),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "History".toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Color.fromARGB(255, 25, 62, 100),
                    ),
              ),
            ),
            const History(),
          ],
        ),
      ),
    );
  }
}


// DrawerHeader(
//               decoration: BoxDecoration(
//                 color: AppColors.mainColor,
//               ),
//               child: UserAccountsDrawerHeader(
//                 decoration: BoxDecoration(color: AppColors.mainColor),
//                 accountName: Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 20,
//                       backgroundColor: Color.fromARGB(255, 237, 239, 237),
//                       child: Text(
//                         AppStorage.readName().toString()[0].toUpperCase(),
//                         style:
//                             const TextStyle(fontSize: 20.0, color: Colors.blue),
//                       ),
//                     ),
//                     SizedBox(width: 10), // Espace entre le cercle et le nom
//                     Text(
//                       "${AppStorage.readName()}",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//                 accountEmail: Text("${AppStorage.readEmail()}"),
//                 currentAccountPictureSize: const Size.square(50),
//               ),
//             ),