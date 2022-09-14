import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class MiniNewsCard extends StatelessWidget {
  final String? image, title, tag, author, date;
  final Duration duration;
  final double opacity;

  const MiniNewsCard({
    Key? key,
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
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: image ??
                "https://images.pexels.com/photos/3735747/pexels-photo-3735747.jpeg",
            placeholder: (context, url) => const Center(
              child: CupertinoActivityIndicator(),
            ),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            width: 114,
            height: 120,
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: duration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tag ?? "Tag",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        date ?? "Date",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title ?? "Title",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(height: 1.3),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    author ?? "Author",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.w600,
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
