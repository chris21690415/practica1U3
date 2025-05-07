import 'package:flutter/material.dart';
import '../models/tarea.dart';

class ListaTareaWidget extends StatelessWidget {
  final List<Tarea> tareas;
  final Function(int) onEliminar;

  const ListaTareaWidget({
    super.key,
    required this.tareas,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    if (tareas.isEmpty) {
      return const Center(child: Text('No hay tareas aún.'));
    }

    return ListView.builder(
      itemCount: tareas.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            title: Text(tareas[index].titulo),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.redAccent),
              onPressed: () => onEliminar(index),
            ),
          ),
        );
      },
    );
  }
}
