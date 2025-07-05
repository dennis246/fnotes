enum ModelIntent { insert, update, delete, post, backup, initiation, undefined }

class AppDataModel {
  final String key;
  final Object? value;
  final ModelIntent intent;

  const AppDataModel({required this.key, required this.value, required this.intent});
}
