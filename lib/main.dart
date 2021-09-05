import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyAPp(),
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
    ),
  ));
}

class MyAPp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_outlined,
        ),
        title: Text(
          'Latest News',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            color: Color(0xFFF3F3F3),
            height: 60,
            child: Row(
              children: [
                btn(FontAwesomeIcons.sortAmountDownAlt, 'sort'),
                btn(FontAwesomeIcons.slidersH, 'refine'),
                Spacer(),
                Icon(
                  Icons.crop_square,
                  color: Color(0xFF92A5AB),
                  size: 30,
                ),
                SizedBox(width: 20),
                Icon(
                  FontAwesomeIcons.bars,
                  color: Color(0xFF4698D6),
                  size: 23,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildItem(
                    image:
                        'https://images.ctfassets.net/8cd2csgvqd3m/65yF1LK9OXVvFLWaUUSJvB/fa15f796fc9614d6f08568bc9962deec/E8Sport_olympics.png',
                    tags: ['running', 'training'],
                    text: 'Your Full Marathon Training Plan -20 Weeks',
                    date: 'May 20, 2021',
                    comments: 19),
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black.withOpacity(.3),
                      ),
                    ),
                itemCount: 10),
          )
        ],
      ),
    );
  }
}

Widget btn(IconData icon, String text, {bool small = false}) {
  return Row(
    children: [
      Icon(
        icon,
        color: small ? Color(0xFF92A5AB) : Color(0xFF4698D6),
        size: small ? 18 : 25,
      ),
      SizedBox(width: 10),
      Text(
        text,
        style: TextStyle(
          color: Color(0xFF92A5AB),
          fontSize: small ? 16 : 20,
        ),
      ),
      SizedBox(width: small ? 10 : 20),
    ],
  );
}

Widget buildItem({
  @required String image,
  @required List<String> tags,
  @required String text,
  @required String date,
  @required int comments,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(15),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            image,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Color(0xFF21B944),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              tags[index].toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                    itemCount: tags.length),
              ),
              SizedBox(height: 15),
              Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 15),
              Text(
                date,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF95A1B3),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  btn(FontAwesomeIcons.feather, 'Logan', small: true),
                  btn(FontAwesomeIcons.comment, comments.toString(),
                      small: true),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
