import 'package:bilgiyarismasi/sabitler.dart';
import 'package:bilgiyarismasi/soru_veri.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      BilgiTesti(),
    );

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.deepPurpleAccent, body: Sorusayfasi()),
      ),
    );
  }
}

class Sorusayfasi extends StatefulWidget {
  const Sorusayfasi({Key? key}) : super(key: key);

  @override
  State<Sorusayfasi> createState() => _SorusayfasiState();
}

class _SorusayfasiState extends State<Sorusayfasi> {
  List<Icon> secimler = [];
  SoruVeri soru1 = SoruVeri();
  int dogrusayisi = 0;
  void butonFonkiyonu(bool secilen) {
    if (soru1.sorularBittiMi()) {
      if (soru1.GetSoruCevap() == secilen) {
        dogrusayisi++;
      }
      //alert dialog goster
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('TEBRİKLER TESTİ BİTİRDİNİZ:)'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text("Doğru sayınız=${dogrusayisi} ")],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Başa Dön'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    soru1.testiSifirla();
                    secimler.clear();
                    dogrusayisi = 0;
                  });
                },
              ),
            ],
          );
        },
      );
      //indexi sıfırla
      // secimleri sıfırla(yuzlerı)
    } else {
      setState(() {
        if (soru1.GetSoruCevap() == secilen) {
          dogrusayisi++;
          secimler.add(dogru);
        } else {
          secimler.add(yanlis);
        }
        soru1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                soru1.GetSoruMetni(),
                style: TextStyle(
                  fontSize: (30),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 100.0),
        Wrap(
          spacing: 12,
          children: secimler,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 1.0, 0.0, 0.0),
            child: Row(
              children: [
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      butonFonkiyonu(true);
                    },
                    icon: Icon(
                      Icons.thumb_up,
                      size: 45,
                    ),
                    label: Text('DOĞRU'),
                  ),
                ),
                SizedBox(width: 50.0),
                ElevatedButton.icon(
                  onPressed: () {
                    butonFonkiyonu(false);
                  },
                  icon: Icon(Icons.thumb_down, size: 45),
                  label: Text('YANLIŞ'),
                ),
                SizedBox(width: 50.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
