import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renov_proprietaire_app/values/strings.dart';

class SecondaryProjectSideButton extends StatelessWidget {
  final String text;
  final String secondaryText;

  const SecondaryProjectSideButton(
      {Key? key, required this.text, required this.secondaryText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.5)),
      child: InkWell(
        borderRadius: BorderRadius.circular(24.5),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 10.0),
                  ),
                  Text(
                    secondaryText,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 9.0),
                  ),
                ],
              ),
              SvgPicture.asset(IconsRenov.location)
            ],
          ),
        ),
      ),
    );
  }
}
