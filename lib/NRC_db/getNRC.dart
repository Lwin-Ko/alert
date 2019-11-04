import 'NRC.dart';

class getNRC {
  List<Map> getAll() => _NRC;

  getNameByCode(String code) => _NRC
      .map((map) => NRC.fromJson(map))
      .where((item) => item.code == code)
      .map((item) => item.Name)
      .expand((i) => i)
      .toList();

  List<String> getCodes() =>
      _NRC.map((map) => NRC.fromJson(map)).map((item) => item.code).toList();

  List _NRC = [
    {
      "code": "၁/",
      "Name": ['မကန', "မညန", "ကမန"]
    },
    {
      "code": "၂/",
      "Name": ['လကန']
    },
    {
      "code": "၃/",
      "Name": ['ဘအန', 'တကန']
    },
    {
      "code": "၄/",
      "Name": ['တဇန']
    },
    {
      "code": "၅/",
      "Name": [
        "တမန",
        "ကဘလ",
        'မရန',
        'ရဘန',
        'စကန',
        'ပလဘ',
        'တဆန',
        'ကသန',
      ]
    },
    {
      "code": "၆/",
      "Name": ["မမန", "ခမက", "ကစန"]
    },
    {
      "code": "၇/",
      "Name": [
        "ကတခ",
        "ညလပ",
        'ပခန',
        'ရတရ',
        'လပတ',
        'သကန',
        'သဝတ',
        'ရတန',
        'အဖန',
        'ပမန',
        'ဒဥန',
        'အတန',
        'မညန',
        'ပခတ',
        'သနပ',
        'ကမက',
        'ကဝန',
        'တငန',
        'ပတတ'
      ]
    },
    {
      "code": "၈/",
      "Name": [
        'ဆဖန',
        'မသန',
        'အလန',
        'မကန',
        'ရနခ',
        'ဂဂန',
        'ပခက',
        'မကန',
        'စလန',
        'ခမန',
        'ရစက',
        'မဘန',
      ]
    },
    {
      "code": "၉/",
      "Name": [
        'စကတ',
        'ညဥန',
        'အမဇ',
        'မဟမ',
        'ပဘန',
        'ဇယသ',
        'မကန',
        'တကန',
        'ဇဗသ',
        'တသန',
        'ဥတသ',
        'ပဗန',
        'ပမန',
        'ခအဇ',
        'မခန',
        'မထလ',
        'ပကခ',
        'ကဆန',
        'အမဇ',
        'ဝတန',
        'လဝန',
      ]
    },
    {
      "code": "၁၀/",
      "Name": [
        'မဒန',
        'ပမန',
        'မလမ',
        'ခဆန',
        'သထန',
        'သဖရ',
        'သတန',
        'ရမန',
        'ကထန',
        'မလန',
        'အစန',
      ]
    },
    {
      "code": "၁၁/",
      "Name": [
        'စတန',
        'မဥန',
        'ခတန',
        'သတန',
        'အမန',
      ]
    },
    {
      "code": "၁၂/",
      "Name": [
        "မဂတ",
        'ရပသ',
        'သကတ',
        'ရကန',
        "အလန",
        'ပဇတ',
        'တမန',
        "ဗဟန",
        'ပဘတ',
        'တကန',
        'တတန',
        'ဗတထ',
        'စခန',
        'သဃက',
        'ဒလန',
        'ကခက',
        'သလန',
        'သခန',
        'ဒပန',
        'လမန',
        'လသယ',
        'မရက',
        'လသန',
        'လခန',
        'မဘန',
        'ထတပ',
        'အစန',
        'ကမရ',
        'လမတ',
        'ကမတ',
        'ကမန',
        'ကတန',
        'ကတတ',
        'ခရန',
      ]
    },
    {
      "code": "၁၃/",
      "Name": [
        'တကန',
        'ကလန',
        'လရန',
        'ကမန',
        'ရငန',
        'နခန',
        'တခလ' 'လလန',
      ]
    },
    {
      "code": "၁၄/",
      "Name": [
        'ဘကလ',
        'ဒနဖ',
        'ဒဒရ',
        'အမန',
        'ဟသတ',
        'အဂပ',
        'ကကထ',
        'ကလန',
        'ပသန',
        'မမက',
        'ကခန',
        'ဖပန',
        'ဟသန',
        'ရကန',
        'ပတန',
        'ငပတ',
        'ပသန',
        'ငသခ',
        'အမတ',
        'ကကန',
        'ညတန',
        'မမန',
        'မအမ',
        'မအန',
        'ဘကလ'
      ]
    },
  ];
}
