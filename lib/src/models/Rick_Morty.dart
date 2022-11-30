// ignore: duplicate_ignore
// ignore: file_names
// ignore: camel_case_types
// ignore_for_file: file_names

// ignore: camel_case_types
class Rick_Morty {
  Info? info;
  List<Results>? results;

  Rick_Morty({this.info, this.results});

  Rick_Morty.fromJson(Map<String, dynamic> json) {
    // ignore: unnecessary_new
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        // ignore: unnecessary_new
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_new, prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    if (this.info != null) {
      // ignore: unnecessary_this
      data['info'] = this.info!.toJson();
    }
    // ignore: unnecessary_this
    if (this.results != null) {
      // ignore: unnecessary_this
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int? count;
  int? pages;
  String? next;
  String? prev;

  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['count'] = this.count;
    // ignore: unnecessary_this
    data['pages'] = this.pages;
    // ignore: unnecessary_this
    data['next'] = this.next;
    // ignore: unnecessary_this
    data['prev'] = this.prev;
    return data;
  }
}

class Results {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Results(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin =
        // ignore: unnecessary_new
        json['origin'] != null ? new Origin.fromJson(json['origin']) : null;
    location =
        // ignore: unnecessary_new
        json['location'] != null ? new Origin.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_new, prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['id'] = this.id;
    // ignore: unnecessary_this
    data['name'] = this.name;
    // ignore: unnecessary_this
    data['status'] = this.status;
    // ignore: unnecessary_this
    data['species'] = this.species;
    // ignore: unnecessary_this
    data['type'] = this.type;
    // ignore: unnecessary_this
    data['gender'] = this.gender;
    // ignore: unnecessary_this
    if (this.origin != null) {
      // ignore: unnecessary_this
      data['origin'] = this.origin!.toJson();
    }
    // ignore: unnecessary_this
    if (this.location != null) {
      // ignore: unnecessary_this
      data['location'] = this.location!.toJson();
    }
    // ignore: unnecessary_this
    data['image'] = this.image;
    // ignore: unnecessary_this
    data['episode'] = this.episode;
    // ignore: unnecessary_this
    data['url'] = this.url;
    // ignore: unnecessary_this
    data['created'] = this.created;
    return data;
  }
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['name'] = this.name;
    // ignore: unnecessary_this
    data['url'] = this.url;
    return data;
  }
}
