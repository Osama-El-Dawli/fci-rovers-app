import 'package:fci_rovers_app/core/widgets/custom_tile_widget.dart';
import 'package:fci_rovers_app/features/home/widgets/image_slider.dart';
import 'package:flutter/material.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTileWidget(title: 'معرض الصور'),
        SizedBox(height: 32),
        ImageSlider(),
      ],
    );
  }
}
