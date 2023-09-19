import 'package:fitness/ui/widgets/base/chip/chip_group.dart';
import 'package:flutter/material.dart';

class VuboiAppBar extends StatefulWidget {
  final String title;
  final ValueChanged<String>? onSearch;
  final ChipGroup? chipGroup;

  const VuboiAppBar({
    Key? key,
    required this.title,
    this.onSearch,
    this.chipGroup
  }) : super(key: key);

  @override
  State<VuboiAppBar> createState() => _VuboiAppBarState();
}

class _VuboiAppBarState extends State<VuboiAppBar> with TickerProviderStateMixin {
  bool _searchMode = false;

  late AnimationController _fadeAnimController;
  late Animation<double> _fadeAnimation;
  late AnimationController _slideAnimController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _fadeAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_fadeAnimController);

    _slideAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _slideAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(-1.0, 0.0)).animate(_slideAnimController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.zero,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left, size: 32,),
                          style: IconButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                        ),

                        !_searchMode ? Text(
                          'Exercise',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800
                          ),
                        ) : Expanded(
                          child: TextFormField(),
                        ),
                      ],
                    ),
                  ),
                  !_searchMode ? IconButton(
                    icon: Icon(Icons.search),
                    style: IconButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      _searchMode = true;
                      setState(() {

                      });

                      _fadeAnimController.forward();
                      _slideAnimController.reverse();
                    },
                  ) : IconButton(
                    icon: Icon(Icons.close),
                    style: IconButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      _searchMode = false;
                      setState(() {

                      });

                      _slideAnimController.forward();
                      _fadeAnimController.reverse();
                    },
                  ),
                ],
              ),
            ),
            widget.chipGroup != null ? widget.chipGroup! : SizedBox()
          ],
        ),
      ),
    );
  }
}
