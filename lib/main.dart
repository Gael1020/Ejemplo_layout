import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String placeHolder = 'images/charge.gif';
    List<String> images = ['https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg', 
    'https://cdn.pixabay.com/photo/2013/05/30/18/21/cat-114782_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/07/24/19/57/tiger-2535888_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/11/09/21/41/cat-2934720_960_720.jpg',
    'https://cdn.pixabay.com/photo/2016/06/14/00/14/cat-1455468_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/11/08/11/56/kitten-4611189_960_720.jpg',
    'https://cdn.pixabay.com/photo/2016/09/05/21/37/cat-1647775_960_720.jpg'
    ];

    return MaterialApp(
      title: 'App Dummy',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Soccer app'),
        ),
        body: Center(
          child: GridView.count(crossAxisCount: 2,
          children: [
            ...images
            .map(
              (Image) => BigCard(placeHolder: placeHolder, image: Image),    
            ).toList()
          ],
          )
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.placeHolder,
    required this.image,
  });

  final String placeHolder;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: ()
    {
      SnackBar snackBar = SnackBar(content: Text(image));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
    child: Card
    (
    child: FadeInImage.assetNetwork(
      placeholder: placeHolder, 
      image: image,
      fit: BoxFit.cover,
      ),
      elevation: 10, //Como setear un shape y un shadow color en lugar del elevation o con el elevation 
            ),
            );
  }
}