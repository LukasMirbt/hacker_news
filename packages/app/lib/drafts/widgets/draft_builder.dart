import 'package:app/drafts/widgets/draft_item.dart';
import 'package:flutter/widgets.dart';

class DraftBuilder {
  const DraftBuilder();

  Widget itemBuilder(BuildContext context, int index) {
    return DraftItem(index: index);
  }
}
