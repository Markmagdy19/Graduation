import 'dart:convert';
import 'package:http/http.dart' as http;

import '../article_summary_model.dart';

class ApiService {
  static const String _baseUrl =
      'https://eutils.ncbi.nlm.nih.gov/entrez/eutils';

  Future<List> fetchArticles({
    required String keyword,
    int maxResults = 10,
    String sort = 'relevance',
    String? field,
    String? datetype,
    int? reldate,
    String? mindate,
    String? maxdate,
  }) async {
    final searchResponse = await http
        .get(Uri.parse(
            "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=$keyword&retmax=20&retstart=0&retmode=json&sort=pub+date&datetype=pdat&reldate=365&mindate=2023%2F01%2F01&maxdate=2023%2F12%2F31"))
        .timeout(Duration(seconds: 5));
    final searchData = json.decode(searchResponse.body);
    final idList = (searchData['esearchresult']['idlist'] as List)
        .map((id) => id.toString())
        .toList();

    return idList;
  }

  Future<ArticleSummaryModel> fetchArticleDetails(String articleId) async {
    late final searchData;
    try {
      final searchResponse = await http.get(
          Uri.parse(
            "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=$articleId&retmode=json",
          ),
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*'
          }).timeout(Duration(seconds: 5));
      searchData = searchResponse.body;

      final articleSummary =
          ArticleSummaryModel.fromJson(jsonDecode(searchData));
      return articleSummary;
    } catch (e) {
      throw Exception(
          'Failed to fetch article details for ID $articleId: ${e.toString()}');
    }
  }

  Future<List<ArticleSummaryModel>> fetchArticlesDetails(
      List<String> articleIds,
      {int batchSize = 10}) async {
    List<ArticleSummaryModel> articles = [];
    for (int i = 0; i < articleIds.length; i += batchSize) {
      final batchIds = articleIds.sublist(
          i,
          i + batchSize > articleIds.length
              ? articleIds.length
              : i + batchSize);
      List<ArticleSummaryModel> batchArticles = [];
      try {
        batchArticles = await Future.wait(batchIds.map(fetchArticleDetails));
      } catch (e) {
        print(e);
      } //(e) {print(e);}
      articles.addAll(batchArticles);
    }
    return articles;
  }
}
