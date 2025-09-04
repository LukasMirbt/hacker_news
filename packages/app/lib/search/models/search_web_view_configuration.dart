import 'package:app/app_web_view/app_web_view.dart';
import 'package:web_links/web_links.dart';

class SearchWebViewConfiguration extends AppWebViewConfiguration {
  SearchWebViewConfiguration({
    WebLinks links = const WebLinks(),
  }) : super(
         initialUrl: links.searchUrl,
         onNavigationRequest: (url) {
           final isPost = links.isPost(url);
           if (isPost) return NavigationDecision.prevent;

           final isHackerNews = links.isHackerNews(url);
           if (isHackerNews) return NavigationDecision.navigate;

           final isSearch = links.isSearch(url);
           if (isSearch) return NavigationDecision.navigate;

           return NavigationDecision.prevent;
         },
       );
}
