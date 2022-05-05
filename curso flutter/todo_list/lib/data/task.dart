class Task {
  Task({required this.title, this.description = '', this.isDone = false});

  String title;
  String description;
  bool isDone;

  Task.fromJson(Map json)
      : title = json['title'],
        description = json['description'],
        isDone = json['isDone'];

  Map toJson() => {
        'title': title,
        'description': description,
        'isDone': isDone,
      };
}
