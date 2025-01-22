import 'package:flutter/material.dart';
import 'package:tour_search_app/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _locations = ['Yangon', 'Mandalay', 'Bagan'];
  int _activeLocation = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            left: false,
            right: false,
            bottom: true,
            minimum: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.05,
                0),
            child: _mainColumn(context)));
  }

  Widget _mainColumn(BuildContext _context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu,
              color: Colors.black,
              size: 35,
            ),
            Container(
                height: 50,
                width: 133,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/discover.jfif'),
                  ),
                )),
            const Icon(Icons.search, color: Colors.black, size: 35)
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.03),
          child: _locationBar(_context),
        ),
        _articleList(_context),
      ],
    );
  }

  Widget _locationBar(BuildContext _context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _locations.map((t) {
          bool _isActive = _locations[_activeLocation] == t ? true : false;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                t,
                style: TextStyle(
                    fontSize: 15,
                    color: _isActive ? Colors.white : Colors.white54,
                    fontFamily: 'Montserrat'),
              ),
              _isActive
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent),
                      height: 6,
                      width: 30,
                    )
                  : Container()
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _articleList(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (_context, index) {
              return Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * 0.05),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(articles[index].image),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  spreadRadius: 3,
                                  blurRadius: 20,
                                  offset: Offset(0, 6)),
                            ],
                          ),
                          child: _articleInfoColumn(_context, index),
                        ),
                      )),
                  Positioned(
                      bottom: 20,
                      left: MediaQuery.of(_context).size.width * 0.10,
                      child: _SocialInfoContainer(_context, index))
                ],
              );
            }));
  }

  Widget _articleInfoColumn(BuildContext _context, int _index) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 30, 01),
              child: _authorInfoRow(_context, _index),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03, left: 30),
              child: _detailInfoRow(_context, _index),
            ),
          ],
        ),
      ],
    );
  }

  Widget _authorInfoRow(BuildContext _context, int _index) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://img.freepik.com/premium-vector/avatar-profile-colorful-illustration-2_549209-82.jpg')),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articles[_index].author,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '3 months age',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Column(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ]);
  }

  Widget _detailInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.play_arrow,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Text(
                  articles[_index].title,
                  maxLines: 3,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 3),
                child: Text(
                  articles[_index].location,
                  style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
              ),
              _ratingWidget(_context, _index)
            ],
          ),
        )
      ],
    );
  }

  Widget _SocialInfoContainer(BuildContext _context, int _index) {
    return Container(
      height: MediaQuery.of(_context).size.height * 0.08,
      width: MediaQuery.of(_context).size.width * 0.70,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
              ),
              Text(
                articles[_index].likes.toString(),
                style: const TextStyle(color: Colors.redAccent),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.mode_comment,
                color: Colors.grey,
              ),
              Text(
                articles[_index].comments.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.share,
                color: Colors.grey,
              ),
              Text(
                articles[_index].shares.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _ratingWidget(BuildContext _context, int _index) {
    return Row(
      children: List.generate(5, (_currentIndex) {
        double _fillAmount = articles[_index].rating - _currentIndex;
        Icon _starIcon;
        if (_fillAmount >= 1) {
          _starIcon = const Icon(
            Icons.star,
            color: Colors.amberAccent,
            size: 15,
          );
        } else if (_fillAmount >= 0.5) {
          _starIcon = const Icon(
            Icons.star_half,
            color: Colors.amberAccent,
            size: 15,
          );
        } else {
          _starIcon = const Icon(
            Icons.star_border,
            color: Colors.amberAccent,
            size: 15,
          );
        }
        return _starIcon;
      }),
    );
  }
}
