import 'dart:convert';
import 'package:refactor_room_sharing/models/pay_item.dart';

class YetItemList {
  List<PayItem> yetItems;

  YetItemList.fromJsonString(String jsonString) {
    final dynamic parsedJson = json.decode(jsonString);
    final dynamic deserializedObjects =
    parsedJson.map((dynamic o) => PayItem.fromJson(o)).toList();
    this.yetItems = deserializedObjects.cast<PayItem>();
  }
}
