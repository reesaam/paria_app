import 'package:flutter/material.dart';

import '../../../../core/app_routing/routing.dart';
import '../../../../app/components/buttons/app_icon_button.dart';
import '../../../../data/resources/app_icons.dart';
import '../../../../data/resources/app_paddings.dart';

class AccountsAppBarActionWidget extends StatelessWidget {
  const AccountsAppBarActionWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: AppPaddings.appBarActions,
      child: AppIconButton(
          icon: AppIcons.list.icon!,
          onPressed: () => goToContactsBalance()));
}
