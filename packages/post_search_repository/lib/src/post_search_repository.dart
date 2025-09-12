// ignore_for_file: use_setters_to_change_properties

import 'dart:async';

import 'package:post_search_repository/post_search_repository.dart';

class PostSearchRepository {
  final _controller = StreamController<SelectedComment>.broadcast();
  Stream<SelectedComment> get selectedComment => _controller.stream;

  var _query = '';
  String get query => _query;

  void select({required String id}) {
    _controller.add(
      SelectedComment(id: id),
    );
  }

  void update({required String query}) {
    _query = query;
  }

  void clear() {
    _query = '';
  }

  void dispose() {
    _controller.close();
  }
}
