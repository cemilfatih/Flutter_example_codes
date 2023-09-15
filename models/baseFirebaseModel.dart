import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class IDModel{
  String? get id;
}

abstract class  baseFirebaseModel <T extends IDModel> {

  T fromJson(Map<String, dynamic> json);

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();

    if (data == null) {
      throw Exception("data is null");
    }

    data.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(data);
  }

}