enum splashScreenEnum {

  //bakımdayız
  keeping,

  //özel tema
  specialTheme,

  //force update
  forceUpdate,

  //home
  home;

  int get screenCode{

    try{

      switch(this){
        case splashScreenEnum.forceUpdate:
          return 0;

        case splashScreenEnum.keeping:
          return 1;

        case splashScreenEnum.specialTheme:
          return 2;

        case splashScreenEnum.home:
          return 3;
      }
    }catch(e){
      throw Exception("splashScreenEnum screenCode error: $e");
    }


  }
}