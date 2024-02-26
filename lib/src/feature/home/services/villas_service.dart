import 'package:dio/dio.dart';

import '../../../core/constant/app_constant.dart';
import '../../../core/models/villa_blok_models.dart';
import '../../../core/models/villa_recommendation_models.dart';

class VillasService {
  Dio dio = Dio();

  Future<VillaRecommendationsReponse> fetchVillaRecommendations() async {
    try {
      final response =
          await dio.get('${AppConstants.apiUrl}/villas/rekomendasi');

      if (response.statusCode == 200) {
        return VillaRecommendationsReponse.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching villa recommendations: $error');
    }
  }

  Future<VillaBloksReponse> fetchVillaBloks() async {
    try {
      final response = await dio.get('${AppConstants.apiUrl}/villas/blok');

      if (response.statusCode == 200) {
        // Parse the JSON response using the VillaBloksReponse model
        return VillaBloksReponse.fromJson(response.data);
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
