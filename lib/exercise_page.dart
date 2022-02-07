import 'package:flutter/material.dart';
import 'package:flutter_painter/flutter_painter.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key, required this.char}) : super(key: key);

  final String char;

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  late PainterController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = PainterController(
        settings: PainterSettings(
            freeStyle: FreeStyleSettings(
      enabled: true,
      strokeWidth: 5,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Exercise")),
        body: Column(children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Container(
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Stack(children: [
                        Center(
                            child: Image.asset(widget.char,
                                width: 250, height: 250)),
                      ])))),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Stack(children: [
                      FlutterPainter(
                        controller: controller,
                      ),
                      ElevatedButton(
                        child: Text("Clear"),
                        onPressed: () {
                          controller.clearDrawables();
                        },
                      ),
                    ]),
                  )))
        ]));
  }
}
