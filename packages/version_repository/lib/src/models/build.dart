abstract class Build {
  static int? maybeFrom(String buildNumber) => int.tryParse(buildNumber);
}
