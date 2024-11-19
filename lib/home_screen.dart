import 'package:flutter/material.dart';
import 'itinerary_service.dart';
import 'add_itinerary_screen.dart';

class HomeScreen extends StatelessWidget {
  final ItineraryService _itineraryService = ItineraryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Travel Itinerary")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _itineraryService.getItineraries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No itineraries found."));
          }

          var itineraries = snapshot.data!;
          return ListView.builder(
            itemCount: itineraries.length,
            itemBuilder: (context, index) {
              var itinerary = itineraries[index];
              return ListTile(
                title: Text(itinerary['destination']),
                subtitle: Text(itinerary['activity']),
                trailing: Text(itinerary['date']),
                onTap: () {
                  // Navigate to details or edit screen
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddItineraryScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
