class ScrollAnimator {
  const ScrollAnimator();

  Duration duration(double distance) {
    if (distance > 2000) return Duration.zero;

    final calculatedValue = (distance * 0.8).round();

    const min = 250;
    const max = 600;
    final clampedValue = calculatedValue.clamp(min, max);

    return Duration(milliseconds: clampedValue);
  }
}
