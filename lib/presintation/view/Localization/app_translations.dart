import 'package:get/get.dart';
import 'en_us.dart';
import 'ar_sa.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
