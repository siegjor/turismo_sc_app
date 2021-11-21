import 'package:dio/dio.dart';
import 'package:turismo_sc_app/models/attraction_model.dart';

// main() async {
//   final repository = AttractionRepository();
//   await repository.fetchAttractions();
// }

class AttractionRepository {
  final dio = Dio();
  final url = 'http://localhost:3000/attractions';

  Future<List<AttractionModel>> fetchAttractions() async {
    final response = await dio.get(url);
    final jsonList = response.data as List;
    return jsonList.map((json) => AttractionModel.fromJson(json)).toList();
  }
}
