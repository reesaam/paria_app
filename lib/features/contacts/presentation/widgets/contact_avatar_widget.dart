import 'package:flutter/material.dart';

import '../../../../core/app_extensions/data_models_extensions/extension_contact.dart';
import '../../../../data/resources/app_colors.dart';
import '../../domain/entities/contact_entity/contact_entity.dart';

class ContactAvatar extends CircleAvatar {
  final AppContactEntity contact;
  final double? size;
  const ContactAvatar({super.key, required this.contact, this.size});

  @override
  double? get maxRadius => size ?? 10;

  @override
  Color? get backgroundColor => AppColors.appDefaultColor;

  @override
  Color? get foregroundColor => AppColors.buttonTextNormal;

  @override
  Widget? get child =>
      Text(contact.getContactInitials, style: TextStyle(fontSize: size));
}
