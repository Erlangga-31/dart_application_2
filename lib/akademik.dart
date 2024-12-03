class Mahasiswa {
  String nim;
  String nama;
  int semester;

  Mahasiswa(this.nim, this.nama, this.semester);
}

class MataKuliah {
  String kode;
  String nama;
  int sks;

  MataKuliah(this.kode, this.nama, this.sks);
}

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah;

  KRS(this.mahasiswa, this.daftarMataKuliah);

  void cetakKRS() {
    print("\nKRS Mahasiswa");
    print("NIM: ${mahasiswa.nim}");
    print("Nama: ${mahasiswa.nama}");
    print("Semester: ${mahasiswa.semester}\n");
    print("Daftar Mata Kuliah:");
    for (var mk in daftarMataKuliah) {
      print("- ${mk.nama} (${mk.kode}), ${mk.sks} SKS");
    }
  }
}

class Nilai {
  MataKuliah mataKuliah;
  double nilai;

  Nilai(this.mataKuliah, this.nilai);
}

class Transkrip {
  Mahasiswa mahasiswa;
  List<Nilai> daftarNilai;

  Transkrip(this.mahasiswa, this.daftarNilai);

  double hitungIPK() {
    if (daftarNilai.isEmpty) return 0.0;

    double totalPoin = 0.0;
    int totalSKS = 0;

    for (var nilai in daftarNilai) {
      totalPoin += nilai.nilai * nilai.mataKuliah.sks;
      totalSKS += nilai.mataKuliah.sks;
    }
    return totalPoin / totalSKS;
  }

  void cetakTranskrip() {
    print("\nTranskrip Nilai");
    print("NIM: ${mahasiswa.nim}");
    print("Nama: ${mahasiswa.nama}");
    print("\nDaftar Nilai:");
    for (var nilai in daftarNilai) {
      print(
      "- ${nilai.mataKuliah.nama} (${nilai.mataKuliah.sks} SKS): ${nilai.nilai}");
    }
    print("\nIPK: ${hitungIPK().toStringAsFixed(2)}");
  }
}
