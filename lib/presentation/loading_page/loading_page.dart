import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_repo/presentation/export.dart';
import 'package:search_repo/shared/export.dart';

class LoadingPage extends StatefulWidget {
  static const routeName = '/loading_page';
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, SearchPage.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: AppColors.blue,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Search App', style: AppTextStyles.white16Bold600,),
          const SizedBox(height: 10,),
          const CupertinoActivityIndicator(),
        ],),
      ),
    );
  }
}
