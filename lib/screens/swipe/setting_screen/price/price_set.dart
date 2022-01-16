import 'package:flutter/material.dart';

class PriceSet extends StatefulWidget {
  const PriceSet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PriceSet();
}

class _PriceSet extends State<PriceSet> {
  var selectedRange = const RangeValues(0, 20);
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: selectedRange,
      max: 100,
      divisions: 10,
      labels: RangeLabels(
          '${selectedRange.start.round()}', '${selectedRange.end.round()}'),
      onChanged: (RangeValues newRange) {
        setState(() => selectedRange = newRange);
      },
    );
  }
}
