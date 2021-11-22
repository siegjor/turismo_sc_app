import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turismo_sc_app/models/attraction_model.dart';
import 'package:turismo_sc_app/repositories/attraction_repository.dart';

class HomeProvider extends ChangeNotifier {
  List<int> _favAttractionList = [];
  List<AttractionModel> _allAttractionsList = [];
  final repository = AttractionRepository();

  List<int> get favAttractionList => _favAttractionList;
  List<AttractionModel> get allAttractionsList => _allAttractionsList;

  Future<List> getAttractions() async {
    List attractionsResponse;
    SharedPreferences pref = await SharedPreferences.getInstance();
    //pref.clear();
    if (pref.containsKey('allAttractions')) {
      attractionsResponse = await _loadAllAttractionsFromDisk(pref);
      print('Recuperou os dados do disco!');
    } else {
      print('Pegou os dados da API!');
      _allAttractionsList = await repository.fetchAttractions();
      attractionsResponse = _allAttractionsList;
      _saveAllAttractions();
    }

    return attractionsResponse;
  }

  Future<List> _loadAllAttractionsFromDisk(SharedPreferences pref) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final List<dynamic> jsonList =
        jsonDecode(pref.getString('allAttractions')!) as List;

    for (dynamic attractionJson in jsonList) {
      _allAttractionsList.add(AttractionModel.fromJson(attractionJson));
    }

    await _loadFavAttractions(pref);
    return _allAttractionsList;
  }

  Future<void> _loadFavAttractions(SharedPreferences pref) async {
    String? favAttractionsString = pref.getString('favAttractions');
    if (favAttractionsString != '') {
      List<int> decodedList =
          favAttractionsString!.split(',').map((e) => int.parse(e)).toList();
      _favAttractionList = decodedList;
    }
  }

  void _saveAllAttractions() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> jsonDataList = [];
    for (AttractionModel attraction in _allAttractionsList) {
      jsonDataList.add(attraction.toJson());
    }

    String encodedJson = jsonEncode(jsonDataList);
    pref.setString('allAttractions', encodedJson);

    _saveFavAttractions();
  }

  void _saveFavAttractions() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String encodedList = _favAttractionList.join(',');
    pref.setString('favAttractions', encodedList);
  }

  void addFavorite(AttractionModel touristAttraction) {
    _favAttractionList.add(touristAttraction.id);
    notifyListeners();
    _saveAllAttractions();
  }

  void removeFavorite(AttractionModel touristAttraction) {
    _favAttractionList.remove(touristAttraction.id);
    notifyListeners();
    _saveAllAttractions();
  }
}
