import 'package:flutter/material.dart';

class Numbers extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const Numbers({super.key, required this.hintText, required this.controller});

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          // Adjusted the label text styling
          Text(
            'Value',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white, // Changed color
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Colors.black), // Hint text color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(105), // Rounded corners
                  borderSide: BorderSide(
                    color: Colors.black, // Changed border color
                    width: 1.5, // Border width
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(105), // Rounded corners
                  borderSide: BorderSide(
                    color: Colors.black, // Changed focused border color
                    width: 1.5, // Focused border width
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
