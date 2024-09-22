import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/class/statusrequest.dart';
import '../../core/services/services.dart';

class SelectDateController extends GetxController {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDate;
  Map<String, List> myTimesAvailable = {};
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  get toCity => null;

  @override
  void onInit() {
    selectedDate = focusedDay;
    super.onInit();
  }

  List listOfTimesAvailable(DateTime dateTime) {
    if (myTimesAvailable[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return myTimesAvailable[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  onDaySelected(selectedDay1, focusedDay1) async {
    if (!isSameDay(selectedDate, selectedDay1)) {
      selectedDate = selectedDay1;
      focusedDay = focusedDay1;
      update();
    }
  }
}
