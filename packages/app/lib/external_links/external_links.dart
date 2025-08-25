const yapPrivacyPolicyLink =
    'https://lukasmirbt.github.io/hacker_news/privacy_policy.html';

const hackerNewsPrivacyPolicyLink =
    'https://www.ycombinator.com/legal/#privacy';

const hackerNewsTermsLink = 'https://www.ycombinator.com/legal/#tou';

String hackerNewsItemLink({required String id}) {
  final encodedId = Uri.encodeQueryComponent(id);
  return 'https://news.ycombinator.com/item?id=$encodedId';
}

String searchLink({required String query}) {
  final encodedQuery = Uri.encodeQueryComponent(query);
  return 'https://hn.algolia.com/?q=$encodedQuery';
}
