import 'package:app/post_options/post_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';

class PostOptionsBloc extends Bloc<void, PostOptionsState> {
  PostOptionsBloc({
    required PostRepository postRepository,
  }) : super(
         PostOptionsState.from(postRepository.state.post),
       );
}
