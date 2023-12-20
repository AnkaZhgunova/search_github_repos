import 'package:flutter/cupertino.dart';
import 'package:search_repo/shared/export.dart';

class EmptyBox extends StatelessWidget {
  final String text;
  const EmptyBox({
    required this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text( text,
        style: AppTextStyles.grey14Medium400,
        textAlign: TextAlign.center,
      ),
    );
  }
}
