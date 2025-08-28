class ClientFeedback {
  ClientFeedback({
    required this.id,
    required this.date,
    required this.rating,
    required this.text,
    required this.imagesUrl,
  });

  final String id;
  final String date;
  final int rating;
  final String text;
  final List<String> imagesUrl;
}
