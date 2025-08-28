class ClientSeasonTicket {
  ClientSeasonTicket({
    required this.id,
    required this.validDate,
    required this.count,
    required this.url,
  });

  final String id;
  final String validDate;
  final String count;
  final String url;

  static ClientSeasonTicket fake() => ClientSeasonTicket(
    id: '12345',
    validDate: '2023-12-31',
    count: '10',
    url: 'asdasdasdasdasdasd asd asdsadsadas dsasdasdsasd',
  );
}
