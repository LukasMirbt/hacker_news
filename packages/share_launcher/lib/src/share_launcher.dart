import 'package:equatable/equatable.dart';
import 'package:share_plus/share_plus.dart';

class ShareFailure with EquatableMixin implements Exception {
  const ShareFailure(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}

class ShareLauncher {
  ShareLauncher({
    SharePlus? instance,
  }) : _instance = instance ?? SharePlus.instance;

  final SharePlus _instance;

  Future<void> share({required String text}) async {
    try {
      await _instance.share(
        ShareParams(text: text),
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        ShareFailure(error),
        stackTrace,
      );
    }
  }
}
