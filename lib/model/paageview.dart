import "package:flutter/material.dart";
import "package:todo/model/image_container.dart";

class PageCont extends StatelessWidget {
  const PageCont({
    super.key,
    required this.text1,
    required this.text2,
    required this.asset,
    this.onPressed,
    this.isLastPage = false,
  });
  final String text1;
  final String text2;
  final String asset;
  final void Function()? onPressed;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ImageContainer(asset: asset),
      Text(
        text1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color.fromRGBO(103, 152, 225, 1),
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 26,
      ),
      Text(
        text2,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      const SizedBox(
        height: 26,
      ),
      if (isLastPage) // Conditionally render the TextButton for the last page

        TextButton(
            onPressed: onPressed ?? () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(
                const Size(200, 50),
              ),
              backgroundColor:MaterialStateProperty.all<Color>(
                const Color.fromRGBO(42, 122, 225, 1),
              ),
              foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white,
              ),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 18),
              ),
            ),
            child: const Text(
              "Get Started",
            )),
      //MaterialStateProperty
    ]);
  }
}
