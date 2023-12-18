import 'package:search_repo/main.dart';

class SearchHistoryCase {
  static const _historyKey = "github.repos.search_history_key";
  SearchHistoryCase();

  List<String> getSearchHistory() {
    return sharedPreferences.getStringList(_historyKey) ?? [];
  }

  void saveSearchHistory(String searchString) {
    if (searchString.trim().isEmpty) return;
    final savedHistory = getSearchHistory();
    savedHistory.add(searchString.trim());
    sharedPreferences.setStringList(_historyKey, savedHistory);
  }
}
