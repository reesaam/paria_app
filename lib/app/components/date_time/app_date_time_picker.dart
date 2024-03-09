import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class AppDateTimePicker {
  Future<DateTime?> christianDatePicker({
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    DateTime now = DateTime.now();
    return showDatePicker(
      context: Get.context!,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: initialDate,
      firstDate: firstDate ?? now.copyWith(year: now.year - 5),
      lastDate: lastDate ?? now,
    );
  }

  Future<Jalali?> persianDatePicker({
    Jalali? initialDate,
    Jalali? firstDate,
    Jalali? lastDate,
  }) async {
    Jalali now = Jalali.now();
    return showPersianDatePicker(
        context: Get.context!, initialEntryMode: PDatePickerEntryMode.calendarOnly, initialDate: initialDate ?? now, firstDate: firstDate ?? now.copy(year: now.year - 5), lastDate: lastDate ?? now);
  }
}
