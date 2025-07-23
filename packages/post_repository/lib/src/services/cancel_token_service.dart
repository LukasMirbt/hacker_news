import 'package:post_repository/post_repository.dart';

class CancelTokenService {
  var _cancelToken = CancelToken();

  CancelToken generate() {
    _cancelToken.cancel();
    return _cancelToken = CancelToken();
  }
}
