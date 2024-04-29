import 'package:flutter/material.dart';

class ReusableDropdown<T> extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final String displayKey;
  final ValueChanged<T?> onChanged;
  final T? value;
  final String? hintText;

  const ReusableDropdown({
    super.key,
    required this.items,
    required this.displayKey,
    required this.onChanged,
    this.hintText,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: this.hintText),
        value: value,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem<T>(
            value: item['id'] as T,
            child: Text(item[displayKey].toString()),
          );
        }).toList(),
      ),
    );
  }
}
