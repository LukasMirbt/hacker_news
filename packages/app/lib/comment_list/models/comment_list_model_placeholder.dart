import 'package:app/comment_list/comment_list.dart';
import 'package:post_repository/post_repository.dart' as repository;

class CommentListModelPlaceholder extends CommentListModel {
  CommentListModelPlaceholder()
    : super(
        items: List.filled(
          10,
          OtherUserCommentModel(
            comment: repository.OtherUserCommentPlaceholder(
              htmlText: """
                  And even if you fall under the first category,
                  I find it hard to believe that the performance 
                  bottleneck is solved by using Vercel and SSR.<p>With 
                  all the other crazy shit people are doing (multi-megabyte 
                  bundle sizes, slow API calls with dozens of round-trips 
                  to the DB, etc) doing the basics of profiling, 
                  optimizing, simplifying seems like it'd get you much 
                  further than changing to a more complex architecture.</p>""",
            ),
          ),
        ),
      );
}
