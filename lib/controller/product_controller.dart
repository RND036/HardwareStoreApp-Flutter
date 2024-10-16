import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://tech.4gbxsolutions.com/api/product'));

  if (response.statusCode == 200) {
    try {
      final data = json.decode(response.body);
      print('API Response: $data');  // Print the API response
      return data;
    } catch (e) {
      
      throw Exception('Failed to parse products data: $e');
      
    }
  } else {
     
    throw Exception('Failed to load products. Status code: ${response.statusCode}, Response: ${response.body}');
    
  }
}
