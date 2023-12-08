part of 'pages.dart';

class UserLogin {
  AuthService auth = AuthService();
  Widget userFarmer(
      TextEditingController id,
      TextEditingController nama,
      TextEditingController alamat,
      TextEditingController jenisberas,
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
            namainput: "Jenis Beras",
            fontsize: p1.maxHeight * 0.02,
            controller: jenisberas,
          ),
          InputWidget(
            namainput: "Tanggal Panen",
            fontsize: p1.maxHeight * 0.02,
            controller: tanggalpanen,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(), //get today's date
                  firstDate: DateTime(
                      2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101));

              tanggalpanen.text = pickedDate.toString();
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
                    jenisberas: jenisberas.text,
                    namapetani: nama.text,
                    alamat: alamat.text,
                    tanggalpanen: tanggalpanen.text));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget userManufacturer(
    TextEditingController id,
    TextEditingController tanggaldiolah,
    TextEditingController alamatperusahaan,
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
                    )
                  ],
                ),
              )
            : state.data!.konfirmasimanufacturer == true
                ? transferuser(
                    assets: id.text,
                    id: id,
                    tanggaldiolah: tanggaldiolah,
                    alamatperusahaan: alamatperusahaan,
                    jumlah: jumlah)
                : state.data!.konfirmasidistributor == true
                    ? transferuser(
                        assets: id.text,
                        id: id,
                        tanggaldiolah: tanggaldiolah,
                        alamatperusahaan: alamatperusahaan,
                        jumlah: jumlah)
                    : state.data!.konfirmasiwholesaler == true
                        ? transferuser(
                            assets: id.text,
                            id: id,
                            tanggaldiolah: tanggaldiolah,
                            alamatperusahaan: alamatperusahaan,
                            jumlah: jumlah)
                        : state.data!.konfirmasiretailer == true
                            ? transferuser(
                                assets: id.text,
                                id: id,
                                tanggaldiolah: tanggaldiolah,
                                alamatperusahaan: alamatperusahaan,
                                jumlah: jumlah)
                            : const SizedBox();
      },
    );
  }

  Widget transferuser({
    String? assets,
    TextEditingController? id,
    TextEditingController? tanggaldiolah,
    TextEditingController? alamatperusahaan,
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
                            namainput: "Tanggal Diolah",
                            fontsize: p1.maxHeight * 0.02,
                            controller: tanggaldiolah,
                          )
                        : const SizedBox(),
                    state.org == "manufacturer"
                        ? InputWidget(
                            namainput: "Alamat Perusahaan",
                            fontsize: p1.maxHeight * 0.02,
                            controller: alamatperusahaan,
                          )
                        : const SizedBox(),
                    state.org != "manufacturer"
                        ? InputWidget(
                            namainput: "Jumlah",
                            fontsize: p1.maxHeight * 0.02,
                            controller: jumlah,
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
                          context.read<SupplychainBloc>().add(TransferAsset(
                              id: assets,
                              tanggaldiolah: tanggaldiolah!.text,
                              alamatperusahaan: alamatperusahaan!.text,
                              jumlah: jumlah!.text));
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
                      width: p1.maxWidth * 0.7,
                      height: p1.maxHeight * 0.34,
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
