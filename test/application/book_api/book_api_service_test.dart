import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:readly/data/datasources/book_api_service.dart';
import 'package:readly/data/models/book_model.dart';

import 'book_api_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late BookApiService apiService;

  setUp(() {
    mockDio = MockDio();
    apiService = BookApiService(dio: mockDio);
  });

  test('fetchBooks doğru veri döner', () async {
    final mockResponse = {
      "data": [
        {
          "id": 1,
          "Title": "Test Book",
          "Year": 2023,
          "Publisher": "Test Yayın",
          "ISBN": "1234567890",
          "Pages": 300,
          "created_at": "2023-01-01T00:00:00.000Z",
          "Notes": ["Note 1"],
          "villains": [
            {"name": "Kötü Adam"}
          ]
        }
      ]
    };

    when(mockDio.get('/books')).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: '/books'),
        data: mockResponse,
        statusCode: 200,
      ),
    );

    final result = await apiService.fetchBooks();

    expect(result, isA<List<BookModel>>());
    expect(result.length, 1);
    expect(result[0].title, "Test Book");
  });
}
