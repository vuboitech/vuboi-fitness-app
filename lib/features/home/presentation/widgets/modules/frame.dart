import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  final String title;
  final Widget? actions;
  final Widget body;

  const Frame({
    super.key,
    required this.title,
    this.actions,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFEBECFE),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                actions != null ? actions! : const SizedBox(),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Color(0xFF610BEF),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 1),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.white,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: body,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
