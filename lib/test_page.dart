import 'package:flutter/material.dart';

class Testcall extends StatefulWidget {
  const Testcall({Key? key}) : super(key: key);

  @override
  State<Testcall> createState() => _TestcallState();
}

class _TestcallState extends State<Testcall> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//=====================

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool isCentered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: isCentered
            ? AlignmentDirectional.bottomCenter
            : AlignmentDirectional.bottomEnd,
        child: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Learn'),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Move Fab"),
          onPressed: () {
            setState(() {
              isCentered = !isCentered;
            });
          },
        ),
      ),
    );
  }
}
