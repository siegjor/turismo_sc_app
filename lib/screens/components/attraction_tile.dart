import 'package:flutter/material.dart';
import 'package:turismo_sc_app/controllers/home_provider.dart';
import 'package:turismo_sc_app/models/tourist_attraction.dart';

import '../tourist_attraction_screen.dart';

class AttractionTile extends StatelessWidget {
  final TouristAttraction attraction;
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
            return const TouristAttractionScreen();
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
              subtitle: Text(attraction.address),
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
