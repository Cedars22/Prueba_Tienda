import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onClick;
  final String label;

  const PrimaryButton({
    super.key,
    required this.onClick,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromRGBO(245, 29, 104, 1),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.grey,
        onTap: onClick,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
