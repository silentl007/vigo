import 'package:flutter/material.dart';
import 'package:vigo/model/assets.dart';
import 'package:vigo/model/customwidget.dart';
import 'package:vigo/model/decorations.dart';
import 'package:vigo/model/sizemodel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Items> content = [
    Items(
        username: 'robetfox',
        time: '1 hour ago',
        writeup:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Feugiat tristique in morbi nunc enim vitae. Gravida facilisis sit lobortis eget. Lorem faucibus vulputate purus viverra eu elit nec nisl.',
        profilepic: AssetsPath.profilepic1,
        postimage: AssetsPath.item1,
        likes: '2.9k',
        comment: '59'),
    Items(
        username: 'deylenemily',
        time: '3 hours ago',
        writeup:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Feugiat tristique in morbi nunc enim vitae.',
        profilepic: AssetsPath.profilepic2,
        postimage: AssetsPath.item2,
        likes: '6.1k',
        comment: '123'),
  ];
  // ignore: prefer_final_fields
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomWidget().appbar(context: context, dash: true),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            iconSize: Sizes.w30,
            selectedItemColor: UserColors.purple,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: [
              const BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsPath.home)), label: ''),
              const BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsPath.search)), label: ''),
              const BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsPath.add)), label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AssetsPath.profilepic1,
                    width: Sizes.w35,
                  ),
                  label: '')
            ]),
        body: Padding(
          padding: EdgeInsets.only(top: Sizes.w10, bottom: Sizes.h10),
          child: ListView.separated(
              itemBuilder: (context, int int) {
                return populate(
                    username: content[int].username,
                    time: content[int].time,
                    profilepic: content[int].profilepic,
                    writeup: content[int].writeup,
                    postimage: content[int].postimage,
                    likes: content[int].likes,
                    comment: content[int].comment);
              },
              separatorBuilder: (context, int int) {
                return customDivider(height: Sizes.h15);
              },
              itemCount: content.length),
        ),
      ),
    );
  }

  populate({
    required String? username,
    required String? time,
    required String? writeup,
    required String? profilepic,
    required String? postimage,
    required String? likes,
    required String? comment,
  }) {
    return SizedBox(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: Sizes.w12, right: Sizes.w12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: Sizes.w20,
                    child: Image.asset(
                      profilepic!,
                    ),
                  ),
                  customhorizontal(width: Sizes.w8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username!,
                        style: Decor().textStyle(size: Sizes.w15),
                      ),
                      Text(
                        time!,
                        style: Decor()
                            .textStyle(size: Sizes.w15, color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
              ImageIcon(
                const AssetImage(AssetsPath.threedots),
                size: Sizes.w30,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: Sizes.w10, right: Sizes.w10),
          child: const Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(left: Sizes.w18, right: Sizes.w18),
          child: Text(
            writeup!,
            textAlign: TextAlign.justify,
            style: Decor().textStyle(
                size: Sizes.w18,
                color: Colors.grey.withOpacity(.7),
                fontweight: FontWeight.w500),
          ),
        ),
        customDivider(height: Sizes.h8),
        SizedBox(
            height: Sizes.h350,
            width: double.infinity,
            child: Image.asset(
              postimage!,
              fit: BoxFit.fill,
            )),
        Padding(
          padding: EdgeInsets.only(left: Sizes.w15, top: Sizes.h10),
          child: Row(
            children: [
              ImageIcon(
                const AssetImage(AssetsPath.like),
                size: Sizes.w25,
              ),
              customhorizontal(width: Sizes.w5),
              Text(
                likes!,
                style: Decor().textStyle(size: Sizes.w18, color: Colors.grey),
              ),
              customhorizontal(width: Sizes.w20),
              ImageIcon(
                const AssetImage(AssetsPath.comment),
                size: Sizes.w25,
              ),
              customhorizontal(width: Sizes.w5),
              Text(
                comment!,
                style: Decor().textStyle(size: Sizes.w18, color: Colors.grey),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class Items {
  String? username;
  String? time;
  String? writeup;
  String? profilepic;
  String? postimage;
  String? likes;
  String? comment;
  Items(
      {required this.username,
      required this.time,
      required this.writeup,
      required this.profilepic,
      required this.postimage,
      required this.likes,
      required this.comment});
}
