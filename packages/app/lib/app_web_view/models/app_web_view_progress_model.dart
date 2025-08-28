import 'package:app/app_web_view/app_web_view.dart';
import 'package:equatable/equatable.dart';

class AppWebViewProgressModel extends Equatable {
  const AppWebViewProgressModel({
    this.status = const PageInitial(),
  });

  final PageStatus status;

  double get value => status.progress / 100;
  double get opacity => status is PageLoading ? 1 : 0;

  @override
  List<Object> get props => [status];
}
