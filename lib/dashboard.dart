import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/component/bar_chart_component.dart';
import 'package:flutter_responsive_ui/component/history_table.dart';
import 'package:flutter_responsive_ui/config/responsive.dart';
import 'package:flutter_responsive_ui/config/size_config.dart';
import 'package:flutter_responsive_ui/style/colors.dart';
import 'package:flutter_responsive_ui/style/style.dart';

import 'component/appbar_action_items.dart';
import 'component/header.dart';
import 'component/info_card.dart';
import 'component/payment_detail_list.dart';
import 'component/side_menu.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(
        width: 100,
        child: SideMenu(),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                onPressed: () {
                  _drawerKey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.black,
                ),
              ),
              actions: const [AppBarActionItems()],
            )
          : const PreferredSize(child: SizedBox(), preferredSize: Size.zero),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(flex: 1, child: SideMenu()),
          Expanded(
              flex: 10,
              child: SizedBox(
                width: double.infinity,
                height: SizeConfig.screenHeight,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header(),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 4,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          runSpacing: 20.0,
                          spacing: 20.0,
                          alignment: WrapAlignment.spaceBetween,
                          children: const [
                            InfoCard(
                              icon: 'assets/credit-card.svg',
                              label: 'Transfer via \nCard number',
                              amount: '\$1200',
                            ),
                            InfoCard(
                              icon: 'assets/transfer.svg',
                              label: 'Transfer via \nOnline banks',
                              amount: '\$150',
                            ),
                            InfoCard(
                              icon: 'assets/bank.svg',
                              label: 'Transfer\nSame banks',
                              amount: '\$1500',
                            ),
                            InfoCard(
                              icon: 'assets/invoice.svg',
                              label: 'Transfer to\nOther banks',
                              amount: '\$1500',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              PrimaryText(
                                text: 'Balance',
                                size: 16,
                                color: AppColors.secondary,
                              ),
                              PrimaryText(
                                text: '\$1500',
                                size: 30,
                                fontWeight: FontWeight.w800,
                              )
                            ],
                          ),
                          const PrimaryText(
                            text: 'Past 30 DAYS',
                            size: 16,
                            color: AppColors.secondary,
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 3,
                      ),
                      const SizedBox(
                        height: 180,
                        child: BarChartComponent(),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          PrimaryText(
                            text: 'History',
                            size: 30,
                            fontWeight: FontWeight.w800,
                          ),
                          PrimaryText(
                            text: 'Transaction of last 6 months',
                            size: 16,
                            color: AppColors.secondary,
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 3,
                      ),
                      const HistoryTable(),
                      if (!Responsive.isDesktop(context))
                        const PaymentDetailList()
                    ],
                  ),
                ),
              )),
          if (Responsive.isDesktop(context))
            Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  color: AppColors.secondaryBg,
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 30.0),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 30.0),
                    child: Column(
                      children: const [
                        AppBarActionItems(),
                        PaymentDetailList()
                      ],
                    ),
                  ),
                ))
        ],
      )),
    );
  }
}
