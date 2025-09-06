import 'package:app/feed_item_options/feed_item_options.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedItemOptionsBloc extends Bloc<void, FeedItemOptionsState> {
  FeedItemOptionsBloc({required FeedItem item})
    : super(
        FeedItemOptionsState.from(item),
      );
}
