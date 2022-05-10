import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/component/payment_list_tile.dart';
import 'package:flutter_responsive_ui/data.dart';
import 'package:flutter_responsive_ui/style/style.dart';

import '../config/size_config.dart';
import '../style/colors.dart';

class PaymentDetailList extends StatelessWidget {
  const PaymentDetailList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SizeConfig.blockSizeVertical! * 5),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: const [
                BoxShadow(
                    color: AppColors.iconGray,
                    blurRadius: 15.0,
                    offset: Offset(10.0, 15.0))
              ]),
          child: Image.asset("assets/card.png"),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
              text: 'Recent Activities',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: '08 May 2022',
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            )
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Column(
          children: List.generate(
              recentActivities.length,
              (index) => PaymentListTile(
                  icon: recentActivities[index]['icon'],
                  label: recentActivities[index]['label'],
                  amount: recentActivities[index]['amount'])),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
              text: 'Upcoming Payments',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: '14 June 2022',
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            )
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Column(
          children: List.generate(
              upcomingPayments.length,
              (index) => PaymentListTile(
                  icon: upcomingPayments[index]['icon'],
                  label: upcomingPayments[index]['label'],
                  amount: upcomingPayments[index]['amount'])),
        ),
      ],
    );
  }
}
