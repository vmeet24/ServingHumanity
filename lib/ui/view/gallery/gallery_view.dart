import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'gallery_view_model.dart';

class GalleryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GalleryViewModel>.reactive(
        builder: (context, model, child) => Scaffold(),
        viewModelBuilder: () => GalleryViewModel());
  }
}
