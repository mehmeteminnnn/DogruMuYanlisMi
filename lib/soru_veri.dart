import 'dart:math';

import 'soru.dart';

class SoruVeri {
  int _soruindex = 0;
  List<Soru> _soruBankasi = [
    Soru(
        soruYazi:
            "Fenerbahçe  22 şampiyonlukla Türkiye'nin en çok şampiyon olan takımıdır.",
        soruCevap: false),
    Soru(
        soruYazi:
            "Yüz ölçümlerine göre ülkeler sıralamasında birinci sırayı Çin almıştır.",
        soruCevap: false),
    Soru(
        soruYazi:
            "Programlama dillerinin popülerliğini araştıran Tiobe'ye göre en popüler yazılım dili Python'dır.",
        soruCevap: true),
    Soru(
        soruYazi: "Vatikan Güney Amerika kıtasının güneybatısında yer alır.",
        soruCevap: false),
    Soru(
        soruYazi: "Dünyanın en hızlı büyüyen bitkisi bambudur.",
        soruCevap: true),
    Soru(soruYazi: "Çin'in başkenti Pekin'dir.", soruCevap: true)
  ];
  String GetSoruMetni() {
    return _soruBankasi[_soruindex].soruYazi;
  }

  bool GetSoruCevap() {
    return _soruBankasi[_soruindex].soruCevap;
  }

  void sonrakiSoru() {
    if (_soruindex < _soruBankasi.length - 1) {
      _soruindex++;
    }
  }

  bool sorularBittiMi() {
    if (_soruindex >= _soruBankasi.length - 1) {
      return true;
    } else
      return false;
  }

  void testiSifirla() {
    _soruindex = 0;
  }
}

class RandomSoruVeri extends SoruVeri {
  void sonrakiSoru() {
    if (_soruindex < _soruBankasi.length - 1) {
      _soruindex = Random().nextInt(6);
      ;
    }
  }
}
