/*------------------------------------------------------------
Create date : 2020/10/26
Update data : 2020/10/26
Author : Nobuyoshi Tanaka
Description : prefecture picker class
-------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../picker_list.dart';

class introFrom extends StatefulWidget {
  String initialValue;
  @override
  introduce createState() => introduce();
}

class introduce extends State<introFrom> {
  String m_inputValue = "";

  var selectedIndex = 0;
  String initial;
  introduce({this.initial});

  @override
  Widget build(BuildContext context) {
    return _introFrom();
  }

  String _selectedFrom = "出身地";
  String _initialFrom = "選択";
  Widget _pickerFrom(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 32),
    );
  }

  Widget _introFrom() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("出身地"),
        Container(
            child: CupertinoButton(
          child: Text("${_initialFrom}"),
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
                                _initialFrom = _selectedFrom;
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: CupertinoPicker(
                          itemExtent: 40,
                          children: liveList.map(_pickerFrom).toList(),
                          onSelectedItemChanged: _onSelectedItemChanged_from,
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

  void _onSelectedItemChanged_from(int index) {
    setState(() {
      _selectedFrom = liveList[index];
    });
  }
}
