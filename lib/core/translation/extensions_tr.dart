import 'localize_and_translate.dart';

extension Translation on String {
  String tr() => translator.translate(this);
}
