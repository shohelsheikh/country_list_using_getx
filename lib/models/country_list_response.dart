class CountryListResponse {
  Name? name;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Currencies? currencies;
  String? capital;
  String? region;
  String? subregion;
  bool? landlocked;
  double? area;
  String? flag;
  Maps? maps;
  int? population;
  String? continents;
  Flags? flags;
  String? startOfWeek;

  CountryListResponse(
      {this.name,
        this.cca2,
        this.ccn3,
        this.cca3,
        this.cioc,
        this.independent,
        this.status,
        this.unMember,
        this.currencies,
        this.capital,
        this.region,
        this.subregion,
        this.landlocked,
        this.area,
        this.flag,
        this.maps,
        this.population,
  this. continents,
        this.flags,
        this.startOfWeek});

  CountryListResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    cca2 = json['cca2'];
    ccn3 = json['ccn3'];
    cca3 = json['cca3'];
    cioc = json['cioc'];
    independent = json['independent'];
    status = json['status'];
    unMember = json['unMember'];
    currencies = json['currencies'] != null
        ? new Currencies.fromJson(json['currencies'])
        : null;


    // capital =  List<String>.from(
    //     json["capital"]?.map((cap) => cap) ?? ['No Capital'])
    //     .toString()
    //     .replaceAll(']', '')
    //     .replaceAll('[', '');


    capital = json["capital"].runtimeType==String? json["capital"]:List<String>.from(
        json["capital"]?.map((cap) => cap) ?? ['No Capital'])
        .toString();


    region = json['region'];
    subregion = json['subregion'];


    landlocked = json['landlocked'];
    area = json['area'];

    flag = json['flag'];
    maps = json['maps'] != null ? new Maps.fromJson(json['maps']) : null;
    population = json['population'];
    continents= json["continents"].runtimeType==String?json["continents"]:json["continents"][0];
    flags = json['flags'] != null ? new Flags.fromJson(json['flags']) : null;

    startOfWeek = json['startOfWeek'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['cca2'] = this.cca2;
    data['ccn3'] = this.ccn3;
    data['cca3'] = this.cca3;
    data['cioc'] = this.cioc;
    data['independent'] = this.independent;
    data['status'] = this.status;
    data['unMember'] = this.unMember;
    if (this.currencies != null) {
      data['currencies'] = this.currencies!.toJson();
    }

    data['capital'] = this.capital;
    data['region'] = this.region;
    data['subregion'] = this.subregion;

    data['landlocked'] = this.landlocked;
    data['area'] = this.area;

    data['flag'] = this.flag;
    if (this.maps != null) {
      data['maps'] = this.maps!.toJson();
    }
    data['population'] = this.population;
    data['continents'] = this.continents;

    if (this.flags != null) {
      data['flags'] = this.flags!.toJson();
    }

    data['startOfWeek'] = this.startOfWeek;

    return data;
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null
        ? new NativeName.fromJson(json['nativeName'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['common'] = this.common;
    data['official'] = this.official;
    if (this.nativeName != null) {
      data['nativeName'] = this.nativeName!.toJson();
    }
    return data;
  }
}

class NativeName {
  Bul? bul;

  NativeName({this.bul});

  NativeName.fromJson(Map<String, dynamic> json) {
    bul = json['bul'] != null ? new Bul.fromJson(json['bul']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bul != null) {
      data['bul'] = this.bul!.toJson();
    }
    return data;
  }
}

class Bul {
  String? official;
  String? common;

  Bul({this.official, this.common});

  Bul.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['official'] = this.official;
    data['common'] = this.common;
    return data;
  }
}

class Currencies {
  BGN? bGN;

  Currencies({this.bGN});

  Currencies.fromJson(Map<String, dynamic> json) {
    bGN = json['BGN'] != null ? new BGN.fromJson(json['BGN']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bGN != null) {
      data['BGN'] = this.bGN!.toJson();
    }
    return data;
  }
}

class BGN {
  String? name;
  String? symbol;

  BGN({this.name, this.symbol});

  BGN.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    return data;
  }
}

class Idd {
  String? root;
  List<String>? suffixes;

  Idd({this.root, this.suffixes});

  Idd.fromJson(Map<String, dynamic> json) {
    root = json['root'];
    suffixes = json['suffixes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['root'] = this.root;
    data['suffixes'] = this.suffixes;
    return data;
  }
}

class Languages {
  String? bul;

  Languages({this.bul});

  Languages.fromJson(Map<String, dynamic> json) {
    bul = json['bul'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bul'] = this.bul;
    return data;
  }
}

class Translations {
  Bul? ara;
  Bul? bre;
  Bul? ces;
  Bul? cym;
  Bul? deu;
  Bul? est;
  Bul? fin;
  Eng? fra;
  Bul? hrv;
  Bul? hun;
  Bul? ita;
  Bul? jpn;
  Bul? kor;
  Bul? nld;
  Bul? per;
  Bul? pol;
  Bul? por;
  Bul? rus;
  Bul? slk;
  Bul? spa;
  Bul? swe;
  Bul? tur;
  Bul? urd;
  Bul? zho;

  Translations(
      {this.ara,
        this.bre,
        this.ces,
        this.cym,
        this.deu,
        this.est,
        this.fin,
        this.fra,
        this.hrv,
        this.hun,
        this.ita,
        this.jpn,
        this.kor,
        this.nld,
        this.per,
        this.pol,
        this.por,
        this.rus,
        this.slk,
        this.spa,
        this.swe,
        this.tur,
        this.urd,
        this.zho});

  Translations.fromJson(Map<String, dynamic> json) {
    ara = json['ara'] != null ? new Bul.fromJson(json['ara']) : null;
    bre = json['bre'] != null ? new Bul.fromJson(json['bre']) : null;
    ces = json['ces'] != null ? new Bul.fromJson(json['ces']) : null;
    cym = json['cym'] != null ? new Bul.fromJson(json['cym']) : null;
    deu = json['deu'] != null ? new Bul.fromJson(json['deu']) : null;
    est = json['est'] != null ? new Bul.fromJson(json['est']) : null;
    fin = json['fin'] != null ? new Bul.fromJson(json['fin']) : null;
    fra = json['fra'] != null ? new Eng.fromJson(json['fra']) : null;
    hrv = json['hrv'] != null ? new Bul.fromJson(json['hrv']) : null;
    hun = json['hun'] != null ? new Bul.fromJson(json['hun']) : null;
    ita = json['ita'] != null ? new Bul.fromJson(json['ita']) : null;
    jpn = json['jpn'] != null ? new Bul.fromJson(json['jpn']) : null;
    kor = json['kor'] != null ? new Bul.fromJson(json['kor']) : null;
    nld = json['nld'] != null ? new Bul.fromJson(json['nld']) : null;
    per = json['per'] != null ? new Bul.fromJson(json['per']) : null;
    pol = json['pol'] != null ? new Bul.fromJson(json['pol']) : null;
    por = json['por'] != null ? new Bul.fromJson(json['por']) : null;
    rus = json['rus'] != null ? new Bul.fromJson(json['rus']) : null;
    slk = json['slk'] != null ? new Bul.fromJson(json['slk']) : null;
    spa = json['spa'] != null ? new Bul.fromJson(json['spa']) : null;
    swe = json['swe'] != null ? new Bul.fromJson(json['swe']) : null;
    tur = json['tur'] != null ? new Bul.fromJson(json['tur']) : null;
    urd = json['urd'] != null ? new Bul.fromJson(json['urd']) : null;
    zho = json['zho'] != null ? new Bul.fromJson(json['zho']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ara != null) {
      data['ara'] = this.ara!.toJson();
    }
    if (this.bre != null) {
      data['bre'] = this.bre!.toJson();
    }
    if (this.ces != null) {
      data['ces'] = this.ces!.toJson();
    }
    if (this.cym != null) {
      data['cym'] = this.cym!.toJson();
    }
    if (this.deu != null) {
      data['deu'] = this.deu!.toJson();
    }
    if (this.est != null) {
      data['est'] = this.est!.toJson();
    }
    if (this.fin != null) {
      data['fin'] = this.fin!.toJson();
    }
    if (this.fra != null) {
      data['fra'] = this.fra!.toJson();
    }
    if (this.hrv != null) {
      data['hrv'] = this.hrv!.toJson();
    }
    if (this.hun != null) {
      data['hun'] = this.hun!.toJson();
    }
    if (this.ita != null) {
      data['ita'] = this.ita!.toJson();
    }
    if (this.jpn != null) {
      data['jpn'] = this.jpn!.toJson();
    }
    if (this.kor != null) {
      data['kor'] = this.kor!.toJson();
    }
    if (this.nld != null) {
      data['nld'] = this.nld!.toJson();
    }
    if (this.per != null) {
      data['per'] = this.per!.toJson();
    }
    if (this.pol != null) {
      data['pol'] = this.pol!.toJson();
    }
    if (this.por != null) {
      data['por'] = this.por!.toJson();
    }
    if (this.rus != null) {
      data['rus'] = this.rus!.toJson();
    }
    if (this.slk != null) {
      data['slk'] = this.slk!.toJson();
    }
    if (this.spa != null) {
      data['spa'] = this.spa!.toJson();
    }
    if (this.swe != null) {
      data['swe'] = this.swe!.toJson();
    }
    if (this.tur != null) {
      data['tur'] = this.tur!.toJson();
    }
    if (this.urd != null) {
      data['urd'] = this.urd!.toJson();
    }
    if (this.zho != null) {
      data['zho'] = this.zho!.toJson();
    }
    return data;
  }
}

class Demonyms {
  Eng? eng;
  Eng? fra;

  Demonyms({this.eng, this.fra});

  Demonyms.fromJson(Map<String, dynamic> json) {
    eng = json['eng'] != null ? new Eng.fromJson(json['eng']) : null;
    fra = json['fra'] != null ? new Eng.fromJson(json['fra']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eng != null) {
      data['eng'] = this.eng!.toJson();
    }
    if (this.fra != null) {
      data['fra'] = this.fra!.toJson();
    }
    return data;
  }
}

class Eng {
  String? f;
  String? m;

  Eng({this.f, this.m});

  Eng.fromJson(Map<String, dynamic> json) {
    f = json['f'];
    m = json['m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f'] = this.f;
    data['m'] = this.m;
    return data;
  }
}

class Maps {
  String? googleMaps;
  String? openStreetMaps;

  Maps({this.googleMaps, this.openStreetMaps});

  Maps.fromJson(Map<String, dynamic> json) {
    googleMaps = json['googleMaps'];
    openStreetMaps = json['openStreetMaps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['googleMaps'] = this.googleMaps;
    data['openStreetMaps'] = this.openStreetMaps;
    return data;
  }
}

class Gini {
  double? d2018;

  Gini({this.d2018});

  Gini.fromJson(Map<String, dynamic> json) {
    d2018 = json['2018'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['2018'] = this.d2018;
    return data;
  }
}

class Car {
  List<String>? signs;
  String? side;

  Car({this.signs, this.side});

  Car.fromJson(Map<String, dynamic> json) {
    signs = json['signs'].cast<String>();
    side = json['side'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signs'] = this.signs;
    data['side'] = this.side;
    return data;
  }
}

class Flags {
  String? png;
  String? svg;

  Flags({this.png, this.svg});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['png'] = this.png;
    data['svg'] = this.svg;
    return data;
  }
}

class CapitalInfo {
  List<double>? latlng;

  CapitalInfo({this.latlng});

  CapitalInfo.fromJson(Map<String, dynamic> json) {
    latlng = json['latlng'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latlng'] = this.latlng;
    return data;
  }
}

class PostalCode {
  String? format;
  String? regex;

  PostalCode({this.format, this.regex});

  PostalCode.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    regex = json['regex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['format'] = this.format;
    data['regex'] = this.regex;
    return data;
  }
}
