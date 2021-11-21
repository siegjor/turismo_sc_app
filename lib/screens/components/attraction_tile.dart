import 'package:flutter/material.dart';
import 'package:turismo_sc_app/controllers/home_provider.dart';
import 'package:turismo_sc_app/models/attraction_model.dart';

import '../attraction_screen.dart';

class AttractionTile extends StatelessWidget {
  final AttractionModel attraction;
  final HomeProvider? provider;
  final bool hasFavoriteIcon;

  const AttractionTile(
      {required this.attraction,
      this.provider,
      this.hasFavoriteIcon = true,
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
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Image.asset(attraction.imagePath),
            ListTile(
              title: Text(attraction.name),
              subtitle: Text(attraction.city),
              trailing: hasFavoriteIcon
                  ? IconButton(
                      icon: attraction.isFavorite
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_border),
                      onPressed: attraction.isFavorite
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
