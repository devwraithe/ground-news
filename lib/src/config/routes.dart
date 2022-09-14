import 'package:flutter/material.dart';
import 'package:news_app/src/presentation/views/home.dart';
import 'package:news_app/src/presentation/views/read_news.dart';

const String home = "/";
const String readNews = "/readNews";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case home:
      return MaterialPageRoute(
        builder: (context) => const Home(),
      );
    case readNews:
      return MaterialPageRoute(
        builder: (context) => const ReadNews(),
      );
    default:
      throw ("route is unavailable :(");
  }
}
