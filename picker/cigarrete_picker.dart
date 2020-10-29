/*------------------------------------------------------------
Create date : 2020/10/26
Update data : 2020/10/26
Author : Nobuyoshi Tanaka
Description : cigarrete picker class
-------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../picker_list.dart';

class introCigarrete extends StatefulWidget {
  String initialValue;
  @override
  introduce createState() => introduce();
}

class introduce extends State<introCigarrete> {
  String m_inputValue = "";

  var selectedIndex = 0;
  String initial;
  introduce({this.initial});

  @override
  Widget build(BuildContext context) {
    return _introCigarrete();
  }

  String _selectedCigarrete = "たばこ";
  String _initialCigarrete = "選択";
  Widget _pickerCigarrete(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 32),
    );
  }

  Widget _introCigarrete() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("たばこ"),
        Container(
            child: CupertinoButton(
          child: Text("${_initialCigarrete}"),
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
                                _initialCigarrete = _selectedCigarrete;
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: CupertinoPicker(
                          itemExtent: 40,
                          children:
                              cigarreteList.map(_pickerCigarrete).toList(),
                          onSelectedItemChanged:
                              _onSelectedItemChanged_cigarrete,
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

  void _onSelectedItemChanged_cigarrete(int index) {
    setState(() {
      _selectedCigarrete = cigarreteList[index];
    });
  }
}
