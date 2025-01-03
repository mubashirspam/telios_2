import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/view/widgets/widgets.dart';
import 'package:telios_2/view_model/survey/survey_controller.dart';

import '../../settings/settings.dart';
import 'widgets/widgets.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SurveyController>(builder: (s) {
        return Column(
          children: [
            SafeArea(
              bottom: false,
              left: false,
              right: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(top: 15),
                child: SizedBox(
                  child: Row(
                    children: [
                      const BackButtonWidget(),
                      const SizedBox(width: 15),
                      Text(
                        "Pending data for sync",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Spacer(),
                      RotatingSyncIcon(
                          isLoading: s.u.state == ResponseState.loading),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: !s.presentDataForSync.value
                  ? Center(
                      child: Text("No pendings"),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(20).copyWith(top: 0),
                      itemCount: s.surveyTemp.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        childAspectRatio: 15,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 150,
                      ),
                      itemBuilder: (context, index) {
                        final data = s.surveyTemp[index];

                        return Card(
                          color: Theme.of(context).colorScheme.surface,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${data.surveyLevelName}",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                 "${data.surveyLevelKey}",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  "${data.geoJsonLevelName}",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                // SizedBox(
                                //   child: Row(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.center,
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       Text(
                                //           "BLUE: ${data.}"),
                                //       Text("RED: ${state.tVillages[index].mc}"),
                                //       Text(
                                //           "GREEN: ${state.tVillages[index].hc}"),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        );
                      }),
            )
          ],
        );
      }),
    );
  }
}
