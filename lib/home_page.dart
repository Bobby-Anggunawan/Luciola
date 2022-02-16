import 'package:flutter/material.dart';
import 'package:luciola/data/model/character.dart';

import 'exercise_page.dart';
import 'data/repository.dart';

class CracterGridController {
  List<int> selectedIndex = [];

  void addRemoveSelected(int index) {
    if (thisItemIsSelected(index))
      selectedIndex.remove(index);
    else
      selectedIndex.add(index);

    //kirim data ke fab apa lagi ada yang diselect atau enggak
    Repository.streamController.add(isSelecting());
  }

  //cek apa ada yang lagi di select
  bool isSelecting() {
    if (selectedIndex.isEmpty) return false;
    return true;
  }

  //dipake di widget untuk cek apa item ini lagi di select
  bool thisItemIsSelected(int index) {
    return selectedIndex.contains(index);
  }

  void startUpdate() {
    Repository.changeCharacterState(selectedIndex);
    selectedIndex.clear();
    Repository.streamController.add(false);
  }
}

class CracterGrid extends StatefulWidget {
  const CracterGrid({Key? key, required this.data, required this.dataIndex})
      : super(key: key);

  final Character data;
  final int dataIndex;

  @override
  _CracterGridState createState() => _CracterGridState();
}

class _CracterGridState extends State<CracterGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          child: ListTile(
            title: Text(widget.data.char, textAlign: TextAlign.center),
            subtitle: Text(widget.data.name, textAlign: TextAlign.center),
            onTap: () {
              if (Repository.globalCracterGridController.isSelecting()) {
                setState(() {
                  Repository.globalCracterGridController
                      .addRemoveSelected(widget.dataIndex);
                });
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ExercisePage(char: widget.data.imageTutorialPath)));
              }
            },
            onLongPress: () {
              setState(() {
                Repository.globalCracterGridController
                    .addRemoveSelected(widget.dataIndex);
              });
            },
            selected: Repository.globalCracterGridController
                .thisItemIsSelected(widget.dataIndex),
          ),
          decoration: BoxDecoration(
              color: widget.data.isLearned ? Colors.lightBlue : Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(5)),
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool fabVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Repository.streamController.stream.listen((event) {
      if (event != fabVisible) {
        setState(() {
          fabVisible = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Visibility(
            visible: fabVisible,
            child: FloatingActionButton.extended(
              backgroundColor: const Color(0xff03dac6),
              foregroundColor: Colors.black,
              onPressed: () {
                setState(() {
                  Repository.globalCracterGridController.startUpdate();
                });
              },
              icon: Icon(Icons.add),
              label: Text('Learn'),
            )),
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
                    return CracterGrid(
                      data: snapshot.data![index],
                      dataIndex: index,
                    );
                  }));
            }));
  }
}
