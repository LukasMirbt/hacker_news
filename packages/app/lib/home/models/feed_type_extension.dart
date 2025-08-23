import 'package:app/l10n/l10n.dart';
import 'package:feed_repository/feed_repository.dart';

extension FeedTypeExtension on FeedType {
  String title(AppLocalizations l10n) {
    return switch (this) {
      FeedType.top => l10n.home_topTab,
      FeedType.newest => l10n.home_newTab,
      FeedType.past => l10n.home_pastTab,
      FeedType.ask => l10n.home_askTab,
      FeedType.show => l10n.home_showTab,
      FeedType.jobs => l10n.home_jobsTab,
      FeedType.whoIsHiring => l10n.home_whoIsHiringTab,
    };
  }
}
