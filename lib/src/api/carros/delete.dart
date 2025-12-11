import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> excluirDados(int id) async {
  final url = Uri.parse('https://vcar-servidor.onrender.com/api/cars/excluir.php');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"id": id.toString()}),
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      final data = jsonDecode(response.body);
      print('Sucesso: $data');
    } else {
      print('Erro: status ${response.statusCode}');
      print(response.body);
    }
  } catch (e) {
    print('Falha ao fazer DELETE: $e');
  }
}

void main() {
  excluirDados(4);
}
