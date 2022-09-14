import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../config/colors.dart';
import '../../presentation/widgets/custom_chip.dart';

class HeadlineCard extends StatelessWidget {
  final String? chipTitle, image, title, tag, author, date;
  final Duration duration;
  final double opacity;

  const HeadlineCard({
    Key? key,
    this.chipTitle,
    this.image,
    this.title,
    this.tag,
    this.author,
    this.date,
    required this.duration,
    required this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: image ??
                "https://images.pexels.com/photos/3150271/pexels-photo-3150271.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            placeholder: (context, url) => const Center(
              child: CupertinoActivityIndicator(),
            ),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          AnimatedOpacity(
            opacity: opacity,
            duration: duration,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 28,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.black.withOpacity(0),
                    AppColors.black.withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  CustomChip(
                    title: chipTitle ?? "Chip Title",
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title ?? "Plastic Waste Threatens Aquatic Life",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          height: 1.32,
                          color: AppColors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
