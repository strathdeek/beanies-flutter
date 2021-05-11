import 'package:flutter/material.dart';

class ScoreSummaryListTile extends StatelessWidget {
  final String title;
  final Map<String, int> scores;
  const ScoreSummaryListTile({
    Key? key,
    required this.title,
    required this.scores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 100,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            )),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: scores.values
                .map<Widget>((value) => Text(value.toString()))
                .toList(),
          ),
        )
      ],
    );
  }
}
