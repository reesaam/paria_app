import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paria_app/data/resources/app_enums.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class AppDateTimePicker {
  Future<dynamic> datePicker({required AppCalendarTypes calendarType}) async {
    dynamic selectedDate;
    if (calendarType == AppCalendarTypes.christian) {
      selectedDate = await _georgianDatePicker();
    }
    if (calendarType == AppCalendarTypes.jalali) {
      selectedDate = await _persianDatePicker();
    }
    return selectedDate;
  }

  Future<DateTime?> _georgianDatePicker({
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

  Future<Jalali?> _persianDatePicker({
    Jalali? initialDate,
    Jalali? firstDate,
    Jalali? lastDate,
  }) async {
    Jalali now = Jalali.now();
    return showPersianDatePicker(
        context: Get.context!,
        initialEntryMode: PDatePickerEntryMode.calendarOnly,
        initialDate: initialDate ?? now,
        firstDate: firstDate ?? now.copy(year: now.year - 5),
        lastDate: lastDate ?? now);
  }
}
