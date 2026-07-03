import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/bmi_category.dart';

class BmiService {
  static const _endpoint =
      'https://gist.githubusercontent.com/itscelrill/f31a8e6771104ede2f714b37015e8e7c/raw/b6657db7b2338b145848e676cac791b74e2238bb/bmi_categories.json';

  /// Mengambil daftar kategori BMI dari server
  static Future<List<BmiCategory>> fetchCategories() async {
    final response = await http
        .get(Uri.parse(_endpoint))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data
          .map((item) => BmiCategory.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Gagal memuat data (HTTP ${response.statusCode})');
    }
  }
}
