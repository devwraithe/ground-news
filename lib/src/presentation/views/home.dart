import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../config/colors.dart';
import '../../data/news_model.dart';
import '../../presentation/views/read_news.dart';
import '../../presentation/widgets/custom_app_bar.dart';
import '../../presentation/widgets/custom_snack.dart';
import '../../presentation/widgets/headline_card.dart';
import '../../presentation/widgets/mini_news_card.dart';
import '../../presentation/widgets/search_field.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SizedBox(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, value) {
            return [
              // search & breaking news
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // search
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: SearchField(),
                    ),
                    // breaking news
                    const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Breaking News",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      child: PageView.builder(
                        onPageChanged: (pos) {
                          setState(() {
                            _selectedIndex = pos;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        physics: const BouncingScrollPhysics(),
                        itemCount: NewsModel.breakingNews.length,
                        itemBuilder: (context, index) {
                          var scale = _selectedIndex == index ? 1.0 : 0.92;
                          return TweenAnimationBuilder(
                            tween: Tween(
                              begin: scale,
                              end: scale,
                            ),
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 350),
                            builder: (context, value, child) {
                              final breakingNews =
                                  NewsModel.breakingNews[index];
                              return Transform.scale(
                                scale: value,
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReadNews(
                                        newsData: breakingNews,
                                      ),
                                    ),
                                  ),
                                  child: Hero(
                                    tag: breakingNews.title as Object,
                                    child: HeadlineCard(
                                      chipTitle: "10 min read",
                                      title: breakingNews.title,
                                      image: breakingNews.image,
                                      opacity: animationOpacity,
                                      duration:
                                          const Duration(milliseconds: 1400),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
              // tab bar
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: AppColors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: Theme.of(context).textTheme.subtitle2,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                    labelColor: AppColors.black,
                    unselectedLabelColor: AppColors.gray,
                    controller: _tabController,
                    tabs: newsTabs,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
              ),
            ];
          },
          // Tab Bar View
          body: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Fetch all items in AllNews array
                    for (var allNews in NewsModel.allNews)
                      // Mini News Card
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadNews(
                              newsData: allNews,
                            ),
                          ),
                        ),
                        child: Hero(
                          tag: allNews.title as Object,
                          child: MiniNewsCard(
                            image: allNews.image,
                            author: allNews.author,
                            title: allNews.title,
                            tag: allNews.tag,
                            date: allNews.date,
                            opacity: animationOpacity,
                            duration: const Duration(milliseconds: 1400),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  "International News Coming Soon",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Center(
                child: Text(
                  "Business News Coming Soon",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Center(
                child: Text(
                  "Media News Coming Soon",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Center(
                child: Text(
                  "Nature News Coming Soon",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Center(
                child: Text(
                  "Science News Coming Soon",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Animations
  double animationOpacity = 0;
  void widgetAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1400));
    setState(() => animationOpacity = 1.0);
  }

  // Connectivity
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // PageView
  late PageController _pageController;
  int _selectedIndex = 1;

  // Tab Bar
  late TabController _tabController;
  static const List<Tab> newsTabs = <Tab>[
    Tab(text: 'All'),
    Tab(text: 'International'),
    Tab(text: 'Business'),
    Tab(text: 'Media'),
    Tab(text: 'Nature'),
    Tab(text: 'Science'),
  ];

  // Empty array to store Model data
  List allNews = [];
  List breakingNews = [];

  @override
  void initState() {
    // Animation
    widgetAnimation();
    super.initState();
    // PageView
    _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.88,
    );
    // TabBar
    _tabController = TabController(vsync: this, length: newsTabs.length);
    // Connectivity
    initiateConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initiateConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint('Couldn\'t check connectivity status => $e');
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(
      () {
        _connectionStatus = result;
        _connectionStatus == ConnectivityResult.wifi ||
                _connectionStatus == ConnectivityResult.mobile
            ? CustomSnack.buildSnackBar(
                "Internet is connected",
                Colors.green,
                context,
              )
            : CustomSnack.buildSnackBar(
                "Internet is not connected",
                Colors.red,
                context,
              );
      },
    );
  }
}
