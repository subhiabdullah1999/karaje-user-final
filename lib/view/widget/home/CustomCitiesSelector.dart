import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomHorizontalSelector extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final Function(int) onSelect;

  const CustomHorizontalSelector({super.key, 
    required this.items,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onSelect(index);
            },
            child: Container(
              width: 30.w,
              margin: EdgeInsets.symmetric(
                vertical: 2.h,
                horizontal: 2.w,
              ),
              padding: EdgeInsets.only(top: 1.h),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? const Color(0xffEC441D)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(5, 5),
                  ),
                ],
                border: Border.all(
                  color: const Color(0xffEC441D),
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Text(
                  items[index],
                  style: TextStyle(
                    color: selectedIndex == index
                        ? Colors.white
                        : const Color(0xffEC441D),
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
