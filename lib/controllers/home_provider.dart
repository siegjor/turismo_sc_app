import 'package:flutter/widgets.dart';
import 'package:turismo_sc_app/models/tourist_attraction.dart';

class HomeProvider extends ChangeNotifier {
  final List<TouristAttraction> _favList = [];
  final List<TouristAttraction> _allAttractionsList = [
    TouristAttraction(
      1,
      'Praia do Riso',
      'assets/images/serra_rio_rastro.jpg',
      'Florianópolis',
      '(48) 912345678',
      '07:00 - 23:00',
      'praiadoriso.com.br',
      25.99,
    ),
    TouristAttraction(
      2,
      'Serra do Rio do Rastro',
      'assets/images/serra_rio_rastro.jpg',
      'Guatá',
      '(48) 912345678',
      '07:00 - 23:00',
      'praiadoriso.com.br',
      25.99,
    ),
    TouristAttraction(
      3,
      'Oktoberfest',
      'assets/images/serra_rio_rastro.jpg',
      'Blumenau',
      '(48) 912345678',
      '07:00 - 23:00',
      'praiadoriso.com.br',
      25.99,
    ),
    TouristAttraction(
      4,
      'Monumento Cnde d\'Eu',
      'assets/images/serra_rio_rastro.jpg',
      'Orleans',
      '(48) 912345678',
      '07:00 - 23:00',
      'praiadoriso.com.br',
      25.99,
    ),
    TouristAttraction(
      5,
      'Beto Carrero',
      'assets/images/serra_rio_rastro.jpg',
      'Penha',
      '(48) 912345678',
      '07:00 - 23:00',
      'praiadoriso.com.br',
      25.99,
    ),
  ];

  List<TouristAttraction> get favAttractionList => _favList;

  List<TouristAttraction> get allAttractionsList => _allAttractionsList;

  void addFavorite(TouristAttraction touristAttraction) {
    touristAttraction.isFavorite = true;
    _favList.add(touristAttraction);
    notifyListeners();
  }

  void removeFavorite(TouristAttraction touristAttraction) {
    touristAttraction.isFavorite = false;
    _favList.remove(touristAttraction);
    notifyListeners();
  }
}
