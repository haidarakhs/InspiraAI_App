import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiAPI {
  static Future<String> fetchInspiration() async {
    final url = Uri.parse('https://zenquotes.io/api/random');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Decode JSON data
        final data = json.decode(response.body);
        
        // Akses kutipan dan penulis
        final quote = data[0]['q']; // Kutipan
        final author = data[0]['a']; // Penulis

        return '$quote - $author';
      } else {
        throw Exception('Gagal mengambil inspirasi');
      }
    } catch (error) {
      throw Exception('Terjadi kesalahan: $error');
    }
  }
}
