import 'package:flutter/material.dart';
import 'package:turismo_sc_app/models/attraction_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AttractionScreen extends StatelessWidget {
  const AttractionScreen({required this.attraction, Key? key})
      : super(key: key);

  final AttractionModel attraction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(attraction.name),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            child: Image.asset(
              attraction.imagePath,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  attraction.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Text(
                  'Endereço: ${attraction.address}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                InkWell(
                  child: Text(
                    'Telefone (clique para ligar): ${attraction.phoneNumber}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  onTap: () => attraction.phoneNumber == 'Não há'
                      ? null
                      : _launchCaller(attraction.phoneNumber),
                ),
                Text(
                  'Horário de funcionamento: ${attraction.openingHours}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                InkWell(
                  child: Text(
                    'Website: ${attraction.websiteUrl}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  onTap: () => attraction.websiteUrl == 'Não há'
                      ? null
                      : _launchUrl(attraction.websiteUrl),
                ),
                Text(
                  'Preço do ingresso: ${attraction.ticketPrice}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.play_arrow),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 140),
                    primary: Colors.white,
                    onPrimary: Colors.red,
                    side: const BorderSide(color: Colors.red),
                  ),
                  onPressed: () {
                    _launchUrl(attraction.videoUrl);
                  },
                  label: const Text(
                    'Vídeo',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.map),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 140),
                    primary: Colors.white,
                    onPrimary: Colors.green,
                    side: const BorderSide(color: Colors.green),
                  ),
                  onPressed: () => _launchUrl(attraction.mapsUrl),
                  label: const Text(
                    'Mapa',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

_launchCaller(String phoneNumber) async {
  String _phoneUrl = "tel:$phoneNumber";
  if (!await launch(_phoneUrl)) throw 'Could not launch $_phoneUrl';
}

_launchUrl(String url) async {
  String _url = "http:$url";
  if (!await launch(_url)) throw 'Could not launch $_url';
}
