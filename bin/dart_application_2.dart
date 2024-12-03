import 'dart:io';
import '../lib/akademik.dart';

void main() {
  // Input Nama Mahasiswa dan Data KRS
  stdout.write("Masukkan NIM Mahasiswa: ");
  String nim = stdin.readLineSync()!;

  stdout.write("Masukkan Nama Mahasiswa: ");
  String nama = stdin.readLineSync()!;

  stdout.write("Masukkan Semester Mahasiswa: ");
  int semester = int.parse(stdin.readLineSync()!);

  var mahasiswa1 = Mahasiswa(nim, nama, semester);

  // Data Mata Kuliah
  var mataKuliah1 = MataKuliah("MK001", "Algoritma", 3);
  var mataKuliah2 = MataKuliah("MK002", "Struktur Data", 4);
  var mataKuliah3 = MataKuliah("MK003", "Pemrograman Web", 2);

  // KRS Mahasiswa
  var krs = KRS(mahasiswa1, [mataKuliah1, mataKuliah2, mataKuliah3]);
  krs.cetakKRS();

  // Input Nilai untuk Setiap Mata Kuliah
  print("\nMasukkan nilai mahasiswa:");
  List<Nilai> daftarNilai = [];
  for (var mk in krs.daftarMataKuliah) {
    stdout.write("Nilai untuk ${mk.nama}: ");
    double nilai = double.parse(stdin.readLineSync()!);
    daftarNilai.add(Nilai(mk, nilai));
  }

  // Cetak Transkrip Nilai
  var transkrip = Transkrip(mahasiswa1, daftarNilai);
  transkrip.cetakTranskrip();
}