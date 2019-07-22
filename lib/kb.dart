import 'package:flutter/material.dart';
class Kb extends StatefulWidget {
  @override
  KbState createState() => new KbState();
}
class KbState extends State<Kb> {
  @override
  Widget build(BuildContext context) {
    //每列都相同，故封装成一个方法，外界使用的时候直接传入相关参数 即可创建相应的列
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(//最外层为列
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,//主轴中心对齐
        children: [//因为有两个元素，所以用chilrdren
          new Icon(icon, color: color),//第一个原色为图标
          new Container(//因为要设置填充所以外面用一层容器
//            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(32),
            child: new Text(//第二个元素为文本控件且是container的子元素
              label,//通过文本初始化label控件
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
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
    //文本变量
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
       '在Flutter框架出现之前，主要有以下几个移动App跨平台开发框架：Cordova、Ionic、AppCan、Dcloud、APICloud、React Native。虽然有那么多框架，但是它们的原理都是使用HTML、CSS和JavaScript进行移动App开发，多平台共用一套代码，提供了丰富的主流UI库、用来调用原生API的JavaScript API包装器，同时还提供App打包、发布的工具或服务。由于这些跨平台开发框架是使用标准Web技术开发，所以它们打包出来的App在性能上，多少都会比原生App差上不少，这也是移动App跨平台开发技术一直不温不火的原因。',
        softWrap: true,
      ),
    );
    Widget imageSection = new  Container(
      child: new Icon(
        Icons.star,
        color: Colors.red[500],
      ),
    );//通过变量titleSection来达到简化布局
    Widget titleSection = Container(
      //为整个Widget（即这一行）的所有所有方向设置32px的填充
      padding: const EdgeInsets.all(32),
      child: Row(//整体是一行
        children: [//含有3个子元素,所以用 children标志
          Expanded(
            /**第一列文本比较多，用Expanded关键字，占据空闲空间
                将Column放置在Expanded中，由于Expanded会默认占据所有当前Row的空闲可用空间，所以这个Column也会自然被拉伸的占据完所有当前Row可用的空闲空间。
             */
            child: Column(//第一列
              /**将Column的crossAxisAlignment属性设置为CrossAxisAlignment.start以保证这个列中的元素(即children属性中的Widget)在水平方向上排列在当前Column的起始位置
               */
              crossAxisAlignment: CrossAxisAlignment.start,//居左
              children: [//第一列有两个文本控件元素
                /**
                    将这个Text放在Container中的目的是通过Container来添加填充(padding)
                 */
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(//第一个文本
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(//第二个文本
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /**
              最后的2个元素分别是1个Icon和1个Text,分别用来显示星星和数字
           */
          Icon(//第二列
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),//第三列
        ],
      ),
    );
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("课表"),
          backgroundColor: Color.fromARGB(255, 119, 136, 213), //设置appbar背景颜色
          centerTitle: true, //设置标题是否局中
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
             'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),

    );
  }
}