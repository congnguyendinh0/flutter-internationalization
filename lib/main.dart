

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() {
  runApp(EasyLocalization(child: MyApp(),
  path : "assets/translations",
saveLocale:true ,
supportedLocales: [
  Locale('de','DE'),
  Locale('en','US'),
],
));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales:context.supportedLocales,
      locale: context.locale,
      
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text('title'.tr().toString()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('hello'.tr().toString(),
          style:TextStyle( fontSize: 30),),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: <Widget>[
            RaisedButton(onPressed: (){
              setState(() {
                EasyLocalization.of(context).locale = Locale('de','DE');
              });
            },child: Text('german'.tr().toString()),),
            RaisedButton(onPressed: (){
              setState(() {
                EasyLocalization.of(context).locale = Locale('en','US');
              });
            },child: Text('english'.tr().toString()),)
          ],)
        ],
      ),
    );
  }
}
