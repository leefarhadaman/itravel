import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItineraryService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add new itinerary
  Future<void> addItinerary(String destination, String activity, DateTime date) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await _db.collection('itineraries').add({
          'user_id': user.uid,
          'destination': destination,
          'activity': activity,
          'date': date.toIso8601String(),
        });
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // Fetch user's itineraries
  Future<List<Map<String, dynamic>>> getItineraries() async {
    List<Map<String, dynamic>> itineraries = [];
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        QuerySnapshot querySnapshot = await _db
            .collection('itineraries')
            .where('user_id', isEqualTo: user.uid)
            .get();

        for (var doc in querySnapshot.docs) {
          itineraries.add(doc.data() as Map<String, dynamic>);
        }
      }
    } catch (e) {
      print("Error: $e");
    }
    return itineraries;
  }
}
