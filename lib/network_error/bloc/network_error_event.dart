sealed class NetworkErrorEvent {
  const NetworkErrorEvent();
}

final class NetworkErrorRetryPressed extends NetworkErrorEvent {
  const NetworkErrorRetryPressed();
}
