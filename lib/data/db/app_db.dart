import 'package:floor/floor.dart';
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:luciola/data/model/character.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'char_dao.dart';

part 'app_db.g.dart';

@Database(version: 1, entities: [Character])
abstract class AppDatabase extends FloorDatabase {
  CharacterDao get charDao;
}
