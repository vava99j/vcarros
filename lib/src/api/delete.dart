import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> excluirDados(id) async {
  final url = Uri.parse('http://localhost:8000/api/excluir.php');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
     "id": id
     }),
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      final data = jsonDecode(response.body);
      print('Sucesso: $data');
    } else {
      print('Erro: status ${response.statusCode}');
      print(response.body);
    }
  } catch (e) {
    print('Falha ao fazer PATCH: $e');
  }
}

void main(List<String> args) {
  excluirDados(
    "4"
  );
}
