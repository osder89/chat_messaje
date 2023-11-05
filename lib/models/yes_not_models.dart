import 'package:chat_messaje/entities/menssage.dart';

class YesNotModel {
  String answer;
  bool forced;
  String image;

  YesNotModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNotModel.fromMap(Map<String, dynamic> json) => YesNotModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'si' : 'no',
      fromWho: FromWho.hers,
      imageUrl: image);
}
