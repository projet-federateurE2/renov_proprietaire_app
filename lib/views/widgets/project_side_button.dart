import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';

class ProjectSideButton extends StatelessWidget {
  final String text;
  final String urlIcon;

  const ProjectSideButton({Key? key, required this.text, required this.urlIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconSize = 20.0;

    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.1,
      child: Card(
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.5)),
        child: InkWell(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: 30, right: iconSize, bottom: ((iconSize * 0.3))),
                child: IconBackgroundCircle(
                    imageSize: iconSize,
                    topCirclePosition: 2,
                    rightCirclePosition: 2,
                    url: urlIcon),
              ),
              Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}