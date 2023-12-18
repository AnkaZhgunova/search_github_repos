import 'package:flutter/cupertino.dart';
import 'package:search_repo/shared/export.dart';

class SearchHistoryList extends StatelessWidget {
  final List<String> historyList;
  const SearchHistoryList({required this.historyList, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: historyList.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ResultBox(
          name: historyList[index],
          onTap: () {},
          isFavorite: false,
        );
      },
    );
  }
}
