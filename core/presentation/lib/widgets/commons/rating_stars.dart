import 'package:flutter/material.dart';

class RatingStars extends StatefulWidget {
  final int? initValue;
  final Function(int value)? onChanged;
  const RatingStars({
    super.key,
    this.initValue,
    this.onChanged,
  });

  @override
  State<RatingStars> createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initValue ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: InkWell(
              onTap: () {
                setState(() {
                  _value = index;
                });
                widget.onChanged?.call(index);
              },
              child: Icon(
                (_value >= index) ? Icons.star : Icons.star_border,
                color: Colors.orangeAccent,
              )),
        );
      }),
    );
  }
}
