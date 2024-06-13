import 'package:flutter/material.dart';

class CommentRatingForm extends StatefulWidget {
  @override
  _CommentRatingFormState createState() => _CommentRatingFormState();
}

class _CommentRatingFormState extends State<CommentRatingForm> {
  double _currentSliderValue = 3.0; // Initial value for rating

  TextEditingController _commentController = TextEditingController();

  void _submitForm() {
    String comment = _commentController.text.trim();
    // You can handle form submission here (e.g., send to API, save locally, etc.)
    print('Comment: $comment, Rating: $_currentSliderValue');
    // Reset form after submission if needed
    _commentController.clear();
    setState(() {
      _currentSliderValue = 3.0; // Reset slider value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}