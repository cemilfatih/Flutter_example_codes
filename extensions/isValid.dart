import 'package:flutter/material.dart';

extension validator on String{

  bool get isValidMail{

    //final emailRegExp = RegExp(r'^[a-zA-Z0-9_.+-]+@gtu\.edu\.tr$');
    // Spam sorunu çözülünce düzenlenecek kod .
    final emailRegExp = RegExp(r'^[a-zA-Z0-9_.+-@]$');
    return emailRegExp.hasMatch(this);


  }

  bool get isValidName{

    final nameRegExp = new RegExp(r"^[^0-9_!¡?÷?¿/\\,.+=@#$%ˆ&*(){}|~<>;:[\]]{2,30}$");
    return nameRegExp.hasMatch(this);

  }

  bool get isValidPassword{

    // parola kurallarını belirlediğimizde eklenecek
    return true;
  }

  bool get isValidPhone{

    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isNull {
    return this!.isEmpty;

  }

}

