import 'package:flutter/material.dart';
import 'package:luciola/data/model/character.dart';

import 'exercise_page.dart';
import 'data/repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Character>>(
            future: Repository.getAllCharacter(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Character>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading...");
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return GridView.count(
                  crossAxisCount: 4,
                  children: List.generate(snapshot.data!.length, (index) {
                    return Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          child: ListTile(
                            title: Text(snapshot.data![index].char,
                                textAlign: TextAlign.center),
                            subtitle: Text(snapshot.data![index].name,
                                textAlign: TextAlign.center),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ExercisePage(
                                      char: snapshot
                                          .data![index].imageTutorialPath)));
                            },
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                        ));
                  }));
            }));
  }
}
