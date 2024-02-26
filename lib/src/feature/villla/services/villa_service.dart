import 'package:dio/dio.dart';

import '../../../core/constant/app_constant.dart';
import '../../../core/models/villa_models.dart';

class VillaService {
  Dio dio = Dio();

  Future<VillaResponse> fetchVilla(String id) async {
    try {
      final response = await dio.get('${AppConstants.apiUrl}/villas/$id');

      if (response.statusCode == 200) {
        // Parse the JSON response using the VillaResponse model
        return VillaResponse.fromJson(response.data);
      } else {
        // If the API returns an error status code, throw an exception
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors, including DioError for network-related issues
      throw Exception('Error: $error');
    }
  }
}
