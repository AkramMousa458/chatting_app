import '../localization.dart';

enum TKeys {
  welcome_text1,
  welcome_text2,
  why1,
  why2,
  why3,
  login1,
  login2,
  login3,
  login4,
  Choose_Topic1,
  Choose_Topic2,
  Choose_Topic3,
  c0bj,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  one1,
  two2,
  three3,
  four4,
  five5,
  six6,
  seven7,
  eight8,
  nine9,

  one11,
  one12,
  one13,
  one14,
  one15,
  one16,
  one17,
  one18,
  one19,
  one20,
  one21,
  one22,

  two22,
  two23,
  two24,
  two25,
  two26,
  two27,
  two28,
  two29,
  two30,
  two31,
  two32,
  two33,
  two34,
  two35,
  two36,
  two37,
  two38,
  two39,
  two40,
  two41,
  two42,

  three33,
  three34,
  three35,
  three36,
  three37,
  three38,
  three39,
  three40,
  three41,
  three42,

  four44,
  four45,
  four46,
  four47,
  four48,
  four49,
  four50,
  four51,
  four52,
  four53,
  four54,
  four55,
  four56,

  five55,
  five56,
  five57,
  five58,
  five59,
  five60,
  five61,
  five62,
  five63,
  five64,
  five65,
  five66,

  six66,
  six67,
  six68,
  six69,
  six70,
  six71,
  six72,
  six73,
  six74,
  six75,

  seven77,
  seven78,
  seven79,
  seven80,
  seven801,
  seven802,
  seven803,
  seven804,
  seven805,
  seven806,
  seven807,
  seven808,
  seven809,
  seven8010,
  seven8011,
  seven8012,
  seven8013,
  seven8014,
  seven8015,
  seven8016,
  seven8017,
  seven8018,
  seven8019,
  seven8020,
  seven8021,
  seven8022,
  seven8023,
  seven81,
  seven82,
  seven83,

  eight881,
  eight882,
  eight883,
  eight884,
  eight885,
  eight886,
  eight887,
  eight888,
  eight889,
  eight890,
  eight891,
  eight892,
  eight893,
  eight894,
  eight895,
  eight896,
  eight897,
  eight898,
  eight899,
  eight900,

  nine99,
  nine991,
  nine992,
  nine993,
  nine994,
  nine995,
  nine996,
  nine997,
  nine998,
  nine999,
  nine9910,
  nine9911,

  ten10,
  ten11,
  ten12,
  ten13,
  ten14,
  ten15,
  ten16,
  ten17,
  ten18,
  ten19,

  eleven11,
  eleven12,
  eleven13,
  eleven14,
  eleven15,
  eleven16,
  eleven17,
  eleven18,
  eleven19,
  eleven120,
  eleven121,
  eleven122,
  eleven123,

  twelve12,
  twelve121,
  twelve122,
  twelve123,
  twelve124,
  twelve125,
  twelve126,
  twelve127,
  twelve128,
  twelve129,

  thirteen13,
  thirteen131,
  thirteen132,
  thirteen133,
  thirteen134,
  thirteen135,
  thirteen136,
  thirteen137,
  thirteen138,
  thirteen139,

  fourteen14,
  fourteen141,
  fourteen142,
  fourteen143,
  fourteen144,
  fourteen145,
  fourteen146,
  fourteen147,
  fourteen148,
  fourteen149,
  fourteen1410,
  fourteen1411,

  fifteen15,
  fifteen151,
  fifteen152,
  fifteen153,
  fifteen154,
  fifteen155,
  fifteen156,
  fifteen157,
  fifteen158,
  fifteen159,
  fifteen1510,
  fifteen1511,
  fifteen1512,
  fifteen1513,

  sixteen16,
  sixteen161,
  sixteen162,
  sixteen163,
  sixteen164,
  sixteen165,
  sixteen166,
  sixteen167,
  sixteen168,
  sixteen169,
  sixteen1610,
  sixteen1611,
  sixteen1612,
  sixteen1613,
  sixteen1614,
  sixteen1615,
  sixteen1616,
  sixteen1617,

  seventeen17,
  seventeen171,
  seventeen172,
  seventeen173,
  seventeen174,
  seventeen175,
  seventeen176,
  seventeen177,
  seventeen178,
  seventeen179,
  f,

  eighteen18,
  eighteen181,
  eighteen182,
  eighteen183,
  eighteen184,
  eighteen185,
  eighteen186,
  eighteen187,
  eighteen188,
  eighteen189,
  eighteen1810,
  eighteen1811,
  eighteen1812,

  nineteen19,
  nineteen191,
  nineteen192,
  nineteen193,
  nineteen194,
  nineteen195,
  nineteen196,
  nineteen197,
  nineteen198,
  nineteen199,
  nineteen1910,
  nineteen1911,

  University_Activities,
  Menoufia_Clubs,

  Visit_Website,
  City_Club,
  Ghazl_Clubs,
  Gomhoria_Sporting_Club,

  Restaurant,
  Cafes,
  Offers,

  About,

  Order,
  Details,

  All_medical_specialties,
  Find_your_doctor,

  Book_your_appointment,

  Form,
  Number_of_People,
  Apartment_condition,
  Number_of_Rooms,
  Rent,
  Submit,

  Complaints_and_Inquiries,
  Write,
}

//TKeys.hello
extension TKeysExtention on TKeys {
  String get _string => toString().split('.')[1];

  String translate(context) {
    return LocalizationService.of(context).translate(_string) ?? '';
  }
}
