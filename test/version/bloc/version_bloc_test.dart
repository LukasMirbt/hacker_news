// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/version/version.dart';
import 'package:mocktail/mocktail.dart';
import 'package:version_repository/version_repository.dart';

class _MockVersionRepository extends Mock implements VersionRepository {}

void main() {
  final initialState = VersionState();

  group(VersionBloc, () {
    late VersionRepository repository;

    setUp(() {
      repository = _MockVersionRepository();
    });

    VersionBloc buildBloc() {
      return VersionBloc(
        versionRepository: repository,
      );
    }

    test('initial state is $VersionState', () {
      expect(buildBloc().state, initialState);
    });

    group(VersionStarted, () {
      final currentVersion = Version(1, 0, 0);
      final getCurrentVersion = () => repository.currentVersion();

      blocTest<VersionBloc, VersionState>(
        'emits $VersionModel',
        setUp: () {
          when(getCurrentVersion).thenAnswer((_) async => currentVersion);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            VersionStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            model: VersionModel(currentVersion),
          ),
        ],
        verify: (_) {
          verify(getCurrentVersion).called(1);
        },
      );
    });
  });
}
