import 'package:draft_repository/draft_repository.dart';

sealed class DraftEvent {
  const DraftEvent();
}

final class DraftSubscriptionRequested extends DraftEvent {
  const DraftSubscriptionRequested();
}

final class DraftDeletePressed extends DraftEvent {
  const DraftDeletePressed(this.draft);

  final Draft draft;
}
