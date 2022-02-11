import 'package:floor/floor.dart';
import 'package:luciola/data/model/character.dart';

@dao
abstract class CharacterDao {
  @Query('SELECT * FROM Character')
  Future<List<Character>> getAllChar();

  @Query('SELECT * FROM Character WHERE isLearned = :isLearned')
  Stream<Character?> getByLearned(bool isLearned);

  @insert
  Future<void> insertPerson(Character char);

  @Query('update Character set isLearned = :newState where char = :char')
  Future<void> updateLearned(String char, bool newState);
}
