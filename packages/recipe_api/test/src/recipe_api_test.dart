// ignore_for_file: prefer_const_constructors,
// ignore_for_file: inference_failure_on_function_invocation

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe_api/recipe_api.dart';

import 'sample_data.dart';

class MockDioClient extends Mock implements Dio {
  @override
  BaseOptions options = BaseOptions();
}

class MockResponse extends Mock implements Response<dynamic> {}

class MockResponseBody extends Mock implements ResponseBody {}

class FakeUri extends Fake implements Uri {}

class FakeRequestOptions extends Fake implements RequestOptions {}

void main() {
  group('RecipeApi', () {
    late MockDioClient dioClient;
    late RecipeApi recipeApi;

    setUpAll(() {
      registerFallbackValue(FakeUri());
      registerFallbackValue(FakeRequestOptions());
    });

    setUp(() {
      dioClient = MockDioClient();
      recipeApi = RecipeApi(dioClient: dioClient);
    });

    test('can be instantiated', () {
      expect(RecipeApi(), isNotNull);
    });

    group('constructor', () {
      test('does not require an dioClient', () {
        expect(RecipeApi(), isNotNull);
      });
    });

    group('categories', () {
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn('[]');

        try {
          await recipeApi.fetchCategories();
        } catch (_) {}
        verify(
          () => dioClient.get(
            '/list.php',
            queryParameters: {
              'c': 'list',
            },
          ),
        ).called(1);
      });

      test('returns Categories on valid response', () async {
        final response = MockResponse();

        when(() => response.statusCode).thenReturn(200);
        when(() => response.data)
            .thenReturn(jsonDecode(sampleCategoriesJsonString));
        when(
          () => dioClient.get(
            any(),
            queryParameters: {
              'c': 'list',
            },
          ),
        ).thenAnswer((_) async => response);
        final actual = await recipeApi.fetchCategories();
        expect(
          actual,
          isA<Categories>()
              .having((l) => l.categories, 'categories', isA<List<Category>>()),
        );
      });
    });

    group('fetchFilters', () {
      const filterType = FilterType.category;

      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn('[]');

        try {
          await recipeApi.fetchFilters(filterType);
        } catch (_) {}
        verify(
          () => dioClient.get(
            '/list.php',
            queryParameters: {
              filterType.queryField: 'list',
            },
          ),
        ).called(1);
      });

      test('returns Filters on valid response', () async {
        final response = MockResponse();

        when(() => response.statusCode).thenReturn(200);
        when(() => response.data)
            .thenReturn(jsonDecode(sampleCategoriesJsonString));
        when(
          () => dioClient.get(
            any(),
            queryParameters: {
              filterType.queryField: 'list',
            },
          ),
        ).thenAnswer((_) async => response);
        final actual = await recipeApi.fetchFilters(filterType);
        expect(
          actual,
          isA<Filters>()
              .having((f) => f.filters, 'filters list', isA<List<Filter>>()),
        );
      });
    });

    group('fetchRecipesByFilter', () {
      const mockQuery = 'MockQuery';
      const filterType = FilterType.category;
      final queryField = filterType.queryField;

      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn('[]');

        try {
          await recipeApi.fetchRecipesByFilter(
            query: mockQuery,
            filterType: filterType,
          );
        } catch (_) {}
        verify(
          () => dioClient.get(
            '/filter.php',
            queryParameters: {
              queryField: mockQuery,
            },
          ),
        ).called(1);
      });

      test('returns Recipes on valid response', () async {
        final response = MockResponse();

        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn(jsonDecode(sampleJsonString));
        when(
          () => dioClient.get(
            '/filter.php',
            queryParameters: {
              queryField: mockQuery,
            },
          ),
        ).thenAnswer((_) async => response);
        final actual = await recipeApi.fetchRecipesByFilter(
          query: mockQuery,
          filterType: filterType,
        );

        expect(
          actual,
          isA<Recipes>()
              .having((l) => l.recipes, 'categories', isA<List<Recipe>>()),
        );
      });
    });

    group('fetchRecipeById', () {
      const mockId = '123';

      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn('[]');

        try {
          await recipeApi.fetchRecipeById(id: mockId);
        } catch (_) {}
        verify(
          () => dioClient.get(
            '/lookup.php',
            queryParameters: {
              'i': mockId,
            },
          ),
        ).called(1);
      });

      test('returns Recipes on valid response', () async {
        final response = MockResponse();

        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn(jsonDecode(sampleJsonString));
        when(
          () => dioClient.get(
            '/lookup.php',
            queryParameters: {
              'i': mockId,
            },
          ),
        ).thenAnswer((_) async => response);
        final actual = await recipeApi.fetchRecipeById(
          id: mockId,
        );

        expect(actual, isA<Recipe>());
      });
    });
  });
}
