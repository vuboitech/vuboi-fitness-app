import 'package:flutter/material.dart';

class AppBottomSheet {
  final BuildContext context;

  final String title;

  // Non svg only
  final String? imageAssets;

  final Widget body;

  const AppBottomSheet({
    required this.context,
    required this.title,
    this.imageAssets,
    required this.body
  });

  void show() {
    showModalBottomSheet(
      context: context,
      isScrollControlled:true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 21),
              decoration: const BoxDecoration(
                color: Color(0xFFEBECFE),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      border: Border.all(
                        color: const Color(0xFFD9DBE9),
                        width: 1
                      )
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        body
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: 24,
              child: imageAssets != null ? Image.asset(
                imageAssets!,
                height: 78,
                width: 68,
              ) : const SizedBox(),
            ),
          ],
        );
      }
    );
  }
}
