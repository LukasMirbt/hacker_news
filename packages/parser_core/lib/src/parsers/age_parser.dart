import 'package:parser_core/parser_core.dart';

class AgeParser extends ParserTemplate<DateTime> {
  const AgeParser();

  @override
  String? extractText(Element element) {
    final ageElement = element.querySelector('.age');
    if (ageElement == null) return null;
    return ageElement.attributes['title'];
  }

  @override
  DateTime? parseText(String text) {
    final trimmedText = text.trim();

    final regExp = RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}');
    final match = regExp.firstMatch(trimmedText);
    if (match == null) return null;

    final dateString = match.group(0);
    if (dateString == null) return null;

    final date = DateTime.tryParse(dateString);
    if (date == null) return null;

    final utc = date.copyWith(isUtc: true);
    final local = utc.toLocal();

    return local;
  }
}
