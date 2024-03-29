import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //导入网络请求相关的包
class Today extends StatefulWidget {
  @override
  TodayState createState() => new TodayState();
}

class TodayState extends State<Today> {
  //数据源
  List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pullNet();
  }

  void _pullNet() async {
    await http.get("http://118.31.3.252:8010/ZsWorksManual/user/rest/today")
        .then((http.Response response) {
      var convertDataToJson = json.decode(response.body);
      convertDataToJson = convertDataToJson["data"];

      print(convertDataToJson);

      setState(() {
        data = convertDataToJson;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('手机商城'),
      ),
      body: new ListView(
          children: data != null ? _getItem() : _loading()),
    );
  }
  List<Widget> _getItem() {
    return data.map((item) {
      return new Card(child: new Padding(
        padding: const EdgeInsets.all(10.0), child: _getRowWidget(item),),
        elevation: 3.0,
        margin: const EdgeInsets.all(10.0),);
    }).toList();
  }

//预加载布局
  List<Widget> _loading() {
    return <Widget>[
      new Container(
        height: 300.0, child: new Center(child:
      new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CircularProgressIndicator(
            strokeWidth: 1.0,),
          new Text("正在加载"),
        ],)),)
    ];
  }
  Widget _getRowWidget(item) {
    return new Row(children: <Widget>[
      new Flexible(
          flex: 1,
          fit: FlexFit.tight, //和android的weight=1效果一样
          child: new Stack(children: <Widget>[
            new Column(children: <Widget>[
              new Text("${item["title"]}".trim(),
                  style: new TextStyle(color: Colors.black, fontSize: 20.0,),
                  textAlign: TextAlign.left),
              new Text("${item["detail"]}", maxLines: 3,)
            ],)
          ],)
      ),
      new ClipRect(child: new FadeInImage.assetNetwork(
        placeholder: "images/lake.png",
        image: "${"http://118.31.3.252:80" + item['picture']}",
        width: 50.0,
        height: 50.0,
        fit: BoxFit.fitWidth,),),
    ],);

  }


  }
