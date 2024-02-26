part of 'pages.dart';

class UserLogin {
  AuthService auth = AuthService();
  Widget userFarmer(
      TextEditingController id,
      TextEditingController nama,
      TextEditingController alamat,
      TextEditingController nohp,
      TextEditingController npwp,
      TextEditingController lamapanen,
      TextEditingController tanggalpanen) {
    return LayoutBuilder(
      builder: (context, p1) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Lengkapi Data Dibawah\n untuk Membuat Asset",
              style: textpoppins.copyWith(
                  fontWeight: FontWeight.bold, fontSize: p1.maxWidth * 0.055),
            ),
          ),
          SizedBox(
            height: p1.maxHeight * 0.04,
          ),
          InputWidget(
            namainput: "ID",
            fontsize: p1.maxHeight * 0.02,
            controller: id,
          ),
          InputWidget(
            namainput: "Nama Lengkap",
            fontsize: p1.maxHeight * 0.02,
            controller: nama,
          ),
          InputWidget(
            namainput: "Alamat",
            fontsize: p1.maxHeight * 0.02,
            controller: alamat,
          ),
          InputWidget(
            namainput: "Lama Panen",
            fontsize: p1.maxHeight * 0.02,
            controller: lamapanen,
          ),
          InputWidget(
            namainput: "No HP",
            fontsize: p1.maxHeight * 0.02,
            controller: nohp,
          ),
          InputWidget(
            namainput: "Tanggal Panen",
            fontsize: p1.maxHeight * 0.02,
            controller: tanggalpanen,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  initialDatePickerMode: DatePickerMode.day,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025));
              tanggalpanen.text = pickedDate!.toString();
            },
          ),
          SizedBox(
            height: p1.maxHeight * 0.03,
          ),
          Center(
            child: ButtonUtama(
              width: p1.maxWidth * 0.4,
              height: p1.maxHeight * 0.06,
              namabutton: "Buat Asset",
              voidcallback: () {
                context.read<SupplychainBloc>().add(CreateAsset(
                    id: id.text,
                    namapetani: nama.text,
                    alamat: alamat.text,
                    nohp: nohp.text,
                    lamapanen: lamapanen.text,
                    tanggalpanen: tanggalpanen.text));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget userLain(
    TextEditingController id,
    TextEditingController lamapengeringan,
    TextEditingController lamapenyimpanan,
    TextEditingController kadarair,
    TextEditingController derajasosoh,
    TextEditingController beraskepala,
    TextEditingController butirpatah,
    TextEditingController butirgabah,
    TextEditingController bendalain,
    TextEditingController jumlah,
  ) {
    return BlocBuilder<SupplychainBloc, SupplychainState>(
      builder: (context, state) {
        return state is! DataBerasLoaded
            ? LayoutBuilder(
                builder: (context, p1) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Mohon Untuk Konfirmasi ID",
                        style: textpoppins.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: p1.maxWidth * 0.055),
                      ),
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.04,
                    ),
                    InputWidget(
                      namainput: "ID",
                      fontsize: p1.maxHeight * 0.02,
                      controller: id,
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.03,
                    ),
                    Center(
                      child: ButtonUtama(
                        width: p1.maxWidth * 0.4,
                        height: p1.maxHeight * 0.06,
                        namabutton: "Konfirmasi ID",
                        voidcallback: () {
                          context
                              .read<SupplychainBloc>()
                              .add(LockAsset(id: id.text));
                        },
                      ),
                    ),
                  ],
                ),
              )
            : state.data!.konfirmasimanufacturer == true
                ? transferuser(assets: id.text, id: id, jumlah: jumlah)
                : state.data!.konfirmasidistributor == true
                    ? transferuser(assets: id.text, id: id, jumlah: jumlah)
                    : state.data!.konfirmasiwholesaler == true
                        ? transferuser(assets: id.text, id: id, jumlah: jumlah)
                        : state.data!.konfirmasiretailer == true
                            ? transferuser(
                                assets: id.text, id: id, jumlah: jumlah)
                            : const SizedBox();
      },
    );
  }

  Widget transferuser({
    String? assets,
    TextEditingController? id,
    TextEditingController? lamapengeringan,
    TextEditingController? lamapenyimpanan,
    TextEditingController? kadarair,
    TextEditingController? derajatsosoh,
    TextEditingController? beraskepala,
    TextEditingController? butirpatah,
    TextEditingController? butirgabah,
    TextEditingController? bendalain,
    TextEditingController? jumlah,
  }) {
    return LayoutBuilder(
      builder: (context, p1) =>
          BlocBuilder<LoginAndAuthBloc, LoginAndAuthState>(
        builder: (context, state) {
          return state is LoginAndAuthInitial
              ? Column(
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
                    state.org == "manufacturer"
                        ? InputWidget(
                            namainput: "Lama Pengeringan",
                            fontsize: p1.maxHeight * 0.02,
                            controller: lamapengeringan,
                          )
                        : const SizedBox(),
                    state.org == "manufacturer"
                        ? InputWidget(
                            namainput: "Lama Penyimpanan",
                            fontsize: p1.maxHeight * 0.02,
                            controller: lamapenyimpanan,
                          )
                        : InputWidget(
                            namainput: "Jumlah",
                            fontsize: p1.maxHeight * 0.02,
                            controller: jumlah,
                          ),
                    state.org == "manufacturer"
                        ? InputWidget(
                            namainput: "Kadar Air",
                            fontsize: p1.maxHeight * 0.02,
                            controller: kadarair,
                          )
                        : const SizedBox(),
                    state.org == "manufacturer"
                        ? InputWidget(
                            namainput: "Derajat Sosoh",
                            fontsize: p1.maxHeight * 0.02,
                            controller: derajatsosoh,
                          )
                        : const SizedBox(),
                    state.org == "manufacturer"
                        ? InputWidget(
                            namainput: "Beras Kepala",
                            fontsize: p1.maxHeight * 0.02,
                            controller: beraskepala,
                          )
                        : const SizedBox(),
                    state.org == "manufacturer"
                        ? InputWidget(
                            namainput: "Butir Patah",
                            fontsize: p1.maxHeight * 0.02,
                            controller: butirpatah,
                          )
                        : const SizedBox(),
                    state.org == "manufacturer"
                        ? InputWidget(
                            namainput: "Butir Gabah",
                            fontsize: p1.maxHeight * 0.02,
                            controller: butirgabah,
                          )
                        : const SizedBox(),
                    state.org == "manufacturer"
                        ? InputWidget(
                            namainput: "Benda Lain",
                            fontsize: p1.maxHeight * 0.02,
                            controller: bendalain,
                          )
                        : const SizedBox(),
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
                              TransferAsset(id: assets, jumlah: jumlah!.text));
                        },
                      ),
                    )
                  ],
                )
              : const Text("errorki");
        },
      ),
    );
  }

  Widget userConsumer(
    TextEditingController id,
  ) {
    return LayoutBuilder(
      builder: (context, p1) => BlocBuilder<SupplychainBloc, SupplychainState>(
        builder: (context, state) {
          return state is! DataBerasLoaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Mohon Untuk Konfirmasi ID",
                        style: textpoppins.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: p1.maxWidth * 0.055),
                      ),
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.04,
                    ),
                    InputWidget(
                      namainput: "ID",
                      fontsize: p1.maxHeight * 0.02,
                      controller: id,
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.03,
                    ),
                    Center(
                      child: ButtonUtama(
                        width: p1.maxWidth * 0.4,
                        height: p1.maxHeight * 0.06,
                        namabutton: "Konfirmasi ID",
                        voidcallback: () {
                          context
                              .read<SupplychainBloc>()
                              .add(GetDataBeras(id: id.text));
                        },
                      ),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: p1.maxHeight * 0.02,
                    ),
                    Container(
                      width: p1.maxWidth * 0.94,
                      height: p1.maxHeight * 0.4,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 5,
                                offset: const Offset(2, 4))
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: whitecolor),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: p1.maxWidth * 0.05,
                          top: p1.maxHeight * 0.017,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${state.data!.id}",
                              style: textpoppins.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: p1.maxWidth * 0.05),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Nama Petani: ",
                                  style: textpoppins,
                                ),
                                Text("${state.data!.namapetani}",
                                    style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Alamat Petani: ", style: textpoppins),
                                Text("${state.data!.alamatpetani}",
                                    style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Jenis Beras: ", style: textpoppins),
                                Text("${state.data!.jenisberas}",
                                    style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Alamat Perusahaan: ", style: textpoppins),
                                Text("${state.data!.alamatperusahaan}",
                                    style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Tanggal Diolah: ", style: textpoppins),
                                Text("${state.data!.tanggaldiolah}",
                                    style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Tanggal Panen: ", style: textpoppins),
                                Text("${state.data!.tanggalpanen}",
                                    style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("No_Hp: ", style: textpoppins),
                                Text("${state.data!.No_hp}", style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("TimeStamp: ", style: textpoppins),
                                Text("${state.data!.timestamp}",
                                    style: textpoppins)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
