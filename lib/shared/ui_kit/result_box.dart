import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:search_repo/shared/export.dart';

class ResultBox extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  final bool isFavorite;
  const ResultBox({required this.name, required this.onTap, required this.isFavorite, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: AppTextStyles.black14Medium400,
            ),
            GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                AppIcons.starBoldIcon,
                color: isFavorite ? AppColors.blue : AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
