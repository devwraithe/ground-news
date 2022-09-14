import 'package:flutter/material.dart';
import 'package:news_app/src/presentation/widgets/scroll_behaviour.dart';
import 'src/config/colors.dart';
import 'src/presentation/views/home.dart';
import "src/config/routes.dart" as routes;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GroundNews());
}

class GroundNews extends StatelessWidget {
  const GroundNews({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: ScrollBehaviour(),
      title: "Ground News",
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      theme: ThemeData(
        fontFamily: "Helvetica Neue",
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.transparent,
        textTheme: const TextTheme(
          headline5: TextStyle(
            fontSize: 25.63,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          headline6: TextStyle(
            fontSize: 22.78,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          subtitle1: TextStyle(
            fontSize: 20.25,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          subtitle2: TextStyle(
            fontSize: 18.00,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          bodyText1: TextStyle(
            fontSize: 16.00,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          bodyText2: TextStyle(
            fontSize: 14.00,
            fontWeight: FontWeight.w500,
            color: AppColors.gray,
          ),
          caption: TextStyle(
            fontSize: 12.00,
            fontWeight: FontWeight.w500,
            color: AppColors.gray,
          ),
        ),
      ),
      home: const Home(),
      onGenerateRoute: routes.controller,
      initialRoute: routes.home,
    );
  }
}
