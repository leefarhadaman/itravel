import 'package:flutter/material.dart';
import 'itinerary_service.dart';

class AddItineraryScreen extends StatefulWidget {
  @override
  _AddItineraryScreenState createState() => _AddItineraryScreenState();
}

class _AddItineraryScreenState extends State<AddItineraryScreen> {
  final _destinationController = TextEditingController();
  final _activityController = TextEditingController();
  DateTime? _selectedDate;

  final ItineraryService _itineraryService = ItineraryService();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  _addItinerary() {
    if (_destinationController.text.isEmpty || _activityController.text.isEmpty || _selectedDate == null) {
      return;
    }

    _itineraryService.addItinerary(
      _destinationController.text,
      _activityController.text,
      _selectedDate!,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Itinerary")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(labelText: 'Destination'),
            ),
            TextField(
              controller: _activityController,
              decoration: InputDecoration(labelText: 'Activity'),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(_selectedDate == null ? 'Select Date' : _selectedDate!.toString()),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addItinerary,
              child: Text("Save Itinerary"),
            ),
          ],
        ),
      ),
    );
  }
}
