import 'package:csp/service/subjectList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:csp/service/user_auth.dart';

List<String> selectedItemValue = ["Select"];
List<String> selectedItemValueSection = ["Select"];

class ListViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewDemoState();
  }
}

class ListViewDemoState extends State<ListViewDemo> {
  int pp = 1, i = 0;
  @override
  void initState() {
    _getSubList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _myListView();
  }

  Widget _myListView() {
    return ListView.builder(
        itemCount: pp > 1 ? pp : 1,
        itemExtent: 40.0,
        itemBuilder: (BuildContext context, int index) {
          for (int i = 0; i < pp; i++) {
            selectedItemValue.add("Select");
            selectedItemValueSection.add("Select");
            // teacherData.add(TeacherData("Select", "Select"));
            myList.add(TeacherData("Select", "Select"));
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              //direction: Axis.vertical,
              children: [
                DropdownButton(
                  hint: Text('Subject'),
                  value: selectedItemValue[index].toString(),
                  items: sublist?.map((item) {
                        return new DropdownMenuItem(
                          child: new Text(item),
                          value: item.toString(),
                        );
                      })?.toList() ??
                      [],
                  onChanged: (value) {
                    selectedItemValue.insert(index, value);
                    setState(() {
                      _mySub = value;
                    });
                  },
                ),
                SizedBox(
                  width: 20,
                ),

                // Dismissible(
                //   key: Key(selectedItemValue[index]),
                //   direction: DismissDirection.startToEnd,
                //   child: IconButton(
                //     icon: Icon(Icons.remove_circle),
                //     tooltip: 'Delete Subject',
                //     onPressed: () {
                //       setState(() {
                //         if (pp > 0) --pp;
                //         debugPrint('${selectedItemValue[index]}');
                //         selectedItemValue.removeAt(index);
                //       });
                //     },
                //   ),
                //   onDismissed: (direction) {
                //     setState(() {
                //       if (pp > 1) selectedItemValue.removeAt(index);
                //     });
                //   },
                // ),
                // IconButton(
                //   icon: const Icon(Icons.add),
                //   tooltip: 'Add Subject',
                //   onPressed: () {
                //     ++pp;
                //     debugPrint('${selectedItemValue[index]}');
                //     setState(() {});
                //   },
                // ),

                DropdownButton(
                  value: selectedItemValueSection[index].toString(),
                  items: _dropDownItemSection(),
                  onChanged: (value) {
                    selectedItemValueSection.insert(index, value);
                    myList.insert(
                        index,
                        TeacherData(selectedItemValue[index],
                            selectedItemValueSection[index]));
                    // teacherData.insert(
                    //     index,
                    //     TeacherData(selectedItemValue[index],
                    //         selectedItemValueSection[index]));
                    setState(() {});
                  },
                ),

                // SizedBox(
                //   width: 20,
                // ),

                Dismissible(
                  key: Key(selectedItemValue[index]),
                  direction: DismissDirection.startToEnd,
                  child: IconButton(
                    icon: Icon(Icons.remove_circle),
                    tooltip: 'Delete Subject',
                    onPressed: () {
                      setState(() {
                        if (index > 0) {
                          if (pp > 0) --pp;

                          selectedItemValue.removeAt(index);
                          selectedItemValueSection.removeAt(index);
                          // teacherData.removeAt(index);
                          myList.removeAt(index);
                        } else {
                          selectedItemValue[index] = "Select";
                          selectedItemValueSection[index] = "Select";
                          myList[index].Section = "Select";
                          myList[index].Subject = "Select";
                          // teacherData[index].Subject = "Select";
                          // teacherData[index].Section = "Select";
                        }
                      });
                    },
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      if (pp > 1) {
                        selectedItemValue.removeAt(index);
                        selectedItemValueSection.removeAt(index);
                        // teacherData.removeAt(index);
                        myList.removeAt(index);
                      }
                    });
                  },
                ),

                IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add Subject',
                  onPressed: () {
                    ++pp;
                    // debugPrint('${teacherData[index].Subject}');
                    // debugPrint('${teacherData[index].Section}');
                    // debugPrint('${myList[index].Subject}');
                    // debugPrint('${myList[index].Section}');
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        });
  }

  List sublist;
  String _mySub;
  Future<String> _getSubList() async {
    String suburl = '$url/subjects';
    await http.get(suburl).then((response) {
      var data = json.decode(response.body);
      setState(() {
        sublist = data['subjects'];
        sublist.insert(0, 'Select');
        print(sublist);
      });
    });
  }

  // List<String> ddl;
  // List<DropdownMenuItem<String>> _dropDownItem() {
  //   return ddl
  //       .map((value) => DropdownMenuItem(
  //             value: value,
  //             child: Text(value),
  //           ))
  //       .toList();
  // }
}

List<DropdownMenuItem<String>> _dropDownItemSection() {
  List<String> ddl = [
    "Select",
    "CSE-A",
    "CSE-B",
    "IT",
    "ECE",
    "BT",
  ];
  return ddl
      .map((value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ))
      .toList();
}
