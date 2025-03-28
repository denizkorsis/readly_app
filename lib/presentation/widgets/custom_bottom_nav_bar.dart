import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/core/l10n/locale_keys.g.dart';
import 'package:readly/core/utils/extensions/locale_extension.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Container(
          constraints: BoxConstraints(minHeight: 70.h, maxHeight: 90.h),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(45.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBarItem(
                context: context,
                icon: Icons.book_outlined,
                label: LocaleKeys.books.locale,
                isSelected: selectedIndex == 0,
                onTap: () => onTap(0),
              ),
              _buildBarItem(
                context: context,
                icon: Icons.favorite_border,
                label: LocaleKeys.favorites.locale,
                isSelected: selectedIndex == 1,
                onTap: () => onTap(1),
              ),
              _buildBarItem(
                context: context,
                icon: Icons.settings,
                label: LocaleKeys.settings.locale,
                isSelected: selectedIndex == 2,
                onTap: () => onTap(2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarItem({
    String? iconPath,
    IconData? icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: isSelected
                ? BoxDecoration(color: Colors.blue, shape: BoxShape.circle)
                : null,
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: icon != null
                  ? Icon(
                      icon,
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).dialogBackgroundColor,
                      size: 28.sp,
                    )
                  : Image.asset(
                      iconPath!,
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).dialogBackgroundColor,
                    ),
            ),
          ),
          if (!isSelected)
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
        ],
      ),
    );
  }
}
