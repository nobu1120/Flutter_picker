/*------------------------------------------------------------
Create date : 2020/10/26
Update data : 2020/10/26
Author : Nobuyoshi Tanaka
Description : age picker class
-------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../picker_list.dart';

class introAge extends StatefulWidget {
  String initialValue;
  @override
  introduce createState() => introduce();
}

class introduce extends State<introAge> {
  String m_inputValue = "";

  var selectedIndex = 0;
  String initial;
  introduce({this.initial});

  @override
  Widget build(BuildContext context) {
    return _introAge();
  }

  String _selectedAge = "年齢";
  String _initialAge = "選択";
  Widget _pickerAge(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 32),
    );
  }

  Widget _introAge() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("年齢"),
        Container(
            child: CupertinoButton(
          child: Text("${_initialAge}"),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CupertinoButton(
                            child: Text("戻る"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoButton(
                            child: Text("決定"),
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                _initialAge = _selectedAge;
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: CupertinoPicker(
                          itemExtent: 40,
                          children: ageList.map(_pickerAge).toList(),
                          onSelectedItemChanged: _onSelectedItemChanged_age,
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ))
      ],
    );
  }

  void _onSelectedItemChanged_age(int index) {
    setState(() {
      _selectedAge = ageList[index];
    });
  }
}
