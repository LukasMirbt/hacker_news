import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/version/version.dart';
import 'package:version_repository/version_repository.dart';

class VersionBloc extends Bloc<VersionEvent, VersionState> {
  VersionBloc({
    required VersionRepository versionRepository,
  }) : _repository = versionRepository,
       super(VersionState()) {
    on<VersionStarted>(_onStarted);
  }

  final VersionRepository _repository;

  Future<void> _onStarted(
    VersionStarted event,
    Emitter<VersionState> emit,
  ) async {
    final currentVersion = await _repository.currentVersion();

    emit(
      state.copyWith(
        version: VersionModel(currentVersion),
      ),
    );
  }
}
