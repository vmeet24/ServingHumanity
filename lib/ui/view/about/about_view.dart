import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'about_view_model.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutViewModel>.reactive(
        builder: (context, model, child) => Scaffold(),
        viewModelBuilder: () => AboutViewModel());
  }
}
