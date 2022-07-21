import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_flutter/data/data_storage.dart';
import 'package:movie_flutter/data/model/topic.dart';
import 'package:movie_flutter/utils/theme.dart';

final topicStorage = AssetTopicStorage();

class ChooseTopic extends StatelessWidget {
  const ChooseTopic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: _Header(),
            ),
            Flexible(
              flex: 3,
              child: FutureBuilder<List<Topic>>(
                future: topicStorage.load(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final topics = snapshot.data!;
                  return MasonryGridView.count(
                    crossAxisCount: 2,
                    itemCount: topics.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemBuilder: ((context, index) {
                      final topic = topics[index];
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: topic.bgColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            LayoutBuilder(builder: (context, constraints) {
                              return SvgPicture.asset(
                                topic.thumbnail,
                                width: constraints.maxWidth,
                              );
                            }),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                topic.title.toString(),
                                style: PrimaryFont.bold(
                                        context.screenSize.shortestSide * 0.04)
                                    .copyWith(color: topic.textColor),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(flex: 2),
          Flexible(
            flex: 3,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: "What Brings you\n",
                  style: PrimaryFont.medium(28).copyWith(color: kColorDarkGrey),
                  children: [
                    TextSpan(
                      text: "to Silent Moon?",
                      style: PrimaryFont.thin(28),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            flex: 1,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(
                "choose a topic to focuse on:",
                style: PrimaryFont.light(20).copyWith(
                  color: kColorGrey,
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
