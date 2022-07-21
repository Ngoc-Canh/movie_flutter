import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_flutter/pages/choose_topic.dart';
import 'package:movie_flutter/utils/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimary,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: 0.6,
                widthFactor: 1,
                child: FittedBox(
                  fit: BoxFit.cover,
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset("assets/images/background_image.svg"),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 0.35,
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: SvgPicture.asset(
                      "assets/images/ic_logo.svg",
                      alignment: const Alignment(0.0, -0.8),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: FittedBox(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Hi Afsar, Welcome\n",
                          style: PrimaryFont.medium(30).copyWith(
                            color: kColorLightYellow,
                            height: 1.2,
                          ),
                          children: [
                            TextSpan(
                              text: "to Silent Moon",
                              style: PrimaryFont.thin(30)
                                  .copyWith(color: kColorLightYellow),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          child: Text(
                            "Explore the app, Find some peace of mind to\n prepare for meditation.",
                            style: PrimaryFont.light(16)
                                .copyWith(color: kColorLightGrey, height: 1.4),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('$ChooseTopic');
                },
                child: const Text("GET STARTED"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kColorLightGrey),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(38),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(
                    Size(
                      size.width * 0.9,
                      size.height * 0.06,
                    ),
                  ),
                  foregroundColor: MaterialStateProperty.all(kColorDarkGrey),
                  textStyle: MaterialStateProperty.all(
                    PrimaryFont.medium(size.height * 0.015).copyWith(color: kColorDarkGrey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
