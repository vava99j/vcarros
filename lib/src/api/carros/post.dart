import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> criarCarros(ma, mo, d, p, con,com, f1, f2, f3, f4, f5) async {
  final url = Uri.parse(
    'https://vcar-servidor.onrender.com/api/cars/cadastrar.php',
  );

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "marca": ma,
        "modelo": mo,
        "descricao": d,
        "preco": p,
        "contato": con,
        "comprou": com,
        "ft1": f1,
        "ft2": f2,
        "ft3": f3,
        "ft4": f4,
        "ft5": f5,
      }),
    );

    if (response.statusCode == 201) {
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
  criarCarros(
    "1",
    "bundinha",
    "hora",
    "fsdfsgfsdgfdg",
    "com",
    "",
    "",
    "",
    "e",
    "f",
    "g",
  );
}
