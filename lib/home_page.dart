import 'package:flutter/material.dart';

import 'exercise_page.dart';
import 'data/repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: Repository.charList.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Center(child: Text(Repository.charList[index].char)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ExercisePage(
                      char: Repository.charList[index].imageTutorialPath)));
            });
      },
    ));
  }
}
