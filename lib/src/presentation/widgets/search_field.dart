import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../config/colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      strutStyle: StrutStyle.disabled,
      autofocus: false,
      style: Theme.of(context).textTheme.bodyText1,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.6,
            color: AppColors.gray,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.6,
            color: AppColors.gray,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        hintText: "Find articles, channels...",
        hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: AppColors.gray,
            ),
        isDense: true,
        isCollapsed: true,
        contentPadding: const EdgeInsets.fromLTRB(18, 22, 18, 20),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SvgPicture.asset(
            "assets/icons/search.svg",
            width: 22,
            height: 22,
            color: AppColors.black,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minHeight: 20,
          minWidth: 20,
        ),
      ),
    );
  }
}
