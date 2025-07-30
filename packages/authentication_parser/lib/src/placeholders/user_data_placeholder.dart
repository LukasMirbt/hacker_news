import 'package:authentication_parser/authentication_parser.dart';

class UserDataPlaceholder extends UserData {
  const UserDataPlaceholder({
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
