import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_repo/domain/export.dart';
import 'package:search_repo/presentation/export.dart';
import 'package:search_repo/shared/export.dart';

class SearchPage extends StatefulWidget {
  static const routeName = 'search_page';

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController textController = TextEditingController();
  final historyList = SearchHistoryCase().getSearchHistory().toList();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                centerTitle: true,
                bottomOpacity: 5,
                title: Text(
                  'Github repos list',
                  style: AppTextStyles.black16Bold600,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, FavoritePage.routeName);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset(
                            AppIcons.starBoldIcon,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                children: [
                  SearchField(
                    onSubmitted: (String value) {
                      BlocProvider.of<SearchBloc>(context).add(SearchEvent(value));
                      SearchHistoryCase().saveSearchHistory(textController.text);
                    },
                    focusNode: FocusNode(),
                    textEditingController: textController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state is SearchResultsState && state.repos != null)
                    Text(
                      'What we have found',
                      style: AppTextStyles.blue16Bold600,
                    )
                  else if (state is SearchResultsState && state.repos == null)
                    const SizedBox()
                  else
                    Text(
                      'Search History',
                      style: AppTextStyles.blue16Bold600,
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state is SearchResultsState && state.repos != null)
                    if ((state.repos ?? []).isEmpty) ...[
                      const SizedBox(
                        height: 150,
                      ),
                      const EmptyBox(text: AppConstants.noResult)
                    ] else
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 15,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                        itemBuilder: (context, index) {
                          return ResultBox(
                            onTap: () {
                              BlocProvider.of<SearchBloc>(context)
                                  .add(SelectFavorite(index: index));
                            },
                            name: state.repos![index].name,
                            isFavorite: state.repos![index].isFavorite,
                          );
                        },
                      )
                  else if (state is SearchResultsState && state.repos == null)
                    const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  else if (historyList.isNotEmpty)
                    SearchHistoryList(
                      historyList: historyList,
                    )
                  else ...[
                    const SizedBox(
                      height: 150,
                    ),
                    const EmptyBox(
                      text: AppConstants.emptyHistory,
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
