import 'package:app_client/app_client.dart';

class CancelTokenService {
  var _cancelToken = CancelToken();

  CancelToken generate() {
    _cancelToken.cancel();
    return _cancelToken = CancelToken();
  }
}
