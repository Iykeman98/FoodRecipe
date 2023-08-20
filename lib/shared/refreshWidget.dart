import 'package:flutter/material.dart';

class RefreshPage extends StatefulWidget {

  final Future<void> Function() onRefresh;
  final Widget child;

  RefreshPage({
    required this.onRefresh,
    required this.child
});

  @override
  _RefreshPageState createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.deepOrange[200],
      backgroundColor: Colors.transparent,
      onRefresh: widget.onRefresh,
      displacement: 100,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      semanticsLabel: "holy",
      strokeWidth: 3,
      child: widget.child,
    );
  }
}
