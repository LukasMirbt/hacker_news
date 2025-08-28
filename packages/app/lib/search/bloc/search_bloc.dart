import 'package:app/search/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';

class SearchBloc extends Bloc<SearchEvent, void> {
  SearchBloc({
    required LinkLauncher linkLauncher,
  }) : _launcher = linkLauncher,
       super(null) {
    on<SearchExternalLinkPressed>(_onExternalLinkPressed);
  }

  final LinkLauncher _launcher;

  void _onExternalLinkPressed(
    SearchExternalLinkPressed event,
    Emitter<void> emit,
  ) {
    _launcher.launch(
      event.url.toString(),
    );
  }
}
