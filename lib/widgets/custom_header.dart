import 'package:edupact/widgets/support_widgets.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final bool hasSearchBar;
  final bool hasBackButton;
  const CustomHeader({
    super.key,
    required this.title,
    this.hasSearchBar = false,
    this.hasBackButton = false
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          'assets/images/header_background.png',
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
        if (hasBackButton) Positioned(
          left: 20,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 24),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w600
          ),
        ),
        if (hasSearchBar) Positioned(
          bottom: -10,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            child: Material(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                onTap: () => snackBarFeatureNotAvailable(context),
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 26,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}