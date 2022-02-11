import 'package:luciola/data/model/character.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/app_db.dart';

class Repository {
  static SharedPreferences? savePreference;
  static AppDatabase? saveDB;

  static Future<List<Character>> getAllCharacter() async {
    if (savePreference == null)
      savePreference = await SharedPreferences.getInstance();
    if (saveDB == null)
      saveDB = await $FloorAppDatabase.databaseBuilder('app_db.db').build();

    bool? hiraganaPopulated = savePreference!.getBool('hiraganaPopulated');
    final myCharDao = saveDB!.charDao;

    //database masih kosong, tambah data
    if (hiraganaPopulated == null) {
      charList.forEach((element) {
        myCharDao.insertPerson(element);
      });

      //tandai database terisi
      await savePreference!.setBool('hiraganaPopulated', true);
    }
    

    return await myCharDao.getAllChar();
  }

  static List<Character> charList = [
    Character("あ", "A", "images/hiragana/a.jpg", false),
    Character("い", "I", "images/hiragana/i.jpg", false),
    Character("う", "U", "images/hiragana/u.jpg", false),
    Character("え", "E", "images/hiragana/e.jpg", false),
    Character("お", "O", "images/hiragana/o.jpg", false),
    Character("か", "KA", "images/hiragana/ka.jpg", false),
    Character("き", "KI", "images/hiragana/ki.jpg", false),
    Character("く", "KU", "images/hiragana/ku.jpg", false),
    Character("け", "KE", "images/hiragana/ke.jpg", false),
    Character("こ", "KO", "images/hiragana/ko.jpg", false),
    Character("さ", "SA", "images/hiragana/sa.jpg", false),
    Character("し", "SHI", "images/hiragana/shi.jpg", false),
    Character("す", "SU", "images/hiragana/su.jpg", false),
    Character("せ", "SE", "images/hiragana/se.jpg", false),
    Character("そ", "SO", "images/hiragana/so.jpg", false),
    Character("た", "TA", "images/hiragana/ta.jpg", false),
    Character("ち", "CHI", "images/hiragana/chi.jpg", false),
    Character("つ", "TSU", "images/hiragana/tsu.jpg", false),
    Character("て", "TE", "images/hiragana/te.jpg", false),
    Character("と", "TO", "images/hiragana/to.jpg", false),
    Character("な", "NA", "images/hiragana/na.jpg", false),
    Character("に", "NI", "images/hiragana/ni.jpg", false),
    Character("ぬ", "NU", "images/hiragana/nu.jpg", false),
    Character("ね", "NE", "images/hiragana/ne.jpg", false),
    Character("の", "NO", "images/hiragana/no.jpg", false),
    Character("は", "HA", "images/hiragana/ha.jpg", false),
    Character("ひ", "HI", "images/hiragana/hi.jpg", false),
    Character("ふ", "FU", "images/hiragana/fu.jpg", false),
    Character("へ", "HE", "images/hiragana/he.jpg", false),
    Character("ほ", "HO", "images/hiragana/ho.jpg", false),
    Character("ま", "MA", "images/hiragana/ma.jpg", false),
    Character("み", "MI", "images/hiragana/mi.jpg", false),
    Character("む", "MU", "images/hiragana/mu.jpg", false),
    Character("め", "ME", "images/hiragana/me.jpg", false),
    Character("も", "MO", "images/hiragana/mo.jpg", false),
    Character("や", "YA", "images/hiragana/ya.jpg", false),
    Character("ゆ", "YU", "images/hiragana/yu.jpg", false),
    Character("よ", "YO", "images/hiragana/yo.jpg", false),
    Character("ら", "RA", "images/hiragana/ra.jpg", false),
    Character("り", "RI", "images/hiragana/ri.jpg", false),
    Character("る", "RU", "images/hiragana/ru.jpg", false),
    Character("れ", "RE", "images/hiragana/re.jpg", false),
    Character("ろ", "RO", "images/hiragana/ro.jpg", false),
    Character("わ", "WA", "images/hiragana/wa.jpg", false),
    Character("ゐ", "WI", "images/hiragana/wi.jpg", false),
    Character("ゑ", "WE", "images/hiragana/we.jpg", false),
    Character("を", "WO", "images/hiragana/wo.jpg", false),
    Character("ん", "N", "images/hiragana/n.jpg", false),
  ];
}
