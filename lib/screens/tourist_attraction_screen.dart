import 'dart:io';

import 'package:flutter/material.dart';

class TouristAttractionScreen extends StatelessWidget {
  const TouristAttractionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nome da atração'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('assets/images/serra_rio_rastro.jpg'),
          Container(
            padding: const EdgeInsets.all(10),
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Nome do local',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Text(
                  'Endereço: lorem ipsum dolor sit amet',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  'Telefone: lorem ipsum dolor sit amet',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  'Horário de funcionamento: lorem ipsum dolor sit amet',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  'Website: lorem ipsum dolor sit amet',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  'Preço do ingresso: lorem ipsum dolor sit amet',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    primary: Colors.redAccent[200],
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Mapa',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    primary: Colors.redAccent[200],
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Vídeo',
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
