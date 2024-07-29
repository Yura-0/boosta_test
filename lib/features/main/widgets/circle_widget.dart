import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CircleWidget extends StatelessWidget {
  final int index;
  final bool isSelected;

  const CircleWidget({
    Key? key,
    required this.index,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: Adaptive.h(4),
      height: Adaptive.h(4),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2050F6) : Colors.white,
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(
                color: const Color(0xFF2050F6),
              )
            : Border.all(
                color: Colors.white,
              ),
      ),
      child: Center(
        child: Text(
          (index + 1).toString(),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
