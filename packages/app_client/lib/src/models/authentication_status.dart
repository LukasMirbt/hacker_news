enum AuthenticationStatus {
  initial,
  networkError,
  unauthenticated,
  authenticated;

  bool get isInitial => this == initial;
  bool get isNetworkError => this == networkError;
  bool get isAuthenticated => this == authenticated;
  bool get isUnauthenticated => this == unauthenticated;
}
