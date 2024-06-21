import '../../models/article_summary_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../generated/l10n.dart';
import '../../models/services/api_service.dart';
import '../../widgets/button.dart';
import 'Ai_bot.dart';

class ArticleListScreen extends StatefulWidget {
  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List> _articles;
  final _keywordController = TextEditingController();
  late List<ArticleSummaryModel> _articlesDetails = [];

  @override
  void initState() {
    super.initState();
    _articles = _apiService.fetchArticles(keyword: 'CANCER ARTICLE');
  }

  void _searchArticles() {
    setState(() {
      _articles = _apiService.fetchArticles(keyword: _keywordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));  },child: Image.asset("images/technical-support.png"),),
      appBar: AppBar(
        title:  Text( S.of(context).PubMed_Articles),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyButton(
              label: S.of(context).Generate_Presentations,
              onTap: () async {
                final _url = Uri.parse(
                    "https://www.canva.com/templates/?query=medical-presentations");

                if (!await launchUrl(_url)) {
                  throw Exception('Could not launch$_url');
                }
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _keywordController,
              onChanged: (val) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: S.of(context).Search_Keyword ,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchArticles,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<ArticleSummaryModel>>(
              future: () async {
                await _articles.then((value) async => _articlesDetails =
                    await _apiService.fetchArticlesDetails(
                        value.toList().cast<String>() ?? []));
                return _articlesDetails;
              }(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No articles found.'));
                }

                final articles = snapshot.data!;
                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = _articlesDetails[index];
                    return CustomArticleWidget(articleSummaryModel: article);
                    // return ListTile(
                    //   title: Text(article.title),
                    //   subtitle: Text(article.authors),
                    //   onTap: () {
                    //     // Optionally, navigate to a detail page
                    //   },
                    // );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomArticleWidget extends StatefulWidget {
  const CustomArticleWidget({
    Key? key,
    required this.articleSummaryModel,
  }) : super(key: key);

  final ArticleSummaryModel articleSummaryModel;

  @override
  State<CustomArticleWidget> createState() => _CustomArticleWidgetState();
}

class _CustomArticleWidgetState extends State<CustomArticleWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.articleSummaryModel.result?.data?.title ?? "").isEmpty) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.articleSummaryModel.result?.data?.title ?? "",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          widget.articleSummaryModel.result?.data?.authors?.isNotEmpty ?? false
              ? Text(
                  widget.articleSummaryModel.result?.data?.authors?.first
                          .name ??
                      "",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal))
              : const SizedBox(),
        ],
      ),
    );
  }
}
