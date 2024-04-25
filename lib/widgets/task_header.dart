import 'package:flutter/material.dart';
import 'package:project_mars/data/strings.dart';
import 'package:project_mars/widgets/rating_stars.dart';

typedef RatingCallback = void Function(double rating);

class TaskHeader extends StatelessWidget {
  final String taskTitle;
  final String taskImage;
  final double taskDifficulty;
  final VoidCallback onLevelUpPressed;
  final RatingCallback onRatingUpdated;

  const TaskHeader(
      {super.key,
      required this.taskTitle,
      required this.taskImage,
      required this.taskDifficulty,
      required this.onLevelUpPressed,
      required this.onRatingUpdated});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.black12,
            height: 100,
            width: 72,
            child: Image.network(
              taskImage,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: RatingStars(
                      taskDifficulty: taskDifficulty,
                      onRatingUpdated: onRatingUpdated,
                      itemSize: 20,
                      ignoreGestures: true,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 0)),
              ),
              clipBehavior: Clip.hardEdge,
              onPressed: () {
                onLevelUpPressed();
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                  ),
                  Text(
                    Strings.levelUp,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
