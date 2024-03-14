class Period {
  int? id;
  String title;
  String category;
  String dataInit;
  String dateFinal;
  String meta1;
  String meta2;

  Period({
    this.id,
    required this.title,
    required this.category,
    required this.dataInit,
    required this.dateFinal,
    required this.meta1,
    required this.meta2,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'dateInit': dataInit,
      'dateFinal': dateFinal,
      'meta1': meta1,
      'meta2': meta2,
    };
  }

  static Period fromMap(Map<String, dynamic> map) {
    return Period(
      id: map['id'],
      title: map['title'],
      category: map['category'],
      dataInit: map['dateInit'],
      dateFinal: map['dateFinal'],
      meta1: map['meta1'],
      meta2: map['meta2'],
    );
  }
}
