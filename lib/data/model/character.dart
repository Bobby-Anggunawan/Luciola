import 'package:floor/floor.dart';

@entity
class Character {
  Character(this.char, this.name, this.imageTutorialPath, this.isLearned);

  @primaryKey
  final String char;
  final String name;
  final String imageTutorialPath;

  final bool isLearned;
}
