import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> criarFinanceiro(ma, mo, c, v) async {
  final url = Uri.parse('https://vcar-servidor.onrender.com/api/financeiro/cadastrar.php');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "marca": ma,
        "modelo": mo,
        "comprou": c,
        "vendeu": v,
        
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
  criarFinanceiro(
    "gm",
    "onix",
    "75000",
    "100000"
  );
}
