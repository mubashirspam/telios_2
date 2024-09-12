import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:telios_2/view/view.dart';
import '../../../model/model.dart';
import '../../../settings/helper/helper.dart';
import '../../../settings/theme/colors.dart';
import '../../../view_model/survey/survey.dart';

class FormWidget extends StatelessWidget {
  final String assignedLevelKey;
  final String sureveyQustionId;
  final SurveyLevel level;
  final MapLevel mapLevel;

  const FormWidget({
    super.key,
    required this.assignedLevelKey,
    required this.sureveyQustionId,
    required this.level,
    required this.mapLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isMobile(context) ? double.maxFinite : 700,
      margin: const EdgeInsets.all(20),
      width: !Responsive.isMobile(context) ? 350 : double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: AppColor.textSecondary.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(1, 1))
          ]),
      child: GetBuilder<SurveyController>(builder: (controller) {
        if (controller.r.state == ResponseState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.r.state == ResponseState.error) {
          return const Center(
            child: Text('Error'),
          );
        }
        if (controller.r.state == ResponseState.completed &&
            controller.r.data != null &&
            controller.r.data!.isNotEmpty) {
          final List<QuestionModel> questionModelList =
              controller.questionsModelList;

          return TabBarWidegt(
            questionModelList: questionModelList,
            level: level,
            controller: controller,
            mapLevel: mapLevel,
          );
        }
        return const Center(
          child: Text('No Data'),
        );
      }),
    );
  }
}

class TabBarWidegt extends StatelessWidget {
  final SurveyLevel level;
  final List<QuestionModel> questionModelList;
  final SurveyController controller;
  final MapLevel mapLevel;

  const TabBarWidegt({
    super.key,
    required this.questionModelList,
    required this.level,
    required this.controller,
    required this.mapLevel,
  });

  @override
  Widget build(BuildContext context) {
    return questionModelList.isEmpty
        ? const Center(
            child: Text('No Data'),
          )
        : DefaultTabController(
            length: questionModelList.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    level.levelName!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 20, bottom: 15),
                  child: Text(
                    level.levelKey!,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColor.textSecondary),
                  ),
                ),
                if (questionModelList.length > 1)
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return PreferredSize(
                        preferredSize:
                            Size.fromHeight(60), // Set desired height
                        child: TabBar(
                          indicatorColor: AppColor.primary,
                          labelColor: AppColor.backround,
                          unselectedLabelColor: AppColor.primary,
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          unselectedLabelStyle:
                              const TextStyle(fontWeight: FontWeight.normal),
                          indicatorPadding: const EdgeInsets.all(10),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.primary,
                          ),
                          tabs: questionModelList.map((model) {
                            return Container(
                              height: 60, // Ensure consistent height
                              alignment: Alignment.center,
                              child: Text(
                                model.surveyName,
                                style: const TextStyle(fontSize: 16),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                SizedBox(height: 10),
                Expanded(
                  child: TabBarView(
                    children: questionModelList.map((model) {
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: model.questions.length + 1,
                        itemBuilder: (context, index) {
                          if (index == model.questions.length) {
                            return Obx(
                              () => Row(
                                children: [
                                  Expanded(
                                    child: TextButtonWidget(
                                      bgColor: AppColor.primary,
                                      fgColor: Colors.white,
                                      boderRadius: 10,
                                      onPressed: () {
                                        controller.setQuestion(model.surveyId);
                                        controller.takeSurvey(
                                          level: level,
                                          event: mapLevel,
                                        );
                                      },
                                      isLoading: controller.isUploading.value,
                                      name: "Submit",
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return QuestionWidget(
                            question: model.questions[index],
                            a: controller.selectedAnswer.value?.answers
                                ?.where(
                                  (element) =>
                                      element.questionId ==
                                      model.questions[index].questionId,
                                )
                                .firstOrNull,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
  }
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Answer? a;

  const QuestionWidget({
    required this.question,
    required this.a,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (question.isquestionVisble ?? true)
            Text(question.question,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildAnswerWidget(),
        ],
      ),
    );
  }

  Widget _buildAnswerWidget() {
    switch (question.typeId) {
      case 1:
      case 5:
        final tController =
            TextEditingController(text: a != null ? a!.answer : '');
        question.answer.value = tController.text;
        return question.typeId == 5
            ? _buildCounterRow(question: question, a: a)
            : TextFieldWidget(
                fillColor: Color(question.colorcode ?? 0xFFFFFFFF),
                textEditingController: tController,
                onChanged: (value) => {question.answer.value = value},
                hintText: question.hint ?? '',
                validate: (n) {
                  return;
                },
                keyboardType: TextInputType.text,
              );
      case 6:
        final tController =
            TextEditingController(text: a != null ? a!.answer : '');
        question.answer.value = tController.text;
        return TextFieldWidget(
          onChanged: (value) => question.answer.value = value,
          textEditingController: tController,
          fillColor: Color(question.colorcode ?? 0xFFFFFFFF),
          keyboardType: TextInputType.text,
          hintText: question.hint ?? '',
          validate: (n) {
            return;
          },
          maxLines: 3,
        );
      case 4:
        return Obx(() => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(question.question),
                const SizedBox(width: 10),
                Switch(
                    value: question.answer.value == 'true',
                    onChanged: (v) {
                      question.answer.value = v.toString();
                    })
              ],
            ));
      // case 2:
      //   return Obx(() => DropdownButton<String>(
      //         value:
      //             question.answer.value.isEmpty ? null : question.answer.value,
      //         items: question.options!.map((String option) {
      //           return DropdownMenuItem<String>(
      //             value: option,
      //             child: Text(option),
      //           );
      //         }).toList(),
      //         onChanged: (String? newValue) {
      //           if (newValue != null) {
      //             question.answer.value = newValue;
      //           }
      //         },
      //       ));
      // case 'nested_dropdown':
      //   return Column(
      //     children: [
      //       Obx(() => DropdownButton<String>(
      //             value: question.answer.value.isEmpty
      //                 ? null
      //                 : question.answer.value,
      //             items: question.options!.map((String option) {
      //               return DropdownMenuItem<String>(
      //                 value: option,
      //                 child: Text(option),
      //               );
      //             }).toList(),
      //             onChanged: (String? newValue) {
      //               if (newValue != null) {
      //                 question.answer.value = newValue;
      //                 question.nestedAnswer.value = '';
      //               }
      //             },
      //           )),
      //       const SizedBox(height: 8),
      //       Obx(
      //         () => question.answer.value.isNotEmpty &&
      //                 question.nestedOptions != null
      //             ? DropdownButton<String>(
      //                 value: question.nestedAnswer.value.isEmpty
      //                     ? null
      //                     : question.nestedAnswer.value,
      //                 items: question.nestedOptions![question.answer.value]!
      //                     .map((String option) {
      //                   return DropdownMenuItem<String>(
      //                     value: option,
      //                     child: Text(option),
      //                   );
      //                 }).toList(),
      //                 onChanged: (String? newValue) {
      //                   if (newValue != null) {
      //                     question.nestedAnswer.value = newValue;
      //                   }
      //                 },
      //               )
      //             : const SizedBox(),
      //       ),
      //     ],
      //   );
      case 2:
        return question.options != null && question.options!.isNotEmpty
            ? Obx(() => Wrap(
                  spacing: 8.0,
                  children: question.options!.map((String option) {
                    return FilterChip(
                      label: Text(option),
                      selected: question.multiAnswer.contains(option),
                      onSelected: (bool selected) {
                        if (selected) {
                          question.multiAnswer.add(option);
                        } else {
                          question.multiAnswer.remove(option);
                        }
                      },
                    );
                  }).toList(),
                ))
            : SizedBox();
      default:
        return const Text('Unsupported question type');
    }
  }

  Widget _buildCounterRow({required Question question, required Answer? a}) {
    final tController = TextEditingController(text: a != null ? a.answer : '');
    question.answer.value = tController.text;
    return Row(
      children: [
        Expanded(
          child: TextFieldWidget(
            fillColor: Color(question.colorcode ?? 0xFFFFFFFF),
            onChanged: (value) {
              question.answer.value = value;
              tController.text = value;
            },
            textEditingController: tController,
            hintText: question.hint ?? '',
            validate: (n) {
              return;
            },
            inputFormatters: [
              if (question.type == '5') FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: question.type == '5'
                ? TextInputType.number
                : TextInputType.text,
          ),
        ),
        if (question.isCounter ?? false) const SizedBox(width: 15),
        if (question.isCounter ?? false)
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              int currentValue = int.tryParse(tController.text) ?? 0;
              if (currentValue > 0) {
                currentValue--;
                tController.text = currentValue.toString();
                question.answer.value = tController.text;
              }
            },
            icon: const Icon(Icons.remove),
          ),
        if (question.isCounter ?? false) const SizedBox(width: 15),
        if (question.isCounter ?? false)
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColor.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              int currentValue = int.tryParse(tController.text) ?? 0;
              currentValue++;
              tController.text = currentValue.toString();
              question.answer.value = tController.text;
            },
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}
