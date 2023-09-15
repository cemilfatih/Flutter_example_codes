import 'package:flutter/material.dart';

import 'baseFirebaseModel.dart';


class versionModel  with IDModel,baseFirebaseModel<versionModel> {
  final String? number;

  versionModel({
    this.number,
  });

  @override
  List<Object?> get props => [number];

  versionModel copyWith({
    String? number,
  }) {
    return versionModel(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
    };
  }

  versionModel fromJson(Map<String, dynamic> json) {
    return versionModel(
      number: json['number'] as String?,
    );
  }

  @override
  // TODO: implement id
  String? get id => throw UnimplementedError();
}



class splashCodeModel  with IDModel,baseFirebaseModel<splashCodeModel> {
  final String? code;

  splashCodeModel({
    this.code,
  });

  @override
  List<Object?> get props => [code];

  splashCodeModel copyWith({
    String? number,
  }) {
    return splashCodeModel(
      code: number ?? this.code,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': code,
    };
  }

  splashCodeModel fromJson(Map<String, dynamic> json) {
    return splashCodeModel(
      code: json['number'] as String?,
    );
  }

  @override
  // TODO: implement id
  String? get id => throw UnimplementedError();

}