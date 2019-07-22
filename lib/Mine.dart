import 'package:flutter/material.dart';
class Mine extends StatefulWidget {
  @override
  MineState createState() => new MineState();
}
class MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    //评级变量
    //每列都相同，故封装成一个方法，外界使用的时候直接传入相关参数 即可创建相应的列
    Column buildButtonColumn(IconData icon, String job,String time ) {
      Color color = Theme.of(context).primaryColor;
      return new Column(//最外层为列
        mainAxisSize: MainAxisSize.min,
        children: [//因为有两个元素，所以用chilrdren
          new Icon(icon, color: color),//第一个原色为图标
          new Container(//因为要设置填充所以外面用一层容器
//            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(5),
            child: new Text(//第二个元素为文本控件且是container的子元素
              job,//通过文本初始化label控件
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
          new Container(//因为要设置填充所以外面用一层容器
//            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(5),
            child: new Text(//第二个元素为文本控件且是container的子元素
              time,//通过文本初始化label控件
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }
    //通过变量buttonSection来达到简化按钮布局
    Widget cookSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'PREP','25 min'),
          buildButtonColumn(Icons.near_me, 'COOK','1 hr'),
          buildButtonColumn(Icons.share, 'FEEDS','4-6'),
        ],
      ),
    );
    Widget ratingSection = new Container(
      padding: const EdgeInsets.all(5),//填充
      child: Row(//一行两列两个元素
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
           new Row(//该行有5个元素
             mainAxisSize: MainAxisSize.min,//居左
             children: <Widget>[
               new Icon(Icons.star, color: Colors.black),
               new Icon(Icons.star,color: Colors.black),
               new Icon(Icons.star,color: Colors.black),
               new Icon(Icons.star,color: Colors.black),

             ],
           ),
          new Text(
                '170 reviews',
                style: new TextStyle(
                 color: Colors.black,
                 fontWeight: FontWeight.w500,
                 fontSize: 20.0,
               ),
               ),

        ],
      ),
    );
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10),
        child:new Text(
          'sddffjjjjjjjjjj',
          style: new TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
    );
    Widget contentSection = new Container(
      padding: const EdgeInsets.all(10),
      child:new Text(
        'susikkskskkssssssssssssssssssusikkskskkssssssssssssssssssusikkskskksssssssssssssssss',
        softWrap: true,
        style: new TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      )
    );
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("我的"),
          backgroundColor: Color.fromARGB(255, 119, 136, 213), //设置appbar背景颜色
          centerTitle: true, //设置标题是否局中
        ),
        body: new Container(//容器
          padding: const EdgeInsets.all(20),
          child: Row(//一行
            children: <Widget>[
              Expanded(
                child: Column(//第一列
                  children: <Widget>[
                    titleSection,
                    contentSection,
                    ratingSection,
                    cookSection,
                  ],
                ),
              ),
              new Container(
                padding: const EdgeInsets.all(5),
                child: new Image.asset(
                    'images/lake.jpg',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover
                ),
              )
            ],
          ),
        )

        )
    );
  }
}
