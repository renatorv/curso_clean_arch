// ENTIDADE: representa a regra de negócio, ela deve tenha somente objetos puros
// em Dart, sem dependências externas, sem transformações de tipo: toMap, fromMap 
// e etc. Deve isolar a regra de negócio.

class Habit {
  final String id;
  final String title;
  final DateTime createdAt;

  const Habit({required this.id, required this.title, required this.createdAt});
}
