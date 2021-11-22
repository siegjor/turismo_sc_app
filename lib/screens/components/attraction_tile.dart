import 'package:flutter/material.dart';
import 'package:turismo_sc_app/controllers/home_provider.dart';
import 'package:turismo_sc_app/models/attraction_model.dart';

import '../attraction_screen.dart';

class AttractionTile extends StatelessWidget {
  final AttractionModel attraction;
  final HomeProvider? provider;
  final bool isOnHomeScreen;
  final bool isFavorite;

  const AttractionTile(
      {required this.attraction,
      this.provider,
      this.isOnHomeScreen = true,
      this.isFavorite = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return AttractionScreen(attraction: attraction);
          }),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Image.asset(
              attraction.imagePath,
              height: 250,
              width: 400,
              fit: BoxFit.fill,
            ),
            ListTile(
              title: Text(attraction.name),
              subtitle: Text(attraction.city),
              trailing: isOnHomeScreen
                  ? IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: isFavorite
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_border),
                      onPressed: isFavorite
                          ? () => provider!.removeFavorite(attraction)
                          : () => provider!.addFavorite(attraction),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
