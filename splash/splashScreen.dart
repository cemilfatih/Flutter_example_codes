import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/enums/FirebaseCollectionsEnum.dart';
import 'package:ieee_mobile_app/features/splash/splashLogic.dart';
import 'package:ieee_mobile_app/models/appVersionModel.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:math';
import '../../models/baseFirebaseModel.dart';

List<String> gifList = [
  'lib/assets/images/splash_gifs/gif0.json',
  'lib/assets/images/splash_gifs/gif1.json',
  'lib/assets/images/splash_gifs/gif2.json',
  'lib/assets/images/splash_gifs/gif3.json',
  'lib/assets/images/splash_gifs/gif4.json',
  'lib/assets/images/splash_gifs/gif5.json',
  // 'lib/assets/images/splash_gifs/gif6.json',
];

Random random = Random();
int randomIndex = random.nextInt(gifList.length);

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              color:
              //Color(0xff00609c),
              Colors.blue
            // gradient: LinearGradient(colors: [Colors.blue[900]!,Colors.white, Colors.white],
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft
            // )
          ),
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: height/2.5,
                        child: Lottie.asset(
                          // "lib/assets/images/splash_gifs/gif7.json"   ,
                          gifList[randomIndex],
                          frameRate: FrameRate(60),
                          repeat: true,
                        )),
                  ),

                  //Lottie.network("https://assets2.lottiefiles.com/packages/lf20_puciaact.json"),
                  Container(
                      height: height / 9,
                      width: width / 1.2,
                      child: Image.asset("lib/assets/images/ieee_white.png")),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 30),
                    child: Text(
                      "IEEE GTÜ MOBİL UYGULAMASI",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(height: height / 15,
                    width: width / 1.2,
                    child : Image.asset("lib/assets/images/splash_gifs/sosyal_medya.png"),
                  ),
                  Container(height: height/5,
                    child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                      TypewriterAnimatedText(
                          speed: Duration(milliseconds: 100),
                          'ÇOK YAKINDA \nBURADAYIZ',
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                              fontSize: height/20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))
                    ]),
                  ),
                  // Text("Uygulamamız yakında sizlerle!",
                  //   style: TextStyle(
                  //     fontSize: 25,
                  //     fontWeight: FontWeight.bold,
                  //   ),

                  // ),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  CustomTextButton(
                    buttonText: "Admin Girişi",
                    buttonColor: Colors.blue,
                    textColor: Colors.white,
                    borderColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(context, '/splashCodePage');
                    },
                  ),
                ],
              ))),
    );
  }
}

class splashPassCodeView extends StatefulWidget {
  const splashPassCodeView({Key? key}) : super(key: key);

  @override
  State<splashPassCodeView> createState() => _splashPassCodeViewState();
}

class _splashPassCodeViewState extends State<splashPassCodeView> {
  var code;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xfff5af19)),
        child: Row(mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width : width/1.2,child: Image.asset("lib/assets/images/splash_gifs/bakim.png")),
                Container(),
                // Lottie.network(
                //     "https://assets5.lottiefiles.com/private_files/lf30_ysjb4sex.json"),
                Container(width: width/2 ,
                  child: TextFormField(

                    cursorColor: Colors.red,
                    controller: _controller,
                    onSaved: (string) {
                      code = string;
                    },
                  ),
                ),

                /*  TextButton(onPressed: () async {
                  final code =  await splashLogic().getCode();

                  code == _controller.text ? Navigator.pushNamed(context, "/homePage") : print("Invalid passcode");


                }, child: Text("Check the code")),

                */
                SizedBox(
                  height: 50,
                ),
                CustomTextButton(
                  buttonText: "Giriş",
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  borderColor: Colors.black,
                  onTap: () async {
                    final code = await splashLogic().getCode();

                    code == _controller.text
                        ? Navigator.pushNamed(context, "/homePage")
                        : print("Invalid passcode");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final Function()? onTap;

  CustomTextButton({
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: borderColor, width: 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
