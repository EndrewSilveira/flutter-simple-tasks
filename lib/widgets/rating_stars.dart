import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_mars/widgets/task_header.dart';

class RatingStars extends StatelessWidget {
  final RatingCallback onRatingUpdated;
  final double taskDifficulty;
  final double itemSize;
  final bool ignoreGestures;

  const RatingStars({
    super.key,
    required this.onRatingUpdated,
    required this.taskDifficulty,
    required this.itemSize,
    required this.ignoreGestures,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: itemSize,
      initialRating: taskDifficulty,
      minRating: 0,
      maxRating: 5,
      glow: false,
      ignoreGestures: ignoreGestures,
      allowHalfRating: true,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: Colors.blue,
        ),
        half: const Icon(
          Icons.star_half,
          color: Colors.blue,
        ),
        empty: const Icon(
          Icons.star_border,
          color: Colors.blue,
        ),
      ),
      onRatingUpdate: (rating) {
        onRatingUpdated(rating);
      },
    );
  }
}
