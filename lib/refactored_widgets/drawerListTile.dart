import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function function;

  const DrawerListTile({
    required this.title,
    required this.icon,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title,
          style: TextStyle(color: Colors.white, fontSize: 20)),
      onTap: () {
        function();
        },
    );
  }
}