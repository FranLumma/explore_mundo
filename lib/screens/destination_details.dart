// ignore_for_file: prefer_const_constructors
import 'package:explore_mundo/models/destinations.dart';
import 'package:flutter/material.dart';

class DestinationDetails extends StatelessWidget {
  final Destination destination;

  const DestinationDetails({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(destination.name),
        ),
        body: ListView(
          children: [
            ImageSection(
              imagePath: destination.imagePath,
            ),
            TitleSection(
                name: destination.name,
                location: destination.location,
                rate: destination.rate),
            ButtonSection(),
            TextSection(
              description: destination.description,
            )
          ],
        ));
  }
}

class TitleSection extends StatelessWidget {
  final String name;
  final String location;
  final int rate;

  TitleSection(
      {super.key,
      required this.name,
      required this.location,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text("${rate}"),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  final String description;
  TextSection({super.key, required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  final String imagePath;

  ImageSection({super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}

class ButtonSection extends StatelessWidget {
  ButtonSection({super.key});
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, "CALL"),
        _buildButtonColumn(color, Icons.near_me, "ROUTE"),
        _buildButtonColumn(color, Icons.share, "SHARE")
      ],
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: color),
        ),
      )
    ],
  );
}
