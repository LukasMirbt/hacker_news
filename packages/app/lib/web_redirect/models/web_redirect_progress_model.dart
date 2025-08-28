import 'package:app/web_redirect/web_redirect.dart';
import 'package:equatable/equatable.dart';

class WebRedirectProgressModel extends Equatable {
  const WebRedirectProgressModel({
    this.status = const PageInitial(),
  });

  final PageStatus status;

  double get value => status.progress / 100;
  double get opacity => status is PageLoading ? 1 : 0;

  @override
  List<Object> get props => [status];
}
