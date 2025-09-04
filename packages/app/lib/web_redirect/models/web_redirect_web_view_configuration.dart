import 'package:app/app_web_view/app_web_view.dart';

class WebRedirectWebViewConfiguration extends AppWebViewConfiguration {
  WebRedirectWebViewConfiguration({
    required String url,
    required String? html,
  }) : super(
         initialUrl: Uri.parse(url),
         initialHtml: html,
       );
}
