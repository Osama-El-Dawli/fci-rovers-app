import 'package:fci_rovers_app/core/widgets/custom_tile_widget.dart';
import 'package:flutter/material.dart';

class VideosSection extends StatelessWidget {
  const VideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTileWidget(title: 'الفيديوهات'),
        SizedBox(height: 16),
      ],
    );
  }
}
