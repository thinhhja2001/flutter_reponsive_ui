import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/config/responsive.dart';

import '../style/colors.dart';
import '../style/style.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PrimaryText(
                text: 'Dashboard',
                size: 30.0,
                fontWeight: FontWeight.w800,
              ),
              PrimaryText(
                text: 'Payments updates',
                size: 16.0,
                fontWeight: FontWeight.w800,
                color: AppColors.secondary,
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
            flex: Responsive.isDesktop(context) ? 1 : 2,
            child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding:
                        const EdgeInsets.only(left: 40.0, right: 5.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: AppColors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.black,
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                        color: AppColors.secondary, fontSize: 14.0))))
      ],
    );
  }
}
