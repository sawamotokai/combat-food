import 'package:combat_food/screens/owner/order_history.dart';
import 'package:combat_food/screens/owner/posted_items.dart';
import 'package:combat_food/shared/bottom-nav.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Combat Food'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          height: size.height * 0.74,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: DashboardTop(),
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderHistory()),
                            );
                          },
                          child: const DashboardMiddle(
                            title1: 'Order',
                            title2: 'History',
                            desc: 'you can view your past orders',
                            iconBackColor: Colors.redAccent,
                            iconColor: Colors.white,
                            icondata: LineIcons.history,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostedItems(),
                              ),
                            );
                          },
                          child: const DashboardMiddle(
                            title1: 'Posted',
                            title2: 'Items',
                            desc: 'you can view your current posted items',
                            iconBackColor: Colors.orangeAccent,
                            iconColor: Colors.white,
                            icondata: LineIcons.list,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: DashboardBottom(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomNavBar(),
    );
  }
}

class DashboardBottom extends StatelessWidget {
  const DashboardBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 0.75), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.greenAccent,
            ),
            child: const Icon(
              LineIcons.recycle,
              size: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Center(
            child: Text(
              'New Post',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 38,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardTop extends StatelessWidget {
  const DashboardTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'total purchased',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '30',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue,
                ),
                color: Colors.blue,
              ),
              child: const Icon(
                LineIcons.signal,
                size: 50,
                color: Colors.greenAccent,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 0.75), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

class DashboardMiddle extends StatelessWidget {
  const DashboardMiddle({
    required this.title1,
    required this.title2,
    required this.desc,
    required this.iconColor,
    required this.iconBackColor,
    required this.icondata,
  });

  final String title1;
  final String title2;
  final String desc;
  final Color iconColor;
  final Color iconBackColor;
  final IconData icondata;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 0.75), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: iconBackColor),
              color: iconBackColor,
            ),
            child: Icon(
              icondata,
              size: 50,
              color: iconColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                title1,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Text(
                title2,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
