import 'package:app_client/app_client.dart';

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
