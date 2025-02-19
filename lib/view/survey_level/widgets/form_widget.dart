import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:telios_2/view/view.dart';
import '../../../model/model.dart';
import '../../../settings/helper/helper.dart';
import '../../../settings/theme/colors.dart';
import '../../../view_model/survey/survey.dart';

class FormWidget extends StatelessWidget {
  final String assignedLevelKey;
  final SurveyLevel level;
  final MapLevel mapLevel;


  const FormWidget({
    super.key,
    required this.assignedLevelKey,
    required this.level,
    required this.mapLevel,

  });

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      padding: EdgeInsets.all(0),
      height: Responsive.isMobile(context) ? double.maxFinite : 700,
      width: !Responsive.isMobile(context) ? 350 : double.maxFinite,
      margin: EdgeInsets.all(15)
          .copyWith(right: Responsive.isMobile(context) ? 15 : 0),
      child: GetBuilder<SurveyController>(builder: (controller) {
        if (controller.r.state == ResponseState.loading ||
            controller.isFormLoading.value) {
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

  void showClearDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        type: AlertDialogType.warning,
        title: 'Clear Form',
        message:
            'Are you sure you want to clear all survey data? \n This action cannot be undone.',
        onConfirm: () {
          controller.clearAnswers();
          controller.clearData.value = true;
          controller.update();
          controller.takeSurvey(
            context: context,
            level: level,
            event: mapLevel,
          
          );
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int initialIndex = 0;

    for (int i = 0; i < questionModelList.length; i++) {
      if (controller.selectedAnswer.value?.answers?.any((element) =>
              questionModelList[i]
                  .questions
                  .any((q) => q.questionId == element.questionId)) ??
          false) {
        initialIndex = i;
        break;
      }
    }

    return questionModelList.isEmpty
        ? const Center(
            child: Text('No Data'),
          )
        : DefaultTabController(
            length: questionModelList.length,
            initialIndex: initialIndex,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        level.levelName!,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: TextButton(
                          onPressed: () {
                            showClearDialog(context);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Clear'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 15, bottom: 15),
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
                            const Size.fromHeight(50), // Set desired height
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
                const SizedBox(height: 10),
                Expanded(
                  child: TabBarView(
                    // physics: Scrollable(viewportBuilder: viewportBuilder),
                    children: questionModelList.map((model) {
                      return QuestionListView(
                        controller: controller,
                        model: model,
                        level: level,
                        mapLevel: mapLevel,
                       
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
  }
}

class QuestionListView extends StatefulWidget {
  final QuestionModel model;

  final SurveyController controller;
  final SurveyLevel level;
  final MapLevel mapLevel;

  const QuestionListView({
    super.key,
    required this.model,
    required this.controller,
    required this.level,
    required this.mapLevel,

  });

  @override
  State<QuestionListView> createState() => _QuestionListViewState();
}

class _QuestionListViewState extends State<QuestionListView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: List.generate(widget.model.questions.length + 1, (index) {
            if (index == widget.model.questions.length) {
              return Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: TextButtonWidget(
                        bgColor: AppColor.primary,
                        fgColor: Colors.white,
                        boderRadius: 10,
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          await Future.delayed(
                              const Duration(milliseconds: 50));
                          if (_formKey.currentState!.validate()) {
                            widget.controller
                                .setQuestion(widget.model.surveyId);
                            widget.controller.takeSurvey(
                              level: widget.level,
                              event: widget.mapLevel,
                              context: context,
      
                            );
                          }
                        },
                        isLoading: widget.controller.isUploading.value,
                        name: "Submit",
                      ),
                    ),
                  ],
                ),
              );
            }

            return QuestionWidget(
              key: ValueKey(widget.model.questions[index].questionId),
              question: widget.model.questions[index],
              a: widget.controller.selectedAnswer.value?.answers
                  ?.where((element) {
                return element.questionId ==
                    widget.model.questions[index].questionId;
              }).firstOrNull,
            );
          }),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final Question question;
  final Answer? a;
  final FocusNode? focusNode;
  final VoidCallback? onFieldSubmitted;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.a,
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late TextEditingController _controller;
  late MultiSelectController<dynamic>? _Mcontroller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.a?.answer ?? '');
    _Mcontroller = MultiSelectController<dynamic>();

    // Handle regular options
    if (widget.question.options != null &&
        widget.question.options!.isNotEmpty) {
      final availableOptions = widget.question.options!.map((option) {
        return ValueItem(
          label: option.name,
          value: option.id,
        );
      }).toList();

      _Mcontroller?.setOptions(availableOptions);

      // Filter selected options to only include those in the available options
      final selectedOptions = widget.a?.answerOptions?.where((answer) {
            return availableOptions.any((option) => option.value == answer.id);
          }).map((e) {
            return ValueItem(
              label: e.name,
              value: e.id,
            );
          }).toList() ??
          [];

      final availableOptionValues =
          availableOptions.map((option) => option.value).toSet();
      final filteredSelectedOptions = selectedOptions
          .where((option) => availableOptionValues.contains(option.value))
          .toList();

      _Mcontroller?.setSelectedOptions(filteredSelectedOptions);
    }

    // Handle nested options
    if (widget.question.nestedOptions != null &&
        widget.question.nestedOptions!.isNotEmpty) {
      final availableNestedOptions =
          widget.question.nestedOptions?.values.expand((option) {
                return option.map((e) {
                  return ValueItem(
                    label: e.name,
                    value: e.id,
                  );
                });
              }).toList() ??
              [];

      _Mcontroller?.setOptions(availableNestedOptions);

      // Filter selected options to only include those in the available nested options
      final selectedNestedOptions = widget.a?.answerOptions
              ?.where((answer) {
                return availableNestedOptions
                    .any((option) => option.value == answer.id);
              })
              .map((e) => ValueItem(
                    label: e.name,
                    value: DItem(e.name, e.id),
                  ))
              .toList() ??
          [];

      final availableNestedOptionValues =
          availableNestedOptions.map((option) => option.value).toSet();
      final filteredSelectedNestedOptions = selectedNestedOptions
          .where((option) => availableNestedOptionValues.contains(option.value))
          .toList();

      _Mcontroller?.setSelectedOptions(filteredSelectedNestedOptions);
    }

    widget.question.multiAnswernestedAnswer
      ..clear()
      ..addAll(widget.a?.answerOptions ?? []);

    widget.question.multiAnswer
      ..clear()
      ..addAll(widget.a?.answerOptions ?? []);

    widget.question.answer.value = _controller.text;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.question.isquestionVisble ?? true)
            Text(widget.question.question,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          _buildAnswerWidget(),
        ],
      ),
    );
  }

  Widget _buildAnswerWidget() {
    switch (widget.question.typeId) {
      case 1:
      case 5:
        return widget.question.typeId == 5
            ? _buildCounterRow()
            : TextFieldWidget(
                // labelText: widget.question.question,
                fillColor: Color(widget.question.colorcode ?? 0xFFFFFFFF),
                textEditingController: _controller,
                onChanged: (value) => widget.question.answer.value = value,
                hintText: widget.question.hint ?? '',
                validate: (n) {
                  return;
                },
                keyboardType: TextInputType.text,
              );
      case 6:
        return TextFieldWidget(
          // labelText: widget.question.question,
          onChanged: (value) => widget.question.answer.value = value,
          textEditingController: _controller,
          fillColor: Color(widget.question.colorcode ?? 0xFFFFFFFF),
          keyboardType: TextInputType.text,
          hintText: widget.question.hint ?? '',
          validate: (n) {
            return;
          },
          maxLines: 3,
        );

      case 2:
        List<ValueItem<DItem>> d = [];

        widget.question.nestedOptions?.forEach((key, value) {
          for (var element in value) {
            d.add(ValueItem(
              label: element.name,
              value: DItem(element.name, element.id),
            ));
          }
        });

        return widget.question.options != null &&
                widget.question.options!.isNotEmpty
            ? MultiDropdownWidget(
                hintText: widget.question.hint ?? '',
                // question: widget.question.question,
                items: widget.question.options!.map((option) {
                  return ValueItem(
                    label: option.name,
                    value: DItem(option.name, option.id),
                  );
                }).toList(),
                controller: _Mcontroller,
                onSelectionChange: (value) {
                  widget.question.multiAnswer.clear();
                  final selected =
                      value.map((v) => DItem(v.label, v.value)).toList();
                  widget.question.multiAnswer
                    ..clear()
                    ..addAll(selected);
                },
              )
            : widget.question.nestedOptions != null &&
                    widget.question.nestedOptions!.isNotEmpty &&
                    d.isNotEmpty
                ? MultiDropdownWidget(
                    hintText: widget.question.hint ?? '',
                    // question: widget.question.question,
                    items: d,
                    controller: _Mcontroller,
                    onSelectionChange: (value) {
                      final selected =
                          value.map((v) => DItem(v.label, v.value)).toList();

                      widget.question.multiAnswernestedAnswer
                        ..clear()
                        ..addAll(selected);
                    },
                  )
                : const SizedBox();

      default:
        return const Text('Unsupported question type');
    }
  }

  Widget _buildCounterRow() {
    return Row(
      children: [
        Expanded(
          child: TextFieldWidget(
            fillColor: Color(widget.question.colorcode ?? 0xFFFFFFFF),
            onChanged: (value) {
              widget.question.answer.value = value;
              _controller.text = value;
            },
            textEditingController: _controller,
            hintText: widget.question.hint ?? '',
            validate: (n) {
              if (n == '0') {
                return "If 0 Leave it empty";
              } else {
                return null;
              }
            },
            inputFormatters: [
              if (widget.question.type == '5')
                FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: widget.question.type == '5'
                ? TextInputType.number
                : TextInputType.text,
          ),
        ),
        if (widget.question.isCounter ?? false) ...[
          const SizedBox(width: 15),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              int currentValue = int.tryParse(_controller.text) ?? 0;
              if (currentValue > 0) {
                currentValue--;
                _controller.text = currentValue.toString();
                widget.question.answer.value = _controller.text;
              }
            },
            icon: const Icon(Icons.remove),
          ),
          const SizedBox(width: 15),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColor.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              int currentValue = int.tryParse(_controller.text) ?? 0;
              currentValue++;
              _controller.text = currentValue.toString();
              widget.question.answer.value = _controller.text;
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ],
    );
  }
}

// class MultiDropdownWidget extends StatelessWidget {
//   final void Function(List<DItem>)? onSelectionChange;
//   final List<DropdownItem<DItem>> items;
//   final MultiSelectController<DItem> controller;
//   final List<DropdownItem> disabledOptions;
//   final String hintText;
//   final String question;

//   const MultiDropdownWidget(
//       {super.key,
//       required this.hintText,
//       required this.question,
//       required this.items,
//       required this.onSelectionChange,
//       this.disabledOptions = const [],
//       required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           question,
//           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         MultiDropdown<DItem>(
//           items: items,
//           controller: controller,
//           enabled: true,
//           searchEnabled: true,
//           fieldDecoration: FieldDecoration(
//             hintText: hintText,
//             backgroundColor: AppColor.backround,
//             // prefixIcon: const Icon(Icons.check_circle),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(7),
//               borderSide: const BorderSide(color: Colors.grey),
//             ),

//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(7),
//               borderSide: const BorderSide(
//                 color: AppColor.primary,
//               ),
//             ),
//           ),
//           onSelectionChange: onSelectionChange,
//           dropdownDecoration: DropdownDecoration(
//             marginTop: 2,
//             maxHeight: 600,
//             header: Padding(
//               padding: EdgeInsets.all(8),
//               child: Text(
//                 'Select $hintText from the list',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           chipDecoration: ChipDecoration(
//             wrap: true,
//             deleteIcon: Icon(Icons.close, color: Colors.white, size: 16),
//             backgroundColor: AppColor.primary,
//             labelStyle: TextStyle(color: Colors.white),
//             borderRadius: BorderRadius.circular(7),
//           ),
//         ),
//       ],
//     );
//   }
// }

class MultiDropdownWidget extends StatelessWidget {
  final void Function(List<ValueItem<dynamic>>)? onSelectionChange;
  final List<ValueItem> items;
  final MultiSelectController<dynamic>? controller;
  final List<ValueItem<dynamic>> disabledOptions;

  final String hintText;

  const MultiDropdownWidget(
      {super.key,
      required this.hintText,
      required this.items,
      required this.onSelectionChange,
      this.disabledOptions = const [],
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown(
      controller: controller,
      onOptionSelected: onSelectionChange,
      disabledOptions: disabledOptions,
      options: const [],
      selectionType: SelectionType.multi,
      chipConfig: const ChipConfig(wrapType: WrapType.scroll),
      dropdownHeight: 300,
      optionTextStyle: const TextStyle(fontSize: 16),
      selectedOptionIcon: const Icon(Icons.check_circle),
      borderRadius: 7,
      fieldBackgroundColor: AppColor.backround,
      borderColor: AppColor.primary,
      hint: hintText,
    );
  }
}
