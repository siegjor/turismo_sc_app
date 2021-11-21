import 'package:flutter/widgets.dart';
import 'package:turismo_sc_app/models/attraction_model.dart';
import 'package:turismo_sc_app/repositories/attraction_repository.dart';

class HomeProvider extends ChangeNotifier {
  final List<AttractionModel> _favList = [];
  final repository = AttractionRepository();

  List<AttractionModel> get favAttractionList => _favList;

  Future<List<AttractionModel>> getAttractions() async {
    return await repository.fetchAttractions();
  }

  void addFavorite(AttractionModel touristAttraction) {
    touristAttraction.isFavorite = true;
    _favList.add(touristAttraction);
    notifyListeners();
  }

  void removeFavorite(AttractionModel touristAttraction) {
    touristAttraction.isFavorite = false;
    _favList.remove(touristAttraction);
    notifyListeners();
  }
}
