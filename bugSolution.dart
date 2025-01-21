```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // ...
    } else {
      // Handle non-200 status codes explicitly
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors specifically
    print('JSON decoding error: $e');
    rethrow; 
  } catch (e) {
    // Handle other exceptions
    print('An error occurred: $e');
    rethrow; // Re-throw the exception to be handled by a higher level function
  }
}
```