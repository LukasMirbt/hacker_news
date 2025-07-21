class ThreadItemOptionsEvent {
  const ThreadItemOptionsEvent();
}

final class ThreadItemOptionsContextPressed extends ThreadItemOptionsEvent {
  const ThreadItemOptionsContextPressed({
    required this.postId,
  });

  final String postId;
}
