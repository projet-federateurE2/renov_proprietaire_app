import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/values/strings.dart';

import '../../blocs/work_selection/select_work_bloc.dart';
import 'icon_background_circle.dart';

class WorkSelectionDescription extends StatefulWidget {
  final Work work;
  const WorkSelectionDescription({Key? key, required this.work})
      : super(key: key);

  @override
  State<WorkSelectionDescription> createState() => _WorkSelectionDescription();
}

class _WorkSelectionDescription extends State<WorkSelectionDescription> {
  var isPressed = false;
  Color color = ColorsRenov.primaryGreen;

  @override
  Widget build(BuildContext context) {
    var sizeIcon =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width * 0.03
            : MediaQuery.of(context).size.height * 0.03;
    var iconBackgroundCircle = IconBackgroundCircle(
        imageSize: MediaQuery.of(context).size.width >
                MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width * 0.1
            : MediaQuery.of(context).size.height * 0.1,
        topCirclePosition: 15,
        rightCirclePosition: 15,
        url: widget.work.urlImage);

    return BlocBuilder<SelectWorkBloc, SelectWorkState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.only(left: 24),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: AutoSizeText(
                    widget.work.titleDesc,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(
                      top: 12,
                      bottom: 48,
                      left: 16,
                    ),
                    child: iconBackgroundCircle),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 16, right: 32, bottom: 16),
                      child: SvgPicture.asset(
                        'icons/bulb.svg',
                        width: sizeIcon,
                        height: sizeIcon,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16, right: 32),
                        child: AutoSizeText(
                          widget.work.txt1,
                          maxLines: 4,
                          // textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 16, right: 24, bottom: 0),
                      child: SvgPicture.asset(
                        'icons/warning.svg',
                        width: sizeIcon,
                        height: sizeIcon,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 32),
                        child: AutoSizeText(
                          widget.work.txt2,
                          maxLines: 3,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 4,
                              color: state.valideWork
                                      .where((element) =>
                                          element.id.contains(widget.work.id))
                                      .isNotEmpty
                                  ? Colors.red
                                  : ColorsRenov.primaryGreen,
                            )),
                        margin: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 44),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            BlocProvider.of<SelectWorkBloc>(context).add(ValitedWorkEvent( widget.work, state.malisteWork, state.user));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 4),
                            child: AutoSizeText(
                              state.valideWork
                                      .where((element) =>
                                          element.id.contains(widget.work.id))
                                      .isNotEmpty
                                  ? TextRenov.removeWork
                                  : TextRenov.addWork,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: state.valideWork
                                        .where((element) =>
                                            element.id.contains(widget.work.id))
                                        .isNotEmpty
                                    ? Colors.red
                                    : ColorsRenov.primaryGreen,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}