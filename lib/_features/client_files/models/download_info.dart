class DownloadInfo {
  DownloadInfo({required this.stream, required this.totalBytes});

  final Stream<List<int>> stream;
  final int totalBytes;
}
