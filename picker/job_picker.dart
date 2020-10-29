/*------------------------------------------------------------
Create date : 2020/10/26
Update data : 2020/10/26
Author : Nobuyoshi Tanaka
Description : job picker class
-------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../picker_list.dart';

class introJob extends StatefulWidget {
  String initialValue;
  @override
  introduce createState() => introduce();
}

class introduce extends State<introJob> {
  String m_inputValue = "";

  var selectedIndex = 0;
  String initial;
  introduce({this.initial});

  @override
  Widget build(BuildContext context) {
    return _introJob();
  }

  String _selectedJob = "職種";
  String _initialJob = "選択";
  Widget _pickerJob(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 32),
    );
  }

  Widget _introJob() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("職種"),
        Container(
            child: CupertinoButton(
          child: Text("${_initialJob}"),
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
                                _initialJob = _selectedJob;
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: CupertinoPicker(
                          itemExtent: 40,
                          children: jobList.map(_pickerJob).toList(),
                          onSelectedItemChanged: _onSelectedItemChanged_job,
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

  void _onSelectedItemChanged_job(int index) {
    setState(() {
      _selectedJob = jobList[index];
    });
  }
}
