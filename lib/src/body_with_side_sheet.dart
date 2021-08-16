import 'package:flutter/material.dart';

class BodyWithSideSheet extends StatelessWidget {
  const BodyWithSideSheet({
    Key? key,
    this.show = false,
    required this.body,
    this.sheetWidth = 400,
    required this.sheetBody,
  }) : super(key: key);
  final Widget body;
  final bool show;
  final double? sheetWidth;
  final Widget sheetBody;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: body),
        if (show)
          SizedBox(
            width: 2.0,
            child: Center(
              child: Container(
                width: 2.0,
                decoration: BoxDecoration(
                  border: Border(
                    left: Divider.createBorderSide(context,
                        color: Theme.of(context).dividerColor, width: 2.0),
                  ),
                ),
              ),
            ),
          ),
        _ShrinkableSize(
            child: SizedBox(
                width: sheetWidth,
                height: MediaQuery.of(context).size.height,
                child: sheetBody),
            show: show),
      ],
    );
  }
}

class _ShrinkableSize extends StatefulWidget {
  const _ShrinkableSize({Key? key, required this.child, required this.show})
      : super(key: key);
  final Widget child;
  final bool show;
  @override
  __ShrinkableSizeState createState() => __ShrinkableSizeState();
}

class __ShrinkableSizeState extends State<_ShrinkableSize>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.show ? controller.forward() : controller.reverse();
    return SizeTransition(
      sizeFactor: animation,
      child: widget.child,
      axis: Axis.horizontal,
    );
  }
}
