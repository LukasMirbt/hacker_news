import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:visited_post_repository/visited_post_repository.dart';

class VisitedPostRepository extends HydratedCubit<VisitedPostState> {
  VisitedPostRepository() : super(const VisitedPostState());

  void addVisitedPost(String id) {
    emit(
      state.copyWith(
        items: {...state.items, id},
      ),
    );
  }

  @override
  VisitedPostState? fromJson(Map<String, dynamic> json) {
    return VisitedPostState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(VisitedPostState state) {
    return state.toJson();
  }
}
