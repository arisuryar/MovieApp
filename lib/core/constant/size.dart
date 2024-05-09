import 'package:flutter/material.dart';

class AppSize {
  double heightBody(BuildContext context) {
    return MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + kToolbarHeight);
  }
}
