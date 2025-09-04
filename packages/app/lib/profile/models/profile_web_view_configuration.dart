import 'package:app/app_web_view/app_web_view.dart';
import 'package:web_links/web_links.dart';

class ProfileWebViewConfiguration extends AppWebViewConfiguration {
  ProfileWebViewConfiguration({
    required String id,
    WebLinks webLinks = const WebLinks(),
  }) : super(
         initialUrl: webLinks.profileUrl(id),
       );
}
