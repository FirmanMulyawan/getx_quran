class Ayat {
  final Number? number;
  final Meta? meta;
  final Text? text;
  final Translation? translation;
  final Audio? audio;
  final AyatTafsir? tafsir;
  final Surah? surah;

  Ayat({
    this.number,
    this.meta,
    this.text,
    this.translation,
    this.audio,
    this.tafsir,
    this.surah,
  });

  Ayat copyWith({
    Number? number,
    Meta? meta,
    Text? text,
    Translation? translation,
    Audio? audio,
    AyatTafsir? tafsir,
    Surah? surah,
  }) =>
      Ayat(
        number: number ?? this.number,
        meta: meta ?? this.meta,
        text: text ?? this.text,
        translation: translation ?? this.translation,
        audio: audio ?? this.audio,
        tafsir: tafsir ?? this.tafsir,
        surah: surah ?? this.surah,
      );

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        number: json["number"] == null ? null : Number.fromJson(json["number"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        text: json["text"] == null ? null : Text.fromJson(json["text"]),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
        audio: json["audio"] == null ? null : Audio.fromJson(json["audio"]),
        tafsir:
            json["tafsir"] == null ? null : AyatTafsir.fromJson(json["tafsir"]),
        surah: json["surah"] == null ? null : Surah.fromJson(json["surah"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number?.toJson(),
        "meta": meta?.toJson(),
        "text": text?.toJson(),
        "translation": translation?.toJson(),
        "audio": audio?.toJson(),
        "tafsir": tafsir?.toJson(),
        "surah": surah?.toJson(),
      };
}

class Audio {
  final String? primary;
  final List<String>? secondary;

  Audio({
    this.primary,
    this.secondary,
  });

  Audio copyWith({
    String? primary,
    List<String>? secondary,
  }) =>
      Audio(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
      );

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        primary: json["primary"],
        secondary: json["secondary"] == null
            ? []
            : List<String>.from(json["secondary"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary == null
            ? []
            : List<dynamic>.from(secondary!.map((x) => x)),
      };
}

class Meta {
  final int? juz;
  final int? page;
  final int? manzil;
  final int? ruku;
  final int? hizbQuarter;
  final Sajda? sajda;

  Meta({
    this.juz,
    this.page,
    this.manzil,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  Meta copyWith({
    int? juz,
    int? page,
    int? manzil,
    int? ruku,
    int? hizbQuarter,
    Sajda? sajda,
  }) =>
      Meta(
        juz: juz ?? this.juz,
        page: page ?? this.page,
        manzil: manzil ?? this.manzil,
        ruku: ruku ?? this.ruku,
        hizbQuarter: hizbQuarter ?? this.hizbQuarter,
        sajda: sajda ?? this.sajda,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        juz: json["juz"],
        page: json["page"],
        manzil: json["manzil"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: json["sajda"] == null ? null : Sajda.fromJson(json["sajda"]),
      );

  Map<String, dynamic> toJson() => {
        "juz": juz,
        "page": page,
        "manzil": manzil,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda?.toJson(),
      };
}

class Sajda {
  final bool? recommended;
  final bool? obligatory;

  Sajda({
    this.recommended,
    this.obligatory,
  });

  Sajda copyWith({
    bool? recommended,
    bool? obligatory,
  }) =>
      Sajda(
        recommended: recommended ?? this.recommended,
        obligatory: obligatory ?? this.obligatory,
      );

  factory Sajda.fromJson(Map<String, dynamic> json) => Sajda(
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );

  Map<String, dynamic> toJson() => {
        "recommended": recommended,
        "obligatory": obligatory,
      };
}

class Number {
  final int? inQuran;
  final int? inSurah;

  Number({
    this.inQuran,
    this.inSurah,
  });

  Number copyWith({
    int? inQuran,
    int? inSurah,
  }) =>
      Number(
        inQuran: inQuran ?? this.inQuran,
        inSurah: inSurah ?? this.inSurah,
      );

  factory Number.fromJson(Map<String, dynamic> json) => Number(
        inQuran: json["inQuran"],
        inSurah: json["inSurah"],
      );

  Map<String, dynamic> toJson() => {
        "inQuran": inQuran,
        "inSurah": inSurah,
      };
}

class Surah {
  final int? number;
  final int? sequence;
  final int? numberOfVerses;
  final Name? name;
  final Revelation? revelation;
  final SurahTafsir? tafsir;
  final dynamic preBismillah;

  Surah({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
    this.preBismillah,
  });

  Surah copyWith({
    int? number,
    int? sequence,
    int? numberOfVerses,
    Name? name,
    Revelation? revelation,
    SurahTafsir? tafsir,
    dynamic preBismillah,
  }) =>
      Surah(
        number: number ?? this.number,
        sequence: sequence ?? this.sequence,
        numberOfVerses: numberOfVerses ?? this.numberOfVerses,
        name: name ?? this.name,
        revelation: revelation ?? this.revelation,
        tafsir: tafsir ?? this.tafsir,
        preBismillah: preBismillah ?? this.preBismillah,
      );

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        revelation: json["revelation"] == null
            ? null
            : Revelation.fromJson(json["revelation"]),
        tafsir: json["tafsir"] == null
            ? null
            : SurahTafsir.fromJson(json["tafsir"]),
        preBismillah: json["preBismillah"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name?.toJson(),
        "revelation": revelation?.toJson(),
        "tafsir": tafsir?.toJson(),
        "preBismillah": preBismillah,
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

class SurahTafsir {
  final String? id;

  SurahTafsir({
    this.id,
  });

  SurahTafsir copyWith({
    String? id,
  }) =>
      SurahTafsir(
        id: id ?? this.id,
      );

  factory SurahTafsir.fromJson(Map<String, dynamic> json) => SurahTafsir(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class AyatTafsir {
  final Id? id;

  AyatTafsir({
    this.id,
  });

  AyatTafsir copyWith({
    Id? id,
  }) =>
      AyatTafsir(
        id: id ?? this.id,
      );

  factory AyatTafsir.fromJson(Map<String, dynamic> json) => AyatTafsir(
        id: json["id"] == null ? null : Id.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id?.toJson(),
      };
}

class Id {
  final String? short;
  final String? long;

  Id({
    this.short,
    this.long,
  });

  Id copyWith({
    String? short,
    String? long,
  }) =>
      Id(
        short: short ?? this.short,
        long: long ?? this.long,
      );

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        short: json["short"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
      };
}

class Text {
  final String? arab;
  final Transliteration? transliteration;

  Text({
    this.arab,
    this.transliteration,
  });

  Text copyWith({
    String? arab,
    Transliteration? transliteration,
  }) =>
      Text(
        arab: arab ?? this.arab,
        transliteration: transliteration ?? this.transliteration,
      );

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        arab: json["arab"],
        transliteration: json["transliteration"] == null
            ? null
            : Transliteration.fromJson(json["transliteration"]),
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "transliteration": transliteration?.toJson(),
      };
}

class Transliteration {
  final String? en;

  Transliteration({
    this.en,
  });

  Transliteration copyWith({
    String? en,
  }) =>
      Transliteration(
        en: en ?? this.en,
      );

  factory Transliteration.fromJson(Map<String, dynamic> json) =>
      Transliteration(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}
