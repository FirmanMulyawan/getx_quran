class Surah {
  final int? number;
  final int? sequence;
  final int? numberOfVerses;
  final Name? name;
  final Revelation? revelation;
  final Tafsir? tafsir;

  Surah({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
  });

  Surah copyWith({
    int? number,
    int? sequence,
    int? numberOfVerses,
    Name? name,
    Revelation? revelation,
    Tafsir? tafsir,
  }) =>
      Surah(
        number: number ?? this.number,
        sequence: sequence ?? this.sequence,
        numberOfVerses: numberOfVerses ?? this.numberOfVerses,
        name: name ?? this.name,
        revelation: revelation ?? this.revelation,
        tafsir: tafsir ?? this.tafsir,
      );

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        revelation: json["revelation"] == null
            ? null
            : Revelation.fromJson(json["revelation"]),
        tafsir: json["tafsir"] == null ? null : Tafsir.fromJson(json["tafsir"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name?.toJson(),
        "revelation": revelation?.toJson(),
        "tafsir": tafsir?.toJson(),
      };
}

class Name {
  final String? short;
  final String? long;
  final Translation? transliteration;
  final Translation? translation;

  Name({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  Name copyWith({
    String? short,
    String? long,
    Translation? transliteration,
    Translation? translation,
  }) =>
      Name(
        short: short ?? this.short,
        long: long ?? this.long,
        transliteration: transliteration ?? this.transliteration,
        translation: translation ?? this.translation,
      );

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        short: json["short"],
        long: json["long"],
        transliteration: json["transliteration"] == null
            ? null
            : Translation.fromJson(json["transliteration"]),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration?.toJson(),
        "translation": translation?.toJson(),
      };
}

class Translation {
  final String? en;
  final String? id;

  Translation({
    this.en,
    this.id,
  });

  Translation copyWith({
    String? en,
    String? id,
  }) =>
      Translation(
        en: en ?? this.en,
        id: id ?? this.id,
      );

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
      };
}

class Revelation {
  final String? arab;
  final String? en;
  final String? id;

  Revelation({
    this.arab,
    this.en,
    this.id,
  });

  Revelation copyWith({
    String? arab,
    String? en,
    String? id,
  }) =>
      Revelation(
        arab: arab ?? this.arab,
        en: en ?? this.en,
        id: id ?? this.id,
      );

  factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
        arab: json["arab"],
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "en": en,
        "id": id,
      };
}

class Tafsir {
  final String? id;

  Tafsir({
    this.id,
  });

  Tafsir copyWith({
    String? id,
  }) =>
      Tafsir(
        id: id ?? this.id,
      );

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
