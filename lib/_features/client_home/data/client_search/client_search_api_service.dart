import 'package:dio/dio.dart';

import '../../../../constants/urls.dart';
import '../../../../utils/api_client/api_client.dart';
import '../../models/client_search_item.dart';

class ClientSearchApiService {
  ClientSearchApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<ClientSearchItem>> getSearchItems(String text) async {
    final Response<dynamic> response = await _apiClient.get(
      '$getClientSearchItemsUrl?search=$text',
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      return (data['items'] as List<dynamic>)
          .map((dynamic item) => ClientSearchItem.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    return <ClientSearchItem>[];
  }
}
