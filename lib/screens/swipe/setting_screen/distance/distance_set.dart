import 'package:flutter/material.dart';

class DistanceSet extends StatefulWidget {
  const DistanceSet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DistanceSet();
}

class _DistanceSet extends State<DistanceSet> {
  var selectedRange = const RangeValues(0, 20);
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: selectedRange,
      max: 50,
      divisions: 5,
      
      labels: RangeLabels(
        
          '${selectedRange.start.round()}', '${selectedRange.end.round()}'),
          
      onChanged: (RangeValues newRange) {
        setState(() => selectedRange = newRange);
      },
    );
  }
}
