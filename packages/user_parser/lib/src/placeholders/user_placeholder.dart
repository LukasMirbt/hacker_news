import 'package:authentication_parser/authentication_parser.dart';

class UserPlaceholder extends User {
  const UserPlaceholder({
    String? id,
    int? karma,
    String? profileUrl,
    String? logoutUrl,
  }) : super(
         id: id ?? 'id',
         karma: karma ?? 1,
         profileUrl: profileUrl ?? 'profileUrl',
         logoutUrl: logoutUrl ?? 'logoutUrl',
       );
}
