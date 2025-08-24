import 'package:app_client/app_client.dart';

class UrlRedirectPlaceholder extends UrlRedirect {
  UrlRedirectPlaceholder(Uri? url)
    : super(
        url ?? Uri.parse('https://example.com'),
      );
}
