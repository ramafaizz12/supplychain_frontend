part of '../pages.dart';

Widget usermanufacturer() {
  return BlocListener<SupplychainBloc, SupplychainState>(
    listener: (context, state) {
      if (state is DataBerasLoaded) {
        if (state.data!.konfirmasi_manufacturer != true) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ManufacturerForm(),
              ));
        }
      }
    },
    child: checkasset(),
  );
}

class ManufacturerForm extends StatelessWidget {
  const ManufacturerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TimeLinePage(),
                ));
          },
          icon: Icon(
            Icons.traffic,
            color: bluecolor,
          )),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: whitecolor,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          },
        ),
        backgroundColor: backgroudcolor,
        title: Text(
          "Konfirmasi Asset",
          style: textpoppins.copyWith(color: whitecolor),
        ),
      ),
      body: BlocBuilder<SupplychainBloc, SupplychainState>(
        builder: (context, state) {
          if (state is DataBerasLoaded) {
            if (state.data!.konfirmasi_manufacturer != false) {
              return manufacturerFormulir(state.data!.ID);
            }
            if (state.data!.konfirmasi_manufacturer != true) {
              return konfirmasset();
            }
          }
          return konfirmasset();
        },
      ),
    );
  }
}

Widget manufacturerFormulir(
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
      builder: (context, p1) => Padding(
            padding: EdgeInsets.only(
                left: p1.maxWidth * 0.03,
                right: p1.maxWidth * 0.03,
                top: p1.maxHeight * 0.03),
            child: SingleChildScrollView(
              child: Column(
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
                        context.read<SupplychainBloc>().add(
                            TransferAssetToDistributor(
                                lamapenyimpanan: lamapenyimpanan.text,
                                kadarair: kadarair.text,
                                derajatsosoh: derajatsosoh.text,
                                beraskepala: beraskepala.text,
                                butirpatah: butirpatah.text,
                                butirgabah: butirgabah.text,
                                bendalain: bendalain.text,
                                lamapengeringan: lamapengeringan.text,
                                id: assets,
                                jumlah: jumlah.text));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
          ));
}
