
import 'package:flutter/material.dart';

class LargeBottomButton extends StatelessWidget {
  final String  text;
  final Color  color;
  final Function()? function;
  LargeBottomButton({
    this.function,
    required this.text,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: function != null ? () => function!() : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15.0), // Set the desired border radius
                ),
                minimumSize: Size(double.infinity, 55.0), // Set the minimum height of the button
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),)
          ],
        ),
      ),
    );
  }
}
