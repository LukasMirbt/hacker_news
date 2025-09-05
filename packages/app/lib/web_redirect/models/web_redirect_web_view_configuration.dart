import 'package:app/app_web_view/app_web_view.dart';

class WebRedirectWebViewConfiguration extends AppWebViewConfiguration {
  const WebRedirectWebViewConfiguration({
    required Uri url,
    required String? html,
  }) : super(
         initialUrl: url,
         initialHtml: html,
       );
}
