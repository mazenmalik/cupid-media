import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.leadingIcon,
    this.trailingIcon,
    this.width,
    this.height = 50.0,
    this.gradient,
    this.backgroundColor = Colors.red,
    this.enable = false,
  });

  final VoidCallback onPressed;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final String text;
  final double? width;
  final double height;
  final Gradient? gradient;
  final Color backgroundColor;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            enable ? backgroundColor : Colors.grey, // Gray when disabled
        elevation: 4.0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      onPressed: enable
          ? onPressed
          : null, // Enable or disable button based on 'enable' property
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient, // Apply the gradient here
          color: gradient == null
              ? (enable ? backgroundColor : Colors.grey)
              : null,
          // Use backgroundColor if gradient is not provided
          borderRadius: BorderRadius.circular(32),
        ),
        child: Container(
          width: width ??
              MediaQuery.of(context).size.width *
                  0.85, // Default width if not provided
          height: height,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (leadingIcon != null) ...[
                Icon(leadingIcon, color: Colors.white),
                const SizedBox(width: 8.0), // Space between icon and text
              ],
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: 8.0),
                Icon(trailingIcon, color: Colors.white),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
