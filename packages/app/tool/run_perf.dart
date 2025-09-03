// ignore_for_file: avoid_print

import 'dart:io';

import 'package:path/path.dart';

Future<void> main() async {
  const runCount = 5;
  final resultsDir = Directory('performance_results');

  // 1. Clean up old results
  if (resultsDir.existsSync()) {
    print('Cleaning up old results...');
    await resultsDir.delete(recursive: true);
  }
  await resultsDir.create();
  print('Starting performance test runs...');

  // 2. Loop and run tests
  for (var i = 1; i <= runCount; i++) {
    print('\n=============== Starting Run $i of $runCount ===============');

    final process = await Process.start(
      'flutter',
      [
        'drive',
        '--driver=test_driver/perf_driver.dart',
        '--target=integration_test/feed_test.dart',
        '--profile',
        '--no-dds',
        '--no-pub',
      ],
      // Pass the run number as an environment variable
      environment: {'RUN_NUMBER': '$i'},
      // Run in shell to find `flutter` command correctly
      runInShell: true,
    );

    // Pipe the output from the flutter process to the console
    await stdout.addStream(process.stdout);
    await stderr.addStream(process.stderr);

    final exitCode = await process.exitCode;
    if (exitCode != 0) {
      print('Run $i failed with exit code $exitCode');
      exit(1);
    }

    // 3. Move the results
    final timelineFile = File('build/scrolling_timeline_$i.timeline.json');
    final summaryFile = File(
      'build/scrolling_timeline_$i.timeline_summary.json',
    );

    if (timelineFile.existsSync() && summaryFile.existsSync()) {
      final timelineDestPath = join(
        resultsDir.path,
        basename(timelineFile.path),
      );
      final summaryDestPath = join(
        resultsDir.path,
        basename(summaryFile.path),
      );

      await timelineFile.rename(timelineDestPath);
      await summaryFile.rename(summaryDestPath);
    } else {
      print('Error: Could not find timeline files in the "build" directory.');
      exit(1);
    }

    print('=============== Finished Run $i of $runCount ===============');
  }
  print(
    '\nAll $runCount runs complete. Results are in the '
    "'${resultsDir.path}' directory.",
  );
}
