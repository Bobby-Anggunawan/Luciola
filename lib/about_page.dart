import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var aboutName =
        "Nama \"Luciola\" diambil dari nama genus suatu kunang-kunang. Awalnya saya ingin menamakan aplikasi ini dengan nama yang berhubungan dengan \"Harappan Script\", sebuah aksara kuno. Ilmuan masih terus mempelajari arti dari aksara ini. Saya berharap aplikasi ini bisa terus digunakan belajar bahasa seperti ilmuan yang juga melakukannya. Tapi kata \"Harappan\" mirip dengan kata harapan di bahasa saya. Jadi saya berpikir menamakannya dengan nama hewan yang berhubungan dengan harapan. Ada beberapa hewan tapi yang punya nama bagus menurut saya cuma kunang-kunang. Kebetulan \"Luciola\" adalah kunang kunang jepang. Saya memang membuat aplikasi ini untuk belajar bahasa jepang.";

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(aboutName),
            )));
  }
}
