import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiAPI {
  static Future<String> fetchInspiration() async {
    try {
      final response = await http.get(Uri.parse('https://zenquotes.io/api/random'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final quote = data[0]['q'];
        final author = data[0]['a'];
        return '$quote\n- $author';
      } else {
        throw Exception('Gagal mengambil inspirasi');
      }
    } catch (e) {
      print("Error saat fetch: $e");
      return "Gagal mengambil inspirasi. Silakan coba lagi.";
    }
  }
}
