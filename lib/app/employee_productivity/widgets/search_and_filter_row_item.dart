import 'package:flutter/material.dart';
import 'package:mobile_assessment/core/design_system/color.dart';
import 'package:mobile_assessment/core/design_system/dimension.dart';
import 'package:mobile_assessment/core/design_system/typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// Filter not implemented :(
class SearchAndFilterRowItem extends StatelessWidget {
  final VoidCallback? onFilterPressed;
  final ValueChanged<String>? onSearchTextChanged;
  final String searchHint;
  final int filterCount;

  const SearchAndFilterRowItem({
    this.onFilterPressed,
    this.onSearchTextChanged,
    this.searchHint = 'filter by name, designation, level',
    this.filterCount = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onSearchTextChanged,
            decoration: InputDecoration(
              hintText: searchHint,
              prefixIcon: Icon(PhosphorIcons.magnifyingGlass()),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppDimension.sm,
                vertical: AppDimension.xs,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimension.xs),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimension.xs),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppDimension.sm),
        Stack(
          children: [
            IconButton(
              icon: Icon(PhosphorIcons.funnel()),
              onPressed: onFilterPressed,
            ),
            if (filterCount > 0)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(AppDimension.xs),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$filterCount',
                    style: AppTypography.body1.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
