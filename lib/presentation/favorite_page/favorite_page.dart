import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:search_repo/domain/export.dart';
import 'package:search_repo/shared/export.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = 'favorite_page';

  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc()..add(LoadFavoriteItemsEvent()),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              bottomOpacity: 5,
              title: Text(
                'Favorite repos list',
                style: AppTextStyles.black16Bold600,
              ),
              leading: Transform.scale(
                scale: 0.7,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset(
                        AppIcons.backIcon,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  if (state is LoadFavoriteState && state.favoriteRepos != null)
                    if ((state.favoriteRepos ?? []).isEmpty)
                      const EmptyBox(text: AppConstants.noFavoriteRepo)
                    else
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, int index) {
                            return ResultBox(
                              name: state.favoriteRepos![index].name,
                              onTap: () {
                                BlocProvider.of<FavoriteBloc>(context).add(
                                  SelectFavoriteEvent(index: index),
                                );
                              },
                              isFavorite: state.favoriteRepos![index].isFavorite,
                            );
                          },
                          separatorBuilder: (context, int index) {
                            return const SizedBox(height: 5);
                          },
                          itemCount: state.favoriteRepos!.length,
                        ),
                      )
                  else
                    const Center(
                      child: CupertinoActivityIndicator(),
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
