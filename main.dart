import 'package:flutter/material.dart';
import 'widgets/entrada.tarea.dart';
import 'widgets/lista_tarea.dart';
import 'models/tarea.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tareas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ListaTareas(),
    );
  }
}

class ListaTareas extends StatefulWidget {
  const ListaTareas({super.key});

  @override
  State<ListaTareas> createState() => _ListaTareasState();
}

class _ListaTareasState extends State<ListaTareas> {
  final List<Tarea> _tareas = [];
  final TextEditingController _controlador = TextEditingController();

  void _agregarTarea() {
    if (_controlador.text.isNotEmpty) {
      setState(() {
        _tareas.add(Tarea(titulo: _controlador.text));
        _controlador.clear();
      });
    }
  }

  void _eliminarTarea(int index) {
    setState(() {
      _tareas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            EntradaTarea(
              controlador: _controlador,
              onAgregar: _agregarTarea,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListaTareaWidget(
                tareas: _tareas,
                onEliminar: _eliminarTarea,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
