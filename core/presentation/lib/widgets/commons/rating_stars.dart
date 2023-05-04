import 'package:flutter/material.dart';

class RatingStars extends StatefulWidget {
  const RatingStars({
    super.key,
    this.initValue,
    this.onChanged,
    this.iconSize = 25.0,
    this.spacing = 4.0,
  });

  final int? initValue;
  final Function(int value)? onChanged;
  final double iconSize;
  final double spacing;

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
          padding: EdgeInsets.only(right: widget.spacing),
          child: InkWell(
              onTap: () {
                if (widget.onChanged == null) {
                  return;
                }
                setState(() {
                  _value = index + 1;
                });
                widget.onChanged!.call(index);
              },
              child: Icon(
                (_value >= (index + 1)) ? Icons.star : Icons.star_border,
                color: Colors.orangeAccent,
                size: widget.iconSize,
              )),
        );
      }),
    );
  }
}
