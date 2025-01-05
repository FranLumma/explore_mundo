import 'package:flutter/material.dart';
import 'package:explore_mundo/screens/destination_details.dart';
import 'package:explore_mundo/models/destinations.dart';

class DestinationTab extends StatelessWidget {
  const DestinationTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<Destination> destinations = Destination.getDestinations();

    return Scaffold(
      body: ListView.builder(
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            var destination = destinations[index];
            return Card(
              margin: EdgeInsets.all(16.0),
              child: ListTile(
                leading: Container(
                  width: 70,
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(destination.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              destination.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            destination.location,
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
                    Text("${destination.rate}"),
                  ],
                ),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DestinationDetails(
                                destination: destination,
                              )))
                },
              ),
            );
          }),
    );
  }
}
