part of '../pages.dart';

Widget userdistributor() {
  return BlocBuilder<SupplychainBloc, SupplychainState>(
    builder: (context, state) {
      if (state is DataBerasLoaded) {
        if (state.data!.konfirmasi_distributor != false) {
          return distributorFormulir(state.data!.ID);
        }
      }
      return konfirmasset();
    },
  );
}

class DistributorForm extends StatelessWidget {
  const DistributorForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TimeLinePage(),
                ));
          },
          icon: const Icon(Icons.traffic)),
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
            if (state.data!.konfirmasi_distributor != false) {
              return distributorFormulir(state.data!.ID);
            }
            if (state.data!.konfirmasi_distributor != true) {
              return konfirmasset();
            }
          }
          return konfirmasset();
        },
      ),
    );
  }
}

Widget distributorFormulir(
  String? assets,
) {
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
                    namainput: "Jumlah",
                    fontsize: p1.maxHeight * 0.02,
                    controller: jumlah,
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
                            TransferAssetToWholesaler(
                                id: assets, jumlah: jumlah.text));
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
