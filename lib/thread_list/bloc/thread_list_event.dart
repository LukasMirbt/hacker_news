sealed class ThreadListEvent {
  const ThreadListEvent();
}

final class ThreadListStarted extends ThreadListEvent {
  const ThreadListStarted();
}

final class ThreadListBottomReached extends ThreadListEvent {
  const ThreadListBottomReached();
}

final class ThreadListRefreshTriggered extends ThreadListEvent {
  const ThreadListRefreshTriggered();
}

final class ThreadListLinkPressed extends ThreadListEvent {
  const ThreadListLinkPressed(this.url);

  final String url;
}
