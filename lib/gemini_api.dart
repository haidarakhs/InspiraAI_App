import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiAPI {
  static Future<String> fetchInspiration() async {
    try {
      // Panggil zenquotes lewat proxy allorigins.win
      final response = await http.get(
        Uri.parse('https://api.allorigins.win/get?url=https://zenquotes.io/api/random'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final originalData = json.decode(jsonData['contents']);
        return "${originalData[0]['q']} - ${originalData[0]['a']}";
      } else {
        throw Exception('Gagal mengambil inspirasi');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}
