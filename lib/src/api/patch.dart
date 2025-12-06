import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> atualizarDados(
  i,
  ma,
  mo,
  d,
  p,
  c,
  f1, {
  String? f2,
  String? f3,
  String? f4,
  String? f5,
}) async {
  final url = Uri.parse('http://localhost:8000/api/atualizar.php');

  try {
    final response = await http.patch(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "id":i,
        "marca": ma,
        "modelo": mo,
        "descrição": d,
        "preco": p,
        "contato": c,
        "ft1": f1,
        "ft2": f3,
        "ft3": f3,
        "ft4": f4,
        "ft5": f5,
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
  atualizarDados(
    "2",
    "1",
    "bundinha",
    "hora",
    "fsdfsgfsdgfdg",
    "",
    "",
    f2: "",
    f3: "e",
    f4: "f",
    f5: "g",
  );
}
