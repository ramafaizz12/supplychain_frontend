part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController id = TextEditingController();
    final TextEditingController tanggaldiolah = TextEditingController();
    final TextEditingController alamatperusahaan = TextEditingController();
    final TextEditingController jumlah = TextEditingController();
    final TextEditingController nama = TextEditingController();
    final TextEditingController alamat = TextEditingController();
    final TextEditingController jenisberas = TextEditingController();
    final TextEditingController tanggalpanen = TextEditingController();
    UserLogin user = UserLogin();
    closebutton() {
      Navigator.pop(context);
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: LayoutBuilder(
          builder: (context, p1) =>
              BlocBuilder<LoginAndAuthBloc, LoginAndAuthState>(
            builder: (context, state) {
              return state is LoginAndAuthInitial
                  ? Stack(
                      children: [
                        onstatus(),
                        Container(
                          width: p1.maxWidth,
                          height: p1.maxHeight * 0.3,
                          color: backgroudcolor,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage(),
                                            ));
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: whitecolor,
                                      ),
                                    ),
                                    Text(
                                      "Selamat Datang, ${state.org}",
                                      style: textpoppins.copyWith(
                                          color: whitecolor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: p1.maxWidth * 0.043),
                                    ),
                                    ButtonLogout(
                                        width: p1.maxWidth * 0.3,
                                        height: p1.maxHeight * 0.06)
                                  ],
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                color: whitecolor,
                                borderRadius: BorderRadius.circular(20)),
                            width: p1.maxWidth,
                            height: p1.maxHeight * 0.91,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: p1.maxHeight * 0.03,
                                    left: p1.maxHeight * 0.02,
                                    right: p1.maxHeight * 0.02),
                                child: state.org == "farmer"
                                    ? user.userFarmer(id, nama, alamat,
                                        jenisberas, tanggalpanen)
                                    : state.org == "consumer"
                                        ? user.userConsumer(id)
                                        : user.userManufacturer(
                                            id,
                                            tanggaldiolah,
                                            alamatperusahaan,
                                            jumlah)),
                          ),
                        )
                      ],
                    )
                  : const Text("error bos");
            },
          ),
        )));
  }

  Widget onstatus() {
    return BlocListener<SupplychainBloc, SupplychainState>(
        listener: (context, state) {
          if (state is DataBerasSukses) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Data Berhasil Disimpan',
                onConfirmBtnTap: () {
                  Navigator.pop(context);
                },
                confirmBtnColor: bluecolor,
                confirmBtnTextStyle: textpoppins.copyWith(color: whitecolor));
          }
          if (state is DataBerasLoading) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.loading,
                text: "Mohon Tunggu",
                autoCloseDuration: const Duration(seconds: 2),
                onConfirmBtnTap: () {
                  Navigator.pop(context);
                },
                confirmBtnColor: bluecolor,
                confirmBtnTextStyle: textpoppins.copyWith(color: whitecolor));
          }

          if (state is DataBerasFailed) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: "Terjadi Kesalahan",
                onConfirmBtnTap: () {
                  Navigator.pop(context);
                },
                confirmBtnColor: bluecolor,
                confirmBtnTextStyle: textpoppins.copyWith(color: whitecolor));
          }
        },
        child: Container());
  }
}
