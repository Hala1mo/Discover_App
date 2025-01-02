import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<String> locations = ['Palestine', 'Japan', 'Moscow', 'London'];
  int activeLocation = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          left: false,
          right: false,
          bottom: true,
          minimum: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
              0, MediaQuery.of(context).size.width * 0.05, 0),
          child: _mainColumn(context)),
    );
  }

  Widget _mainColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.menu, color: Colors.black87, size: 35),
            Container(
              height: 39,
              width: 144,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/logo_discover.png'),
                ),
              ),
            ),
            const Icon(
              Icons.search,
              color: Colors.black87,
              size: 35,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              bottom: MediaQuery.of(context).size.height * 0.03),
          child: _locationBar(context),
        ),
        articleList(context),
      ],
    );
  }

  Widget _locationBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(69, 69, 69, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: locations.map((l) {
          bool isActive = locations[activeLocation] == l ? true : false;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                l,
                style: TextStyle(
                    fontSize: 15,
                    color: isActive ? Colors.white : Colors.white54,
                    fontFamily: 'Montserrat'),
              ),
              isActive
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.redAccent),
                      height: 7,
                      width: 30,
                    )
                  : Container(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget articleList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(articles[index].image),
                          ),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 2,
                                blurRadius: 20,
                                offset: Offset(0, 6)),
                          ]),
                      child: _articleInfoColumn(context, index),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 25,
                  left: MediaQuery.of(context).size.width * 0.10,
                  child: socialInfoConatiner(context, index),
                )
              ],
            );
          }),
    );
  }

  Widget _articleInfoColumn(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
            child: _authorInfoRow(context, index)),
        Padding(
          padding: EdgeInsets.fromLTRB(
              30, MediaQuery.of(context).size.height * 0.05, 30, 0),
          child: detailInfoRow(context, index),
        ),
      ],
    );
  }

  Widget _authorInfoRow(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/005/346/410/small_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg'),
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      articles[index].author,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      '3 Hours ago',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                    )
                  ]),
            ),
          ],
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.favorite, color: Colors.red, size: 20),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Icon(Icons.bookmark, color: Colors.white, size: 20),
            )
          ],
        ),
      ],
    );
  }

  Widget detailInfoRow(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            shape: CircleBorder(),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.redAccent,
              size: 30,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Text(articles[index].title,
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Text(articles[index].location,
                    style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                        fontWeight: FontWeight.w300)),
              ),
              ratingWidget(context, index),
            ],
          ),
        ),
      ],
    );
  }

  Widget socialInfoConatiner(BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.70,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(children: <Widget>[
            const Icon(Icons.favorite_border, color: Colors.red),
            Text(articles[index].likes.toString(),
                style: TextStyle(color: Colors.redAccent))
          ]),
          Row(children: <Widget>[
            const Icon(Icons.mode_comment, color: Colors.grey),
            Text(articles[index].comments.toString(),
                style: TextStyle(color: Colors.grey))
          ]),
          Row(children: <Widget>[
            const Icon(Icons.share, color: Colors.grey),
            Text(articles[index].shares.toString(),
                style: TextStyle(color: Colors.grey))
          ]),
        ],
      ),
    );
  }

  Widget ratingWidget(BuildContext context, int index) {
    return Row(
      children: List<Widget>.generate(5, (_currentIndex) {
        double filledAmount = articles[index].ratings - _currentIndex;
        Icon _starIcon;
        if (filledAmount >= 1) {
          _starIcon = Icon(Icons.star, color: Colors.amberAccent, size: 15);
        } else if (filledAmount >= 0.5) {
          _starIcon =
              Icon(Icons.star_half, color: Colors.amberAccent, size: 15);
        } else {
          _starIcon = const Icon(Icons.star_border,
              color: Colors.amberAccent, size: 15);
        }
        return _starIcon;
      }),
    );
  }
}
