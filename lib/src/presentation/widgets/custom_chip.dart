import 'package:flutter/material.dart';

import '../../config/colors.dart';

class CustomChip extends StatelessWidget {
  final String? title;
  const CustomChip({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      padding: const EdgeInsets.fromLTRB(12, 11, 12, 9),
      child: Text(
        title ?? "Chip Title",
        style: Theme.of(context).textTheme.caption?.copyWith(
              color: AppColors.white,
            ),
      ),
    );
  }
}
