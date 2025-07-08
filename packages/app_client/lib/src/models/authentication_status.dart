enum AuthenticationStatus {
  unknown,
  unauthenticated,
  authenticated;

  bool get isUnknown => this == unknown;
  bool get isAuthenticated => this == authenticated;
  bool get isUnauthenticated => this == unauthenticated;
}
