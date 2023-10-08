import 'package:flutter/material.dart';
import 'package:my_app/ui/produk_detail.dart';

class ProdukForm extends StatefulWidget { 
  const ProdukForm({Key? key}) : super(key: key);
  @override _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk'),
        backgroundColor: Colors.indigo.shade700,
        foregroundColor: Colors.white
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textboxKodeProduk(),
            _textboxNamaProduk(),
            _textboxHargaProduk(),
            _tombolSimpan()
          ].map((widget) =>  Padding(
              padding: const EdgeInsets.all(16),
              child: widget,
            )).toList()
          ,
        ),
      ),
    );
  }

  _textboxKodeProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      controller: _kodeProdukTextboxController
    );
  }

  _textboxNamaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukTextboxController,
    );
  }

  _textboxHargaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga"),
      controller: _hargaProdukTextboxController,
    );
  }

  _tombolSimpan() {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
            onPressed: () {
              String kodeProduk = _kodeProdukTextboxController.text;
              String namaProduk = _namaProdukTextboxController.text;
              int harga = int.parse(_hargaProdukTextboxController.text);
              
              Navigator
                .of(context)
                .push(MaterialPageRoute(
                  builder: (context) => ProdukDetail(
                      kodeProduk: kodeProduk,
                      namaProduk: namaProduk,
                      harga: harga,
                    )
                  )
                );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50), // NEW
            ),
            child: const Text('Simpan')
          )
    );
  }
}
