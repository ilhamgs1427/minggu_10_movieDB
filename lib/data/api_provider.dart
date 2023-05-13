import 'dart:convert';
import 'package:minggu_10_moviedb/model/popular_movies.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  String apiKey = '0a29f47782ec7ab6510a3d5dd2037baa';
  String baseUrl = 'https://api.themoviedb.org/3';

  http.Client client = http.Client();

  Future<PopularMovies?> getPopularMovies() async {
    http.Response response =
        await client.get('$baseUrl/movie/popular?api_key=$apiKey');
    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
