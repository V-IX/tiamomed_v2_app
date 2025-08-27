import 'dart:io';

String getFileSize(String path) {
  final File file = File(path);

  if (!file.existsSync()) {
    return 'Размер не определен';
  }

  final int bytes = file.lengthSync();
  return _formatBytes(bytes, 2); // 2 знака после запятой
}

String _formatBytes(int bytes, int decimals) {
  if (bytes == 0) {
    return '0 B';
  }
  const List<String> suffixes = <String>['B', 'KB', 'MB', 'GB', 'TB'];
  final int i = (bytes.bitLength / 10).floor(); // делим на 1024^i
  final double size = bytes / (1 << (10 * i));
  return '${size.toStringAsFixed(decimals)} ${suffixes[i]}';
}