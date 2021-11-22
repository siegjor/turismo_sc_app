import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismo_sc_app/controllers/home_provider.dart';

import 'components/attraction_tile.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atrações favoritas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Consumer<HomeProvider>(
                  builder: (context, homeProvider, child) {
                List favoriteAttractions = homeProvider.allAttractionsList
                    .where((element) =>
                        homeProvider.favAttractionList.contains(element.id))
                    .toList();

                return favoriteAttractions.isEmpty
                    ? Center(
                        child: Container(
                          margin: const EdgeInsets.all(30),
                          child: const Text(
                            'Ainda não há favoritos, comece adicionando um!',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: favoriteAttractions.length,
                        itemBuilder: (BuildContext context, int index) {
                          final attraction = favoriteAttractions[index];

                          return AttractionTile(
                            attraction: attraction,
                            provider: homeProvider,
                            hasFavoriteIcon: false,
                          );
                        },
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
