import 'package:get/get.dart';
import 'package:visitor_pass/language/arabic.dart';
import 'package:visitor_pass/language/bangla.dart';
import 'package:visitor_pass/language/english.dart';
import 'package:visitor_pass/language/french.dart';
import 'package:visitor_pass/language/german.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'bn_BD': bangla,
        'de_DE': german,
        'fr_FR': french,
        'ar_AR': arabic,
      };
}
