// ignore_for_file: public_member_api_docs, sort_constructors_first

class Source {
  const Source({required this.id, required this.name});

  final String? id;
  final String? name;

//   factory Source.fromJson(Map<String, dynamic> json) {
//     //factory-fabrica-kerektuu bolgon nerseni ireeti mn tizip beret,
//     ( 1,3,6,9,bolso ushunu ireettep beret)
//     //json- achkychy String turdon
//     //maanisi -dynamic
//     //fromJson-methodu
//     //Json- key,value dan turat
//      map-a4ky4y bar ,
// fromJson - bul aty kaalagan at bersek bt,method
//     return Source(
//       id: json['id'],
//       name: json['articles']['0']['']['name'],
//     );
//   }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] != null ? json['id'] as String : null,
      name: json['name'] != null ? json['name'] as String : null,
    );
  }
}
