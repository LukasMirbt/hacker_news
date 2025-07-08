class ItemPress {
  ItemPress({
    required this.id,
    required this.urlHost,
    required this.url,
  });

  const ItemPress._({
    required this.id,
    required this.urlHost,
    required this.url,
  });

  static const initial = ItemPress._(
    id: '',
    urlHost: null,
    url: '',
  );

  final String id;
  final String? urlHost;
  final String url;
}
