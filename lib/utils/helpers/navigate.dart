import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class Navigate {
  static navigateTo(context, widget) => Platform.isAndroid
      ? materialNavigateTo(context, widget)
      : cupertinoNavigateTo(context, widget);

  static navigateAndRemove(context, widget) => Platform.isAndroid
      ? materialNavigateAndRemove(context, widget)
      : cupertinoNavigateAndRemove(context, widget);

  static materialNavigateTo(context, widget) => Navigator.of(context)
      .push(MaterialPageRoute(builder: ((context) => widget)));

  static materialNavigateAndRemove(context, widget) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) => widget)), (route) => false);

  static cupertinoNavigateTo(context, widget) => Navigator.push(
      context, CupertinoPageRoute(builder: ((context) => widget)));

  static cupertinoNavigateAndRemove(context, widget) =>
      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(builder: ((context) => widget)), (route) => false);
}
