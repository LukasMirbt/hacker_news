import 'package:parser_core/src/models/models.dart';

class HnuserPlaceholder extends Hnuser {
  const HnuserPlaceholder({
    String? id,
    bool? isNew,
  }) : super(
         id: id ?? 'id',
         isNew: isNew ?? false,
       );
}
