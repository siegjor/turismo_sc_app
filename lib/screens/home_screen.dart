import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismo_sc_app/controllers/home_provider.dart';
import 'package:turismo_sc_app/screens/favorite_screen.dart';

import 'components/attraction_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atrações turísticas'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const FavoriteScreen();
              }),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Consumer<HomeProvider>(
                  builder: (context, homeProvider, child) {
                final List attractionList = homeProvider.allAttractionsList;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: attractionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final attraction = attractionList[index];

                    return AttractionTile(
                      attraction: attraction,
                      provider: homeProvider,
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
