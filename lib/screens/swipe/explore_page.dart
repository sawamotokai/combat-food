import 'package:combat_food/data/explore_json.dart';
import 'package:combat_food/services/api.dart';
import 'package:combat_food/shared/bottom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:http/http.dart';
import 'package:line_icons/line_icons.dart';

typedef IntCallback = void Function(int id);

enum VisibleState {
  neutral,
  like,
  dislike,
}

class ExplorePage extends StatefulWidget {
  ExplorePage({
    required this.goToLikes,
    required this.addLikes,
    required this.requestBody,
  });

  final VoidCallback goToLikes;
  final IntCallback addLikes;
  final Map<String, String> requestBody;

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int itemLength = 0;

  CardController? controller;

  int stackIndex = 0;
  int currentIndex = 0;

  List<VisibleState> cardStates = [];

  dynamic exploreItems;

  void getExploreItems() async {
    Response repsonse =
        await postReq('${dotenv.env["BASE_URL"]}/products', widget.requestBody);

    setState(() {
      exploreItems = repsonse.body;
      itemLength = explore_json.length;
      stackIndex = 0;
      cardStates = List.generate(itemLength, (index) => VisibleState.neutral);
    });
  }

  @override
  void initState() {
    super.initState();
    getExploreItems();
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: 120),
      child: Container(
        height: size.height,
        child: IndexedStack(index: stackIndex, children: [
          TinderSwapCard(
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              /// Get orientation & index of swiped card!
              if (index == itemLength - 1 &&
                  orientation != CardSwipeOrientation.RECOVER) {
                setState(() {
                  stackIndex = 1;
                });
              }
              setState(() {
                cardStates[index] = VisibleState.neutral;
              });
            },
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              setState(() {
                if (align.x < 0) {
                  cardStates[currentIndex] = VisibleState.dislike;
                } else if (align.x > 0) {
                  cardStates[currentIndex] = VisibleState.like;
                }
              });
            },
            maxWidth: size.width,
            maxHeight: size.height * 0.75,
            minWidth: size.width * 0.75,
            minHeight: size.height * 0.6,
            cardBuilder: (context, index) {
              currentIndex = index;
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2),
                    ]),
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(exploreItems[index]['imgUrl']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.25),
                            Colors.black.withOpacity(0),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // product basic info
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: size.width * 0.72,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              LineIcons.hamburger,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              exploreItems[index]['name'],
                                              style: const TextStyle(
                                                fontSize: 26,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              LineIcons.utensils,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              exploreItems[index]
                                                  ['restaurantName'],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              LineIcons.clock,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 3,
                                                  top: 3,
                                                ),
                                                child: Text(
                                                  exploreItems[index]
                                                      ['expiredAt'],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // detail bottom
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: size.width * 0.1,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      LineIcons.info,
                                      color: Colors.black54,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          getFooter(),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Visibility(
                                  visible:
                                      cardStates[index] == VisibleState.like,
                                  child: Container(
                                    height: 70,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.greenAccent,
                                        width: 4,
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'LIKE',
                                        style: TextStyle(
                                          color: Colors.greenAccent,
                                          fontSize: 50,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Visibility(
                                  visible:
                                      cardStates[index] == VisibleState.dislike,
                                  child: Container(
                                    height: 70,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.redAccent,
                                        width: 4,
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'DISLIKE',
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 40,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            totalNum: itemLength,
          ),
          Container(
            height: size.height,
            width: size.width,
            color: Colors.greenAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    LineIcons.user,
                    size: 70,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "We've run out of potential items in your preference. "
                  "Go to the list of your likes and choose your order",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  width: size.width * 0.5,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.lightBlueAccent.withOpacity(0.8),
                  ),
                  child: GestureDetector(
                    onTap: widget.goToLikes,
                    child: const Center(
                      child: Text(
                        'Go Likes',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );

    return Container();
  }

  Widget getFooter() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 80,
          right: 80,
          bottom: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                controller!.triggerLeft();
                setState(() {
                  cardStates[currentIndex] = VisibleState.dislike;
                });
              },
              child: BottomIcon(
                assetName: "assets/images/dislike.svg",
                height: 30,
                width: 30,
              ),
            ),
            GestureDetector(
              onTap: () {
                controller!.triggerRight();
                setState(() {
                  cardStates[currentIndex] = VisibleState.like;
                });
              },
              child: BottomIcon(
                assetName: "assets/images/like.svg",
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
