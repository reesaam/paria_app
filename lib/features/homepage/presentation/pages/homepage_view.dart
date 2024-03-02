import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/core/app_extensions/data_types_extensions/extension_string.dart';
import 'package:paria_app/data/resources/app_colors.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../../core/app_extensions/data_types_extensions/extension_int.dart';
import '../../../../core/app_localization.dart';
import '../../../../data/resources/app_icons.dart';
import '../../../../data/resources/app_spaces.dart';
import '../../../../core/elements/core_view.dart';
import '../../../../data/resources/app_paddings.dart';
import '../../../../data/resources/app_sizes.dart';
import '../../../../app/components/main_components/app_bar.dart';
import '../../../../app/components/main_components/app_bottom_navigation_bar.dart';
import '../../../../app/components/main_components/app_drawer.dart';
import '../../../../data/resources/app_text_styles.dart';
import '../manager/homepage_controller.dart';

class HomePage extends CoreView<HomePageController> {
  const HomePage({super.key});

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget? get drawer => const AppDrawer();

  @override
  Widget? get bottomNavigationBar => AppBottomNavigationBar(
      selectedIndex: controller.pageDetail.bottomBarItemNumber);

  @override
  Widget get body => Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _widgetDateTime(),
            _widgetSummery(),
          ]));

  Widget _widgetDateTime() => Card(
          child: Stack(children: [
        Padding(
            padding: AppPaddings.homepageDateTimeCard,
            child: Column(children: [
              Text(Texts.to.homepageDateTimeTitle,
                  style: AppTextStyles.cardTitle),
              AppSpaces.h20,
              Obx(() => _widgetDateTimeItem()),
            ])),

        ///TODO: Implement DateTime Setting Page
        // Align(
        //     alignment: Alignment.topRight,
        //     child: Container(
        //         alignment: Alignment.center,
        //         width: Get.width / 12,
        //         padding: AppPaddings.homepageDateTimeCardSettingIcon,
        //         child: InkWell(
        //           onTap: () {},
        //           child: AppIcons.settings.withAppDefaultColor
        //               .withSize(AppSizes.homepageSettingIcon),
        //         ))),
      ]));

  Widget _widgetDateTimeItem() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(controller.mainTime.value),
            Text(controller.mainDate.value),
          ]);

  ///TODO: Implement Summery
  Widget _widgetSummery() => Card(
          child: Padding(
        padding: AppPaddings.homepageSummeryCard,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(Texts.to.homepageSummaryTitle, style: AppTextStyles.cardTitle),
          AppSpaces.h20,
          Padding(
              padding: AppPaddings.homepageSummeryCardData,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(Texts.to.homepageSummaryContacts.withDoubleDots),
                          Text(Texts
                              .to.homepageSummaryAccountRecords.withDoubleDots),
                          Text(Texts
                              .to.homepageSummaryTotalBalance.withDoubleDots),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.summaryContactsCount.toString()),
                          Text(controller.summaryRecordsCount.toString()),
                          Text(controller
                              .summaryBalanceCount.value.balance.toCurrency),
                        ]),
                  ])),
        ]),
      ));
}
