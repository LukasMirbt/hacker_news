import 'package:equatable/equatable.dart';

sealed class SearchEvent {
  const SearchEvent();
}

final class SearchExternalLinkPressed extends SearchEvent with EquatableMixin {
  const SearchExternalLinkPressed(this.url);

  final Uri url;

  @override
  List<Object> get props => [url];
}
