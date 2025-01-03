// class ListingModel {
//   const ListingModel(
//     this.name,
//     this.category,
//     this.id,
//     this.categoryList,
//     this.answers,
//   );

//   final String name;
//   final String id;
//   final int category;
//   final Map<int, int>? categoryList;
//   final Map<String,String>? answers;
// }



class ListingModel {
  const ListingModel({
    required this.name,
    required this.category,
    required this.id,
    this.answers,
    this.categoryList,
  });

  final String name;
  final String id;
  final int category;
  final List<ListingAnswers>? answers;
  final Map<int, int>? categoryList;
}

class ListingAnswers {
  final String answer;
  final String question;
  final String color;

  const ListingAnswers({
    required this.answer,
    required this.question,
    required this.color,
  });
}
