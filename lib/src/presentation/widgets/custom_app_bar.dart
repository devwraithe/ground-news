import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:cached_network_image/cached_network_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome,",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 6),
                Text(
                  "Mr Reeves",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            CachedNetworkImage(
              imageUrl:
                  "https://i.pinimg.com/originals/39/26/db/3926db089d7af5fa91711db1dbb82b7c.jpg",
              placeholder: (context, url) => const Center(
                child: CupertinoActivityIndicator(),
              ),
              width: 48,
              height: 48,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(88);
}
