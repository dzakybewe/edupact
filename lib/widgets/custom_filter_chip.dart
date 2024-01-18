import 'package:edupact/widgets/support_widgets.dart';
import 'package:flutter/material.dart';

import '../common/styles.dart';
class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    super.key,
    required this.cities,
  });

  final List<String> cities;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: cities
              .map((city) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FilterChip(
                label: Text(city),

                // labelStyle: TextStyle(
                //     color: selectedCategories.contains(city) ? Colors.white : appPrimary
                // ),
                selectedColor: primaryColor,
                showCheckmark: false,
                // selected: selectedCategories.contains(city),
                onSelected: (selected) {
                  snackBarFeatureNotAvailable(context);
                  // setState(() {
                  //   if (selected) {
                  //     selectedCategories.add(city);
                  //   } else {
                  //     selectedCategories.remove(city);
                  //   }
                  // });
                }),
          ),
          ).toList(),
        ),
      ),
    );
  }
}