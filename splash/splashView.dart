import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/enums/splashScreenEnum.dart';
import 'package:ieee_mobile_app/features/splash/splashLogic.dart';
import 'package:ieee_mobile_app/features/splash/splashScreen.dart';
import 'package:ieee_mobile_app/main.dart';

class splashView extends StatefulWidget {
  const splashView({Key? key}) : super(key: key);

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: splashLogic().checkAppVersion(),
        builder: (BuildContext context,
            AsyncSnapshot<int> snapshot ){

          switch (snapshot.connectionState){
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return splashScreen();
            case ConnectionState.done:
              return routerWidget(snapshot.data!);

          }
          throw Exception("Can not receive connection state info while getting version state");

        }
    );}
}


// Front ekibi buraya bakacak
Widget routerWidget(int data){

    if(data == splashScreenEnum.forceUpdate.screenCode) {
      return splashScreen();
    } else if(data == splashScreenEnum.keeping.screenCode){
      return Container(
        child: Text("Keeping"),
      );
    }else if(data == splashScreenEnum.specialTheme.screenCode){
      return Container(
        child: Text("Special Theme"),
      );
    } else if(data == splashScreenEnum.home.screenCode){
      return Home();
    }
  
  throw Exception("Router Widget-Splash View// Screen Code Error code: $data");
}