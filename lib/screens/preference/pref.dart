import 'package:combat_food/screens/swipe/setting_screen/distance/distance_field.dart';
import 'package:combat_food/screens/swipe/setting_screen/food_type/food_type_field.dart';
import 'package:combat_food/screens/swipe/setting_screen/price/price_field.dart';
import 'package:flutter/material.dart';

class Pref extends StatefulWidget {
  const Pref({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrefState();
}

enum PrefType {
  foodType,
  price,
  distance,
}

class _PrefState extends State<Pref> {
  int pageIndex = -1;
  PrefType _prefType = PrefType.foodType;

  @override
  void initState() {
    super.initState();
    pageIndex = 0;
    _prefType = PrefType.foodType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Combat Food"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: IndexedStack(
              index: pageIndex,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: FoodTypeField(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DistanceField(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PriceField(),
                        ),
                      ],),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
              child: const Text('Next'),
              onPressed: () {
                if (pageIndex == 1) {
                  setState(() {
                    pageIndex = 0;
                  });
                } else {
                  pageIndex++;
                  setState(() {});
                }
              }),
        ],
      ),
    );
  }
}
