import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../config/colors.dart';
import '../../data/news_model.dart';
import '../../presentation/widgets/custom_app_bar_two.dart';
import '../../presentation/widgets/custom_chip.dart';

class ReadNews extends StatelessWidget {
  final NewsModel? newsData;
  const ReadNews({
    super.key,
    this.newsData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarTwo(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                newsData!.title ?? "News Title",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(height: 1.32),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Row(
                  children: [
                    Text(
                      newsData!.author ?? "News Author",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.gray,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.gray,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: 6,
                        height: 6,
                      ),
                    ),
                    Text(
                      newsData!.date ?? "News Date",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.gray,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Hero(
                tag: newsData!.title as Object,
                child: CachedNetworkImage(
                  imageUrl: newsData!.image ??
                      "https://images.pexels.com/photos/3735747/pexels-photo-3735747.jpeg",
                  placeholder: (context, url) => const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  const CustomChip(
                    title: "10 min read",
                  ),
                  const SizedBox(width: 12),
                  CustomChip(
                    title: newsData!.tag,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Confirmed cases of COVID-19 have passed 608.6 million globally, according to Johns Hopkins University. The number of confirmed deaths has now passed 6.51 million. More than 12.63 billion vaccination doses have been administered globally, according to Our World in Data. New York state has ended its COVID-19 requirement that masks be worn on trains, buses and other modes of public transport – as well as in airports and ride-share vehicles. Pfizer has donated 100,000 courses of its COVID-19 antiviral treatment Paxlovid to a new group aiming to improve access to the drug in low and middle-income countries.",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.gray,
                      height: 1.5,
                    ),
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
