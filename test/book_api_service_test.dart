import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:readly/data/datasources/book_api_service.dart';
import 'package:readly/data/models/book_model.dart';

import 'book_api_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late BookApiService apiService;
  late MockDio
      mockDio; //: Gerçek sınıfların sahte versiyonlarını oluşturmaya yarıyormuş

  setUp(() {
    mockDio = MockDio();
    apiService = BookApiService(dio: mockDio);
  });

  group('BookApiService', () {
    test('fetchBooks returns list of BookModel when response is successful',
        () async {
      // arrange
      final mockResponse = Response(
        requestOptions: RequestOptions(path: '/books'),
        data: {
          'data': [
            {
              'id': 1,
              'Title': 'The Shining',
              'Year': 1977,
              'Publisher': 'Doubleday',
              'ISBN': '9780385121675',
              'Pages': 447,
              'Notes': ['Classic', 'Horror'],
              'created_at': '1977-01-01T00:00:00Z',
              'villains': [
                {
                  'name': 'Jack Torrance',
                  'url': 'https://example.com/jack-torrance.jpg'
                }
              ]
            }
          ]
        },
        statusCode: 200,
      );

      when(mockDio.get('/books')).thenAnswer((_) async => mockResponse);

      // act
      final result = await apiService.fetchBooks();

      // assert
      expect(result, isA<List<BookModel>>());
      expect(result.first.title, equals('The Shining'));
    });

    test('fetchBooks throws exception on DioException (connection timeout)',
        () async {
      // arrange
      when(mockDio.get('/books')).thenThrow(
        DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(path: '/books'),
        ),
      );

      // act & assert
      expect(
        () => apiService.fetchBooks(),
        throwsA(predicate((e) =>
            e is Exception && e.toString().contains('Sunucuya bağlanılamadı'))),
      );
    });

    test('fetchBooks throws generic exception on unknown error', () async {
      // arrange
      when(mockDio.get('/books')).thenThrow(Exception('Unknown error'));

      // act & assert
      expect(
        () => apiService.fetchBooks(),
        throwsA(predicate(
            (e) => e is Exception && e.toString().contains('Bir hata oluştu'))),
      );
    });
  });
}
