import 'package:flutter/material.dart';
import '../core/consts/colors.dart';
import '../core/consts/styles.dart';

class TermsAndConditionsCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const TermsAndConditionsCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (val) {
            if (val != null) {
              onChanged(val); // Call provider method
            }
          },
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Terms & Conditions"),
                  content: const SingleChildScrollView(
                    child: Text(
                      "These are the terms and conditions for posting an ad on this platform. By agreeing, you accept that your content must follow community guidelines, and you are responsible for the validity of your listing, etc.",
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text("Close"),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            },
            child: Text.rich(
              TextSpan(
                text: "I agree to the ",
                style: TextStyle(fontFamily: medium, color: black),
                children: [
                  TextSpan(
                    text: "terms & conditions",
                    style: TextStyle(
                      color: green,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
