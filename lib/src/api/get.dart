import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> buscarCarros() async {
  final url = Uri.parse('http://localhost:8000/api/listar.php'); // coloque sua URL

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List carros = jsonDecode(response.body);
      print('Carros: $carros');
      
      for (var carro in carros) {
        print("Modelo: ${carro['modelo']}, Marca: ${carro['marca']}, Preço: ${carro['preco']}");
      }
    } else {
      print('Erro: status ${response.statusCode}');
    }
  } catch (e) {
    print('Falha ao buscar carros: $e');
  }
}

void main() {
  buscarCarros();
}
