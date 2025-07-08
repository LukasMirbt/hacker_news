import 'package:app_client/app_client.dart';

class WebRedirectPlaceholder extends WebRedirect {
  WebRedirectPlaceholder({Uri? url})
    : super(
        url: url ?? Uri.parse('https://example.com'),
      );
}
