import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/search/travelDetailsController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';

class ChairSelectionWidget extends StatelessWidget {
  const ChairSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<TravelDetailsController>();
    Get.put(TravelDetailsController());

    return GetBuilder<TravelDetailsController>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: -3.w,
              top: 3.h,
              child: Image.asset(
                AppImageAsset.frontbus,
                width: 90.w,
              ),
            ),
            controller.data.isEmpty
                ? Lottie.asset(AppImageAsset.server, height: 25.h)
                : Positioned(
                    left: controller.data['NumberOfChairs'] % 2 == 0
                        ? 8.5.w
                        : 15.5.w,
                    top: 17.h,
                    child: SizedBox(
                      height: 90.h,
                      width: 80.w,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 275),
                        child: ListView.builder(
                            itemCount: controller.data['NumberOfChairs'] % 2 ==
                                    0
                                ? (controller.data['NumberOfChairs'] + 2) ~/ 4
                                : (controller.data['NumberOfChairs'] + 2) ~/ 3,
                            itemBuilder: (context, index) {
                              int firstNumber =
                                  controller.data['NumberOfChairs'] % 2 == 0
                                      ? index * 4 + 1
                                      : index * 3 + 1;
                              int secondNumber =
                                  controller.data['NumberOfChairs'] % 2 == 0
                                      ? index * 4 + 2
                                      : index * 3 + 2;
                              int thirdNumber =
                                  controller.data['NumberOfChairs'] % 2 == 0
                                      ? index * 4 + 3
                                      : index * 3 + 3;
                              int forthNumber = index * 4 + 4;
                              return controller.data['NumberOfChairs'] % 2 == 0
                                  ? Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller
                                                .toggleFirstNumberSelection(
                                                    index);
                                            (controller.chairs).contains(
                                                    firstNumber <= 21
                                                        ? firstNumber
                                                        : firstNumber - 2)
                                                ? false
                                                : controller
                                                    .updateSelectedIndices(
                                                        firstNumber <= 21
                                                            ? firstNumber
                                                            : firstNumber - 2);
                                            print(controller.selectedIndices);
                                          },
                                          child: ChairNumber(
                                            number: firstNumber <= 21
                                                ? firstNumber
                                                : firstNumber - 2,
                                            isSelected: RxBool(
                                              (controller.chairs).contains(
                                                      firstNumber <= 21
                                                          ? firstNumber
                                                          : firstNumber - 2)
                                                  ? false
                                                  : controller
                                                          .firstNumbersSelected[
                                                      index],
                                            ),
                                            reserved: (controller.chairs)
                                                    .contains(firstNumber <= 21
                                                        ? firstNumber
                                                        : firstNumber - 2)
                                                ? true
                                                : false,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller
                                                .toggleSecondNumberSelection(
                                                    index);
                                            (controller.chairs).contains(
                                                    secondNumber <= 22
                                                        ? secondNumber
                                                        : firstNumber - 1)
                                                ? false
                                                : controller
                                                    .updateSelectedIndices(
                                                        secondNumber <= 22
                                                            ? secondNumber
                                                            : firstNumber - 1);
                                            print(controller.selectedIndices);
                                          },
                                          child: ChairNumber(
                                            number: secondNumber <= 22
                                                ? secondNumber
                                                : firstNumber - 1,
                                            isSelected: RxBool(
                                              (controller.chairs).contains(
                                                      secondNumber <= 22
                                                          ? secondNumber
                                                          : firstNumber - 1)
                                                  ? false
                                                  : controller
                                                          .secondNumbersSelected[
                                                      index],
                                            ),
                                            reserved: (controller.chairs)
                                                    .contains(secondNumber <= 22
                                                        ? secondNumber
                                                        : firstNumber - 1)
                                                ? true
                                                : false,
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        if (thirdNumber != 23)
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .toggleThirdNumberSelection(
                                                      index);
                                              (controller.chairs).contains(
                                                      thirdNumber <= 22
                                                          ? thirdNumber
                                                          : thirdNumber - 2)
                                                  ? false
                                                  : controller
                                                      .updateSelectedIndices(
                                                          thirdNumber <= 22
                                                              ? thirdNumber
                                                              : thirdNumber -
                                                                  2);
                                              print(controller.selectedIndices);
                                            },
                                            child: ChairNumber(
                                              number: thirdNumber <= 22
                                                  ? thirdNumber
                                                  : thirdNumber - 2,
                                              isSelected: RxBool(
                                                (controller.chairs).contains(
                                                        thirdNumber <= 22
                                                            ? thirdNumber
                                                            : thirdNumber - 2)
                                                    ? false
                                                    : controller
                                                            .thirdNumbersSelected[
                                                        index],
                                              ),
                                              reserved: (controller.chairs)
                                                      .contains(
                                                          thirdNumber <= 22
                                                              ? thirdNumber
                                                              : thirdNumber - 2)
                                                  ? true
                                                  : false,
                                            ),
                                          ),
                                        if (thirdNumber != 23)
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .toggleForthNumberSelection(
                                                      index);
                                              (controller.chairs).contains(
                                                      forthNumber <= 22
                                                          ? forthNumber
                                                          : forthNumber - 2)
                                                  ? false
                                                  : controller
                                                      .updateSelectedIndices(
                                                          forthNumber <= 22
                                                              ? forthNumber
                                                              : forthNumber -
                                                                  2);
                                              print(controller.selectedIndices);
                                            },
                                            child: ChairNumber(
                                              number: forthNumber <= 22
                                                  ? forthNumber
                                                  : forthNumber - 2,
                                              isSelected: RxBool(
                                                (controller.chairs).contains(
                                                        forthNumber <= 22
                                                            ? forthNumber
                                                            : forthNumber - 2)
                                                    ? false
                                                    : controller
                                                            .forthNumbersSelected[
                                                        index],
                                              ),
                                              reserved: (controller.chairs)
                                                      .contains(
                                                          forthNumber <= 22
                                                              ? forthNumber
                                                              : forthNumber - 2)
                                                  ? true
                                                  : false,
                                            ),
                                          ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            print(
                                                "kjuuuuuuuuuuuuuuuuuuuggggggggggggggghhhh");
                                            print(controller
                                                .data['NumberOfChairs']);
                                            print(
                                                "kjuuuuuuuuuuuuuuuuuuudddddddddddddddhhhh");

                                            controller
                                                .toggleFirstNumberSelection(
                                                    index);
                                            (controller.chairs)
                                                    .contains(firstNumber)
                                                ? false
                                                : controller
                                                    .updateSelectedIndices(
                                                        firstNumber <= 16
                                                            ? firstNumber
                                                            : firstNumber - 2);
                                            print(controller.selectedIndices);
                                          },
                                          child: ChairNumber(
                                            number: firstNumber <= 16
                                                ? firstNumber
                                                : firstNumber - 2,
                                            isSelected: RxBool(
                                              (controller.chairs).contains(
                                                      firstNumber <= 16
                                                          ? firstNumber
                                                          : firstNumber - 2)
                                                  ? false
                                                  : controller
                                                          .firstNumbersSelected[
                                                      index],
                                            ),
                                            reserved: (controller.chairs)
                                                    .contains(firstNumber <= 16
                                                        ? firstNumber
                                                        : firstNumber - 2)
                                                ? true
                                                : false,
                                          ),
                                        ),
                                        firstNumber <
                                                controller.data[
                                                        'NumberOfChairs'] -
                                                    2
                                            ? SizedBox(width: 12.w)
                                            : Container(),
                                        if (secondNumber != 17)
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .toggleSecondNumberSelection(
                                                      index);
                                              (controller.chairs).contains(
                                                      secondNumber <= 16
                                                          ? secondNumber
                                                          : secondNumber - 2)
                                                  ? false
                                                  : controller
                                                      .updateSelectedIndices(
                                                          secondNumber <= 16
                                                              ? secondNumber
                                                              : secondNumber -
                                                                  2);
                                              print(controller.selectedIndices);
                                            },
                                            child: ChairNumber(
                                              number: secondNumber <= 16
                                                  ? secondNumber
                                                  : secondNumber - 2,
                                              isSelected: RxBool(
                                                (controller.chairs).contains(
                                                        secondNumber <= 16
                                                            ? secondNumber
                                                            : secondNumber - 2)
                                                    ? false
                                                    : controller
                                                            .secondNumbersSelected[
                                                        index],
                                              ),
                                              reserved: (controller.chairs)
                                                      .contains(secondNumber <=
                                                              16
                                                          ? secondNumber
                                                          : secondNumber - 2)
                                                  ? true
                                                  : false,
                                            ),
                                          ),
                                        if (firstNumber >=
                                            controller.data['NumberOfChairs'] -
                                                2)
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .toggleFivethNumberSelection(
                                                      index);
                                              (controller.chairs).contains(
                                                      firstNumber >=
                                                              controller.data[
                                                                      'NumberOfChairs'] -
                                                                  2
                                                          ? firstNumber
                                                          : firstNumber + 1)
                                                  ? false
                                                  : controller.updateSelectedIndices(
                                                      firstNumber >=
                                                              controller.data[
                                                                      'NumberOfChairs'] -
                                                                  2
                                                          ? firstNumber
                                                          : firstNumber + 1);
                                              print(controller.selectedIndices);
                                            },
                                            child: ChairNumber(
                                              number: firstNumber >=
                                                      controller.data[
                                                              'NumberOfChairs'] -
                                                          2
                                                  ? firstNumber
                                                  : firstNumber + 1,
                                              isSelected: RxBool(
                                                (controller.chairs).contains(
                                                        firstNumber >=
                                                                controller.data[
                                                                        'NumberOfChairs'] -
                                                                    2
                                                            ? firstNumber
                                                            : firstNumber + 1)
                                                    ? false
                                                    : controller
                                                            .fiveNumbersSelected[
                                                        index],
                                              ),
                                              reserved: (controller.chairs)
                                                      .contains(firstNumber >=
                                                              controller.data[
                                                                      'NumberOfChairs'] -
                                                                  2
                                                          ? firstNumber
                                                          : firstNumber + 1)
                                                  ? true
                                                  : false,
                                            ),
                                          ),
                                        if (thirdNumber != 18)
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .toggleThirdNumberSelection(
                                                      index);
                                              (controller.chairs).contains(
                                                      thirdNumber <= 16
                                                          ? thirdNumber
                                                          : firstNumber >=
                                                                  controller.data[
                                                                          'NumberOfChairs'] -
                                                                      2
                                                              ? thirdNumber - 1
                                                              : thirdNumber - 2)
                                                  ? false
                                                  : controller.updateSelectedIndices(
                                                      thirdNumber <= 16
                                                          ? thirdNumber
                                                          : firstNumber >=
                                                                  controller.data[
                                                                          'NumberOfChairs'] -
                                                                      2
                                                              ? thirdNumber - 1
                                                              : thirdNumber -
                                                                  2);
                                              print(controller.selectedIndices);
                                            },
                                            child: ChairNumber(
                                              number: thirdNumber <= 16
                                                  ? thirdNumber
                                                  : firstNumber >=
                                                          controller.data[
                                                                  'NumberOfChairs'] -
                                                              2
                                                      ? thirdNumber - 1
                                                      : thirdNumber - 2,
                                              isSelected: RxBool(
                                                (controller.chairs).contains(
                                                        thirdNumber <= 16
                                                            ? thirdNumber
                                                            : firstNumber >=
                                                                    controller.data[
                                                                            'NumberOfChairs'] -
                                                                        2
                                                                ? thirdNumber -
                                                                    1
                                                                : thirdNumber -
                                                                    2)
                                                    ? false
                                                    : controller
                                                            .thirdNumbersSelected[
                                                        index],
                                              ),
                                              reserved: (controller.chairs)
                                                      .contains(thirdNumber <=
                                                              16
                                                          ? thirdNumber
                                                          : firstNumber >=
                                                                  controller.data[
                                                                          'NumberOfChairs'] -
                                                                      2
                                                              ? thirdNumber - 1
                                                              : thirdNumber - 2)
                                                  ? true
                                                  : false,
                                            ),
                                          ),
                                      ],
                                    );
                            }),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class ChairNumber extends StatelessWidget {
  final int number;
  final RxBool isSelected;
  final bool reserved;

  ChairNumber({
    super.key,
    required this.number,
    required this.isSelected,
    required this.reserved,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = reserved
        ? AppColor.red
        : isSelected.value // Access the value property of RxBool
            ? AppColor.blue
            : AppColor.blueAccent;

    return Container(
      width: 11.w,
      height: 5.h,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black26),
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            fontSize: 10.sp,
            color: isSelected.value ? Colors.white : Colors.black45,
          ),
        ),
      ),
    );
  }
}
