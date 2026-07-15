import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/features/home/data/model/home_category_model.dart';
import 'package:day_i/features/home/data/model/home_suggested_service_model.dart';

abstract class HomeDataSource {
  Future<List<HomeCategoryModel>> getCategories();
  Future<List<HomeSuggestedServiceModel>> getSuggestedServices();
}

class HomeDataSourceImpl implements HomeDataSource {
  final IApiService apiService;

  HomeDataSourceImpl({required this.apiService});

  List<dynamic> _extractList(dynamic responseData) {
    if (responseData is List) {
      return responseData;
    }
    if (responseData is Map) {
      final data = responseData['data'] ??
          responseData['services'] ??
          responseData['categories'];
      if (data is List) {
        return data;
      }
    }
    return [];
  }

  @override
  Future<List<HomeCategoryModel>> getCategories() async {
    final result = await apiService.get(ApiConstants.services);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (response) {
        final data = _extractList(response.data);
        return data.map((e) => HomeCategoryModel.fromJson(e)).toList();
      },
    );
  }

  @override
  Future<List<HomeSuggestedServiceModel>> getSuggestedServices() async {
    final result = await apiService.get(ApiConstants.homeServices);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (response) {
        final data = _extractList(response.data);
        return data.map((e) => HomeSuggestedServiceModel.fromJson(e)).toList();
      },
    );
  }
}
