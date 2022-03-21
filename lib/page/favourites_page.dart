import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
    body: Container(
      padding: const EdgeInsets.all(32),
      child: OrientationBuilder(
        builder: (context, orientation) =>
        orientation == Orientation.portrait
            ? buildPortrait()
            : buildLandscape(),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.rotate_left),
      backgroundColor: Colors.pink,
      onPressed: () {
        final isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;

        if (isPortrait) {
          setLandscape();
        } else {
          setPortrait();
        }
      },
    ),
  );

  Future setPortrait() async => await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Future setLandscape() async => await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  Future setPortraitAndLandscape() =>
      SystemChrome.setPreferredOrientations(DeviceOrientation.values);

  Widget buildPortrait() => ListView(
    children: [
      buildImage(),
      const SizedBox(height: 16),
      buildImage(),
    ],
  );

  Widget buildLandscape() => Row(
    children: [
      buildImage(),
      const SizedBox(width: 16),
      Expanded(child: SingleChildScrollView(child: buildImage())),
    ],
  );

  Widget buildImage() => Image.network(
      'https://images.pexels.com/photos/789305/pexels-photo-789305.jpeg?cs=srgb&dl=pexels-anastasiya-lobanovskaya-789305.jpg&fm=jpg');

  Widget buildText() => Column(
    children: const [
      // Text(
      //   'Maya Kheiri',
      //   style: TextStyle(
      //     fontWeight: FontWeight.bold,
      //     fontSize: 32,
      //     color: Color(0xFF3949AB),
      //   ),
      // ),
      SizedBox(height: 16),
      // Text(
      //   '''The oldest known depiction of hair styling is hair braiding which dates back about 30,000 years. In history, women's hair was often elaborately and carefully dressed in special ways. From the time of the Roman Empire[citation needed] until the Middle Ages, most women grew their hair as long as it would naturally grow. Between the late 15th century and the 16th century, a very high hairline on the forehead was considered attractive. Around the same time period, European men often wore their hair cropped no longer than shoulder-length. In the early 17th century, male hairstyles grew longer, with waves or curls being considered desirable.''',
      //   style: TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.bold,
      //       color: Color(0xFF5C6BC0)),
      // ),
    ],
  );
}
