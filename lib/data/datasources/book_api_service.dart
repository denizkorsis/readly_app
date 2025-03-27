import 'package:dio/dio.dart';
import '../models/book_model.dart';

class BookApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://stephen-king-api.onrender.com/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      responseType: ResponseType.json,
    ),
  );

  Future<List<BookModel>> fetchBooks() async {
    try {
      final response = await _dio.get('/books');

      final data = response.data as Map<String, dynamic>;
      final List<dynamic> booksJson = data['data'] as List<dynamic>;
      return booksJson
          .map((book) => BookModel.fromJson(book as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception(
            'Sunucuya bağlanılamadı. Lütfen internetinizi kontrol edin.');
      } else if (e.response != null) {
        throw Exception('Sunucu hatası: ${e.response?.statusCode}');
      } else {
        throw Exception('Beklenmeyen bir hata oluştu: ${e.message}');
      }
    } catch (e) {
      throw Exception('Bir hata oluştu: $e');
    }
  }
}
