import 'package:flutter/material.dart';

import 'exercise_page.dart';
import 'data/repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
            crossAxisCount: 4,
            children: List.generate(Repository.charList.length, (index) {
              return Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    child: ListTile(
                      title: Text(Repository.charList[index].char,
                          textAlign: TextAlign.center),
                      subtitle: Text(Repository.charList[index].name,
                          textAlign: TextAlign.center),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ExercisePage(
                                char: Repository
                                    .charList[index].imageTutorialPath)));
                      },
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5)),
                  ));
            })));
  }
}
