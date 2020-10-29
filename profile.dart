/*------------------------------------------------------------
Create date : 2020/10/??
Update data : 2020/10/25
Author : Nobuyoshi Tanaka
Description : this file implements profile page
-------------------------------------------------------------*/

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matching/setting.dart';
import 'package:flutter/rendering.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'picker/height_picker.dart'; //身長ピッカー
import 'picker/body_picker.dart'; //体型ピッカー
import 'picker/age_picker.dart'; //年齢ピッカー
import 'picker/job_picker.dart'; //職種ピッカー
import 'picker/live_picker.dart'; //住まいピッカー
import 'picker/from_picker.dart'; //出身地ピッカー
import 'picker/cigarrete_picker.dart'; //タバコピッカー
import 'picker/expense_picker.dart'; //支払いピッカー
import 'profile_avator.dart';
import 'wanted_status.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final PageController _pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Profile'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
      // backgroundColor: Color(0xff241332),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        //profile画像
        // Container(height: size.height * .25, child: showProfileImage()),
        Container(
          height: size.height * .25,
          margin: EdgeInsets.only(top: 0),
          child: ProfileAvator(),
        ),
        const Divider(
          color: Colors.blueGrey,
          height: 0,
          thickness: 3,
          indent: 20,
          endIndent: 20,
        ),
        //飲み会予約情報
        wantedStatus(),
        const Divider(
          color: Colors.blueGrey,
          height: 0,
          thickness: 3,
          indent: 20,
          endIndent: 20,
        ),
        Introduction()
      ])),
    );
  }
}

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  String m_inputValue = "";
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("自己紹介文"),
        Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "自己紹介文",
                  hintText: "20文字以上入力してね"),
              //最大文字数、parisは最大1000文字、最小20文字
              maxLength: 500,
              //変更反映
              onChanged: (text) {
                if (text.length > 0) {
                  //入力値があるなら、反映
                  setState(() {
                    this.m_inputValue = text;
                  });
                } else {
                  setState(() {
                    this.m_inputValue = "入力してください";
                  });
                }
              },
            )),
        Text("プロフィール"),
        introAge(), //年齢ピッカー
        introHeight(), //身長ピッカー
        introBody(), //体型ピッカー
        introJob(), //職種ピッカー
        introFrom(), //出身地ピッカー
        introLive(), //住まいピッカー
        introCigarrete(), //たばこピッカー
        introExpense(), //支払いピッカー
      ],
    );
  }
}
