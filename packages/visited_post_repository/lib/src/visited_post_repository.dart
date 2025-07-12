import 'package:bloc/bloc.dart';

class VisitedPostRepository extends Cubit<Set<String>> {
  VisitedPostRepository() : super({});

  void add(String id) {
    emit(
      {...state, id},
    );
  }
}
