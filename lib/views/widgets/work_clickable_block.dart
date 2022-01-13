import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WorkClickableBlock extends StatefulWidget {
  final String urlImage;
  final String workName;
  final Function(String) callback;

  const WorkClickableBlock(
      {Key? key,
      required this.urlImage,
      required this.workName,
      required this.callback})
      : super(key: key);

  @override
  State<WorkClickableBlock> createState() => _WorkClickableBlockState();
}

class _WorkClickableBlockState extends State<WorkClickableBlock> {
  var backgroundColor = Colors.white;
  var fontColor = ColorsRenov.primaryGreen;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
            onTap: () {
              setState(() {
                if (backgroundColor == Colors.white) {
                  widget.callback("RANDON TEXT");
                  backgroundColor = ColorsRenov.primaryGreen;
                  fontColor = Colors.white;
                } else {
                  backgroundColor = Colors.white;
                  fontColor = ColorsRenov.primaryGreen;
                }
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 40,
                    height: 40,
                    child: SvgPicture.asset(widget.urlImage, color: fontColor)),
                Text(widget.workName,
                    style: TextStyle(
                        color: fontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ],
            )));
  }
}
