part of '../pages.dart';

Widget usermanufacturer() {
  return BlocBuilder<SupplychainBloc, SupplychainState>(
    builder: (context, state) {
      if (state is DataBerasLoaded) {
        if (state.data!.konfirmasi_manufacturer!) {
          return checkasset();
        }
        if (state.data!.konfirmasi_manufacturer != true) {
          return manufacturerform();
        }
      }
      return checkasset();
    },
  );
}

Widget manufacturerform() {
  return BlocBuilder<SupplychainBloc, SupplychainState>(
    builder: (context, state) {
      if (state is DataBerasLoaded) {
        if (state.data!.konfirmasi_manufacturer!) {
          return manufacturerForm(state.data!.ID);
        }
        if (state.data!.konfirmasi_manufacturer != true) {
          return konfirmasset();
        }
      }
      return konfirmasset();
    },
  );
}

Widget manufacturerForm(
  String? assets,
) {
  TextEditingController lamapengeringan = TextEditingController();
  TextEditingController lamapenyimpanan = TextEditingController();
  TextEditingController kadarair = TextEditingController();
  TextEditingController derajatsosoh = TextEditingController();
  TextEditingController beraskepala = TextEditingController();
  TextEditingController butirpatah = TextEditingController();
  TextEditingController butirgabah = TextEditingController();
  TextEditingController bendalain = TextEditingController();
  TextEditingController jumlah = TextEditingController();
  return LayoutBuilder(
      builder: (context, p1) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Isi Data Dibawah untuk Transfer",
                  style: textpoppins.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: p1.maxWidth * 0.055),
                ),
              ),
              SizedBox(
                height: p1.maxHeight * 0.04,
              ),
              InputWidget(
                namainput: "Lama Pengeringan",
                fontsize: p1.maxHeight * 0.02,
                controller: lamapengeringan,
              ),
              InputWidget(
                namainput: "Lama Penyimpanan",
                fontsize: p1.maxHeight * 0.02,
                controller: lamapenyimpanan,
              ),
              InputWidget(
                namainput: "Jumlah",
                fontsize: p1.maxHeight * 0.02,
                controller: jumlah,
              ),
              InputWidget(
                namainput: "Kadar Air",
                fontsize: p1.maxHeight * 0.02,
                controller: kadarair,
              ),
              InputWidget(
                namainput: "Derajat Sosoh",
                fontsize: p1.maxHeight * 0.02,
                controller: derajatsosoh,
              ),
              InputWidget(
                namainput: "Beras Kepala",
                fontsize: p1.maxHeight * 0.02,
                controller: beraskepala,
              ),
              InputWidget(
                namainput: "Butir Patah",
                fontsize: p1.maxHeight * 0.02,
                controller: butirpatah,
              ),
              InputWidget(
                namainput: "Butir Gabah",
                fontsize: p1.maxHeight * 0.02,
                controller: butirgabah,
              ),
              InputWidget(
                namainput: "Benda Lain",
                fontsize: p1.maxHeight * 0.02,
                controller: bendalain,
              ),
              SizedBox(
                height: p1.maxHeight * 0.03,
              ),
              Center(
                child: ButtonUtama(
                  width: p1.maxWidth * 0.4,
                  height: p1.maxHeight * 0.06,
                  namabutton: "Transfer Asset",
                  voidcallback: () {
                    context
                        .read<SupplychainBloc>()
                        .add(TransferAsset(id: assets, jumlah: jumlah.text));
                  },
                ),
              )
            ],
          ));
}
