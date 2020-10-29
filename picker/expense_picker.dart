/*------------------------------------------------------------
Create date : 2020/10/26
Update data : 2020/10/26
Author : Nobuyoshi Tanaka
Description : expense picker class
-------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../picker_list.dart';

class introExpense extends StatefulWidget {
  String initialValue;
  @override
  introduce createState() => introduce();
}

class introduce extends State<introExpense> {
  String m_inputValue = "";

  var selectedIndex = 0;
  String initial;
  introduce({this.initial});

  @override
  Widget build(BuildContext context) {
    return _introExpense();
  }

//身長選択ピッカー
  String _selectedExpense = "支払い";
  String _initialExpense = "選択";
  Widget _pickerExpense(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 32),
    );
  }

  Widget _introExpense() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("支払い"),
        Container(
            child: CupertinoButton(
          child: Text("${_initialExpense}"),
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
                                _initialExpense = _selectedExpense;
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: CupertinoPicker(
                          itemExtent: 40,
                          children: expenseList.map(_pickerExpense).toList(),
                          onSelectedItemChanged: _onSelectedItemChanged_expense,
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

  void _onSelectedItemChanged_expense(int index) {
    setState(() {
      _selectedExpense = expenseList[index];
    });
  }
}
