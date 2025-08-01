enum AuthenticationStatus {
  initial,
  unauthenticated,
  authenticated;

  bool get isAuthenticated => this == authenticated;
  bool get isUnauthenticated => this == unauthenticated;
}
