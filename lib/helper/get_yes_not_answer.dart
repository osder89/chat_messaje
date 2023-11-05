import 'package:chat_messaje/models/yes_not_models.dart';

import '../entities/menssage.dart';
import 'package:dio/dio.dart';

class GetYesNotAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNotModel = YesNotModel.fromMap(response.data);
    return yesNotModel.toMessageEntity();
  }
}
