import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_application/data/data.dart';
import 'package:flutter_application/domain/domain.dart';

class TopJobsRepository extends TopJobsRepositoryInterface {
  TopJobsRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<Article>> getTopJobs() async {
    try {
      final Response response = await dio.get(
        Endpoints.topJob,
        queryParameters: {
          'page': '1',
          'per_page': '20',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> items = response.data['items'] ?? [];
        return items.map((e) => Article.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load jobs: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }
}