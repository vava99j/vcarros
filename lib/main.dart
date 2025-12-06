import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vcarros/src/api/patch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcarros/src/api/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'vcarros',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 1, 2, 68),
        ),
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userId = '1';
  String marca = "";
  String modelo = "";
  String descricao = "";
  String contato = "";
  String preco = "";
  String id = '';
  String foto = '';
  int _counter = 0;
  int _tamanho = 0;

  void _marca(i) {
    setState(() {
      marca = i;
    });
  }

  void _contato(c) {
    setState(() {
      contato = c;
    });
  }

  void _preco(p) {
    setState(() {
      preco = p;
    });
  }

  void _modelo(i) {
    setState(() {
      modelo = i;
    });
  }

  void _id(i) {
    setState(() {
      id = i;
    });
  }

  void _des(t) {
    setState(() {
      descricao = t;
    });
  }

  void _foto(i) {
    setState(() {
      foto = i;
    });
  }

  void _tam(t) {
    setState(() {
      _tamanho = t - 1;
    });
  }

  void _incrementCounter() {
    setState(() {
      if (_counter == _tamanho) {
        _counter = 0;
      } else {
        _counter++;
      }
    });
  }

  void _desincrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      } else {
        _counter = _tamanho;
      }
    });
  }

  Future<void> buscarDados() async {
    final url = Uri.parse('http://localhost:8000/api/listar.php');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        final item = data[_counter];
        print('Count: $_counter');
        print('Tam: $_tamanho');
        print("id: $id");

        _marca(item['marca'].toString());
        _preco(item['preco']);
        _contato(item['contato']);
        _id(item['id'].toString());
        _modelo(item['modelo']);
        _des(item['descricao']);
        _foto(item['ft1']);
        _tam(data.length);
        print("id: $id");
      } else {
        print('Erro: status ${response.statusCode}');
      }
    } catch (e) {
      print('Falha ao fazer GET: $e');
    }
    ;
  }

  Future<void> modalEeN(String t, {String? i}) async {
    final TextEditingController marcaController = TextEditingController();
    final TextEditingController modeloController = TextEditingController();
    final TextEditingController descricaoController = TextEditingController();
    final TextEditingController precoController = TextEditingController();
    final TextEditingController contatoController = TextEditingController();
    final TextEditingController ft1controller = TextEditingController();
    final TextEditingController ft2controller = TextEditingController();
    final TextEditingController ft3controller = TextEditingController();
    final TextEditingController ft4controller = TextEditingController();
    final TextEditingController ft5controller = TextEditingController();
    if (i != null) {
      marcaController.text = marca;
      modeloController.text = modelo;
      descricaoController.text = descricao;
      precoController.text = preco;
      contatoController.text = contato;
    }
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     Text(
                      t, // Ou mudar dinamicamente para 'Criar' se i == null
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Conteúdo do modal"),
                    TextField(
                      controller: marcaController,
                      decoration: const InputDecoration(labelText: "Marca"),
                    ),
                    TextField(
                      controller: modeloController,
                      decoration: const InputDecoration(labelText: "Modelo"),
                    ),
                    TextField(
                      controller: descricaoController,
                      decoration: const InputDecoration(labelText: "Descrição"),
                    ),
                    TextField(
                      controller: precoController,
                      decoration: const InputDecoration(labelText: "Preço"),
                    ),
                    TextField(
                      controller: contatoController,
                      decoration: const InputDecoration(labelText: "Contato"),
                    ),
                    const SizedBox(
                      height: 20,
                    ), // Mudei para HEIGHT pois é uma Column
                    // --- AQUI ESTÁ A CORREÇÃO (Collection If) ---
                    if (i != null)
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          atualizarDados(
                            id,
                            marcaController.text,
                            modeloController.text,
                            descricaoController.text,
                            precoController.text,
                            contatoController.text,
                            "foto",
                            f2: "",
                            f3: "",
                            f4: "",
                            f5: "",
                          );
                          Navigator.pop(context); // Fecha o modal após ação
                        },
                      )
                    else
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          criarDados(
                            "1",
                            "bundinha",
                            "hora",
                            "fsdfsgfsdgfdg",
                            "",
                            "",
                            "",
                            "e",
                            "f",
                            "g",
                          );
                          Navigator.pop(context); // Fecha o modal após ação
                        },
                      ),
                    // -------------------------------------------
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> modalD(i) async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'realmente excluir?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 20),
                    IconButton(
                      icon: Icon(Icons.delete_forever),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    buscarDados();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _desincrementCounter();
                    buscarDados();
                  },
                  child: const Icon(Icons.arrow_left),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    id,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    marca,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    modelo,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    descricao,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  if (foto != '') Image.network(foto, width: 200, height: 200),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    _incrementCounter();
                    await buscarDados();
                  },
                  child: const Icon(Icons.arrow_right),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "Novo",
            onPressed: () {
              modalEeN("Novo");
            },
            child: const Icon(Icons.add),
          ),

          const SizedBox(width: 20),

          FloatingActionButton(
            heroTag: "Edit",
            onPressed: () {
              modalEeN("Editar", i: id);
            },
            child: const Icon(Icons.edit),
          ),

          const SizedBox(width: 20),

          FloatingActionButton(
            heroTag: "Excluir",
            onPressed: () {
              modalD(id);
            },
            child: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}
