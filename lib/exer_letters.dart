import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komatzalef/letters.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import 'globals.dart';




class WidgetExerciseLetters extends StatefulWidget {
  const WidgetExerciseLetters({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WidgetExerciseLetters> createState() => _WidgetExerciseLettersState();
}

class _WidgetExerciseLettersState extends State<WidgetExerciseLetters> {

  int repetition = 1;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: globalColor,
        appBar: buildAppBar(context, widget.title),
        body: Consumer<OisProvider>(builder: (context, oisProvider, child) {
          List _list = oisProvider.get();

          List<Widget> wl = [];

          wl.add(
              buildDescriptions(
                  english: 'Select how many repetitions of each letter',
                  spanish: 'Elige cuántas repeticiones de cada letra')
          );

          wl.add(const SizedBox(height: 5,));

          wl.add(NumberPicker(
            textStyle: TextStyle(
              fontFamily: globalFontFamily,
              fontSize: 40,
              color: Colors.blue.shade200
            ),
            selectedTextStyle: const TextStyle(
              fontFamily: globalFontFamily,
              fontSize: 60,
              color: Colors.blue
            ),
            itemHeight: 100,
            axis: Axis.horizontal,
            value: repetition,
            minValue: 1,
            maxValue: 15,
            onChanged: (value) => setState(() => repetition = value),
          ));

          wl.add(const SizedBox(height: 10,));

          wl.add(
              buildDescriptions(
                  english: 'Select which letters exercise',
                  spanish: 'Elige qué letras ejercitar')
          );

          wl.add(const SizedBox(height: 10,));

          wl.add(Padding(
            padding: const EdgeInsets.only(right: 32),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  oisProvider.unselectAll();
                },
              ),
            ),
          ));

          wl.add(const SizedBox(height: 5,));

          for (int i = 0; i < _list.length; i++) {
            wl.add(Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CheckboxListTile(
                title: Text(_list[i].ois,
                    style: const TextStyle(
                      fontFamily: globalFontFamily,
                      fontSize: globalFontSize,
                    )),

                value: oisProvider.isSelected(_list[i]),
                onChanged: (value) {
                  value as bool ? oisProvider.select(_list[i]) : oisProvider.unselect(_list[i]);
                },
              ),
            ));
          }

          return SingleChildScrollView(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              textDirection: TextDirection.rtl,
              alignment: WrapAlignment.center,
              children: wl,
            ),
          );
        }),
      floatingActionButton:
        FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            if (Provider.of<OisProvider>(context, listen: false).getSelectedCount() > 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      WidgetLetters(
                        title: "Some Letters",
                        type: LetterType.someLetters,
                        repetition: repetition,
                      )));
              }
            },
        ),
    );

    // show a list of letters to select which letters use in the exercise

  }


}