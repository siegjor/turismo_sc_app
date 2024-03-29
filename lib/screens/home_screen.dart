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
              child: FutureBuilder(
                  future: Provider.of<HomeProvider>(context, listen: false)
                      .getAttractions(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          'Ocorreu um erro! Por favor tente novamente.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final attraction = snapshot.data[index];

                          return Consumer<HomeProvider>(
                              builder: (context, homeProvider, child) {
                            return AttractionTile(
                              attraction: attraction,
                              provider: homeProvider,
                              isFavorite: homeProvider.favAttractionList
                                  .contains(attraction.id),
                            );
                          });
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
