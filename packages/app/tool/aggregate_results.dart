// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

class Stats {
  Stats(List<num> values)
    : average = _calculateAverage(values),
      stdDev = _calculateStdDev(values, _calculateAverage(values)),
      min = values.reduce((a, b) => a < b ? a : b).toDouble(),
      max = values.reduce((a, b) => a > b ? a : b).toDouble();

  final double average;
  final double stdDev;
  final double min;
  final double max;

  static double _calculateAverage(List<num> values) {
    if (values.isEmpty) return 0;
    return values.reduce((a, b) => a + b) / values.length;
  }

  static double _calculateStdDev(List<num> values, double mean) {
    if (values.length < 2) return 0;
    final sumOfSquares = values
        .map((value) => (value - mean) * (value - mean))
        .reduce((a, b) => a + b);
    return sumOfSquares / (values.length - 1);
  }
}

Future<void> main() async {
  const resultsDir = 'performance_results';
  const metricsToAggregate = [
    'average_frame_build_time_millis',
    'average_frame_rasterizer_time_millis',
    'missed_frames',
    'worst_frame_build_time_millis',
    'worst_frame_rasterizer_time_millis',
  ];

  final allMetrics = <String, List<num>>{
    for (final key in metricsToAggregate) key: [],
  };

  final dir = Directory(resultsDir);
  if (!dir.existsSync()) {
    print('Error: Directory "$resultsDir" not found.');
    return;
  }

  final files = await dir
      .list()
      .where((entity) => entity.path.endsWith('.timeline_summary.json'))
      .toList();

  if (files.isEmpty) {
    print('No summary files found in "$resultsDir".');
    return;
  }

  for (final fileEntity in files) {
    final file = File(fileEntity.path);
    final content = await file.readAsString();
    final data = json.decode(content) as Map<String, dynamic>;
    for (final key in metricsToAggregate) {
      if (data.containsKey(key)) {
        allMetrics[key]!.add(data[key] as num);
      }
    }
  }

  print('--- Aggregated Results (from ${files.length} runs) ---\n');

  for (final entry in allMetrics.entries) {
    final key = entry.key;
    final values = entry.value;
    if (values.isEmpty) continue;

    final stats = Stats(values);
    print('Metric: $key');
    print('  Average: ${stats.average.toStringAsFixed(2)}');
    print(
      '  Std Dev: ${stats.stdDev.toStringAsFixed(2)} '
      '(lower is more consistent)',
    );
    print('  Min:     ${stats.min.toStringAsFixed(2)} (best run)');
    print('  Max:     ${stats.max.toStringAsFixed(2)} (worst run)');
    print('-' * 20);
  }
}
