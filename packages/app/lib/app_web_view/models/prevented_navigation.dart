class PreventedNavigation {
  PreventedNavigation(this.url);

  static final empty = PreventedNavigation(Uri());

  final Uri url;
}
