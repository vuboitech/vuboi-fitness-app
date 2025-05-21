String formatDuration(Duration duration) {
  String minutes = (duration.inMinutes).toString();
  String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
  if (minutes == '0') {
    return '$seconds sec';
  }
  return '$minutes min $seconds sec';
}