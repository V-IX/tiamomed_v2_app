import '../../../../utils/api_client/api_client.dart';

class ClientSearchApiService {
  ClientSearchApiService({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<String>> getSearchItem(String text) async {
    final List<String> items = <String>[
      'test 1',
      'test 2',
      'test 3',
      'test 4',
      'test 5',
      'test 6',
      'test 7',
      'test 8',
      'test 9',
      'test 10',
    ];

    return items;

  }
}
