import 'package:beanies/data/blocs/user/user_cubit.dart';
import 'package:beanies/data/models/game.dart';
import 'package:beanies/views/widgets/score_summary_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:beanies/data/utils/extensions.dart';
import 'package:provider/provider.dart';

class ScoreChart extends StatelessWidget {
  final Game _game;
  const ScoreChart(this._game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _game.users
                        .map<Widget>((userId) => Text(context
                            .read<UserCubit>()
                            .getUserName(userId)
                            .toString()))
                        .toList(),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index + 1 == _game.currentRound) {
                    return Column(
                      children: [
                        Divider(
                          color: Colors.black54,
                        ),
                        ScoreSummaryListTile(
                            title: 'Sum', scores: _game.toTotalScores()),
                      ],
                    );
                  } else {
                    return ScoreSummaryListTile(
                        title: 'Round ${index + 1}',
                        scores: _game.scores[index]);
                  }
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: _game.currentRound),
          ],
        ),
      ),
    );
  }
}
