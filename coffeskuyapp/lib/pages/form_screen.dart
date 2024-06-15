import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

class CommentRatingForm extends StatefulWidget {
  final int cafeId;

  CommentRatingForm({required this.cafeId});

  @override
  _CommentRatingFormState createState() => _CommentRatingFormState();
}

class _CommentRatingFormState extends State<CommentRatingForm> {
  double _currentSliderValue = 3.0; // Initial value for rating

  TextEditingController _commentController = TextEditingController();

  void _submitForm() async {
  String comment = _commentController.text.trim();

  // Retrieve user's email from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userEmail = prefs.getString('email');

  // Ensure userEmail is not null (handle this based on your app's authentication flow)
  if (userEmail == null) {
    print('User email is null');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User email is null. Login required?')),
    );
    return; // You may want to handle this case according to your app's requirements
  }

  // Construct the API URL
  final String url = 'http://10.60.235.48:8000/api/ratings';

  // Construct the request payload
  Map<String, dynamic> payload = {
    'rating': _currentSliderValue,
    'comment': comment,
    'cafe_id': widget.cafeId,
    'email': userEmail, // Include user's email in the payload
  };

  // Send the POST request
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        // Add authorization token if needed
        // 'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
      },
      body: jsonEncode(payload),
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['success']) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'])),
        );
        // Reset form after submission
        _commentController.clear();
        setState(() {
          _currentSliderValue = 3.0; // Reset slider value
        });
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'])),
        );
      }
    } else {
      // Show error message based on status code
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit review. Status code: ${response.statusCode}')),
      );
    }
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred. $e')), // Display error details
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Comment',
                border: OutlineInputBorder(),
              ),
              maxLines: 3, // Adjust as needed
            ),
            SizedBox(height: 16.0),
            Text('Rating: $_currentSliderValue'),
            Slider(
              value: _currentSliderValue,
              min: 1.0,
              max: 5.0,
              divisions: 4,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
