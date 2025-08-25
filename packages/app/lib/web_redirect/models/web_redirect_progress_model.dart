import 'package:app/web_redirect/web_redirect.dart';
import 'package:equatable/equatable.dart';

class WebRedirectProgressModel extends Equatable {
  const WebRedirectProgressModel({
    PageStatus status = const PageInitial(),
  }) : _status = status;

  final PageStatus _status;

  double get value => _status.progress / 100;
  double get opacity => _status is PageLoading ? 1 : 0;

  @override
  List<Object> get props => [_status];
}
