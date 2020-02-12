import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:refactor_room_sharing/models/pay_item.dart';

class YetItemList extends ChangeNotifier{
  List<PayItem> yetItems;

  YetItemList.fromJsonString(String jsonString) {
    final dynamic parsedJson = json.decode(jsonString);
    final dynamic deserializedObjects =
    parsedJson.map((dynamic o) => PayItem.fromJson(o)).toList();
    this.yetItems = deserializedObjects.cast<PayItem>();
  }

  void add(PayItem item) {
    this.yetItems.add(item);
    notifyListeners();
  }
}
