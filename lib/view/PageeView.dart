// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo/model/paageview.dart';
import 'package:todo/view/Login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:todo/view/MyHomePage.dart';

class Pageeview extends StatefulWidget {
  const Pageeview({super.key});

  @override
  State<Pageeview> createState() => _PageeviewState();
}

class _PageeviewState extends State<Pageeview> {
  // PageController _pagecontroller = PageController();
  late PageController _pagecontroller;
  int _currentpage = 0;
  // ignore: unused_field
  bool _skipClicked = false;

  @override
  void initState() {
    super.initState();
    _pagecontroller = PageController(initialPage: _currentpage);
  }

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // buttonLabel = _skipClicked && (_currentpage == 4) ? "DONE" : "NEXT";
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "𝐒𝐀𝐍",
        style: TextStyle(
          color: Color.fromRGBO(103, 152, 225, 1),
          fontWeight: FontWeight.bold,
        ),
      )
          // backgroundColor: Colors.black,
          ),
      // drawer: Drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 1000,
                    child: PageView(
                      controller: _pagecontroller,
                      onPageChanged: (index) {
                        setState(() {
                          _currentpage = index;
                        });
                      },
                      allowImplicitScrolling: true,
                      children: [
                        const PageCont(
                            text1:
                                "𝐓𝐫𝐚𝐜𝐤 𝐓𝐡𝐞 𝐀𝐧𝐢𝐦𝐚𝐥'𝐬 𝐋𝐨𝐜𝐚𝐭𝐢𝐨𝐧",
                            text2:
                                "𝙶𝚎𝚝 𝚗𝚘𝚝𝚒𝚏𝚒𝚎𝚍 𝚠𝚑𝚎𝚗 𝚢𝚘𝚞𝚛 𝚙𝚎𝚝 𝚕𝚎𝚊𝚟𝚎𝚜 𝚝𝚑𝚎𝚒𝚛 𝚜𝚊𝚏𝚎 𝚙𝚕𝚊𝚌𝚎",
                            asset: "lib/assets/image/gps.png"),
                        const PageCont(
                            text1: "𝐇𝐞𝐚𝐥𝐭𝐡 𝐝𝐞𝐭𝐞𝐜𝐭𝐢𝐯𝐞",
                            text2:
                                "𝚝𝚑𝚛𝚘𝚞𝚐𝚑 𝚝𝚑𝚎 𝚊𝚋𝚒𝚕𝚒𝚝𝚢 𝚝𝚘 𝚖𝚎𝚊𝚜𝚞𝚛𝚎 𝚝𝚑𝚎 𝚊𝚗𝚒𝚖𝚊𝚕 𝚛𝚎𝚜𝚝 𝚝𝚒𝚖𝚎, 𝚑𝚎𝚊𝚛𝚝 𝚋𝚎𝚊𝚝𝚜 𝚊𝚗𝚍 𝚋𝚘𝚍𝚢 𝚝𝚎𝚖𝚙𝚎𝚛𝚊𝚝𝚞𝚛𝚎 𝚊𝚕𝚜𝚘 𝚌𝚘𝚕𝚕𝚎𝚌𝚝𝚎𝚍 𝚍𝚊𝚝𝚊 𝚘𝚗 𝚟𝚊𝚛𝚒𝚘𝚞𝚜 𝚍𝚒𝚜𝚎𝚊𝚜𝚎𝚜.",
                            asset: "lib/assets/image/care.png"),
                        const PageCont(
                            text1: "𝐂𝐡𝐚𝐭𝐬",
                            text2: "𝚃𝚘 𝚎𝚗𝚑𝚊𝚗𝚌𝚎 𝚝𝚑𝚎 𝚚𝚞𝚊𝚕𝚒𝚝𝚢"
                                " 𝚘𝚏 𝚕𝚒𝚏𝚎 𝚏𝚘𝚛 𝚢𝚘𝚞𝚛 𝚙𝚎𝚝 𝚊𝚗𝚍 𝚎𝚜𝚝𝚊𝚋𝚕𝚒𝚜𝚑 𝚊 𝚌𝚘𝚖𝚖𝚞𝚗𝚒𝚝𝚢 𝚘𝚏 𝚙𝚎𝚝 𝚕𝚘𝚟𝚎𝚛𝚜, 𝚜𝚑𝚊𝚛𝚎 𝚢𝚘𝚞𝚛 𝚎𝚡𝚙𝚎𝚛𝚒𝚎𝚗𝚌𝚎𝚜, 𝚝𝚒𝚙𝚜, 𝚊𝚗𝚍 𝚚𝚞𝚎𝚜𝚝𝚒𝚘𝚗𝚜 𝚠𝚒𝚝𝚑 𝚘𝚝𝚑𝚎𝚛 𝚙𝚎𝚝 𝚘𝚠𝚗𝚎𝚛𝚜.",
                            asset: "lib/assets/image/chat.png"),
                        PageCont(
                          text1: "𝐖𝐞𝐥𝐜𝐨𝐦𝐞",
                          text2:
                              "𝙺𝚗𝚘𝚠 𝚢𝚘𝚞𝚛 𝚊𝚗𝚒𝚖𝚊𝚕 𝚋𝚎𝚝𝚝𝚎𝚛, 𝚔𝚎𝚎𝚙 𝚝𝚑𝚎𝚖 𝚑𝚊𝚙𝚙𝚢!",
                          asset: "lib/assets/image/logo.png",
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          // Login
                          isLastPage: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: _currentpage <= 2
                    ? () {
                        _pagecontroller.jumpToPage(4);
                        setState(() {
                          _currentpage = 3;
                          _skipClicked = true;
                        });
                      }
                    : null,
                child: const Text('SKIP')),
            Center(
              child: SmoothPageIndicator(
                controller: _pagecontroller,
                count: 4,
                effect: const WormEffect(
                  spacing: 16,
                  dotColor: Color.fromRGBO(171, 171, 171, 1),
                  activeDotColor: Color.fromRGBO(42, 103, 244, 1),
                ),
                onDotClicked: (index) => _pagecontroller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
              ),
            ),
            TextButton(
              onPressed: _currentpage <= 2
                  ? () {
                      if (_currentpage < 3) {
                        _pagecontroller.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                        );
                      }
                      // Navigator.popAndPushNamed(context, 'package:isan/view/Login.dart');
                    }
                  : null,
              child: const Text("NEXT"),
            ),
          ],
        ),
      ),
    );
  }
}
