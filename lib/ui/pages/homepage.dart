part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<SupplychainBloc>().add(ToInitial());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController id = TextEditingController();
    final TextEditingController jumlah = TextEditingController();
    final TextEditingController lamapengeringan = TextEditingController();
    final TextEditingController lamapenyimpanan = TextEditingController();
    final TextEditingController derajatsosoh = TextEditingController();
    final TextEditingController beraskepala = TextEditingController();
    final TextEditingController butirpatah = TextEditingController();
    final TextEditingController butirgabah = TextEditingController();
    final TextEditingController bendalain = TextEditingController();
    final TextEditingController kadarair = TextEditingController();
    final TextEditingController nama = TextEditingController();
    final TextEditingController nohp = TextEditingController();
    final TextEditingController npwp = TextEditingController();
    final TextEditingController alamat = TextEditingController();
    final TextEditingController jenisberas = TextEditingController();
    final TextEditingController tanggalpanen = TextEditingController();
    UserLogin user = UserLogin();

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
                                        context
                                            .read<SupplychainBloc>()
                                            .add(ToInitial());
                                        // Navigator.pushReplacement(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           const HomePage(),
                                        //     ));
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
                                    ? user.userFarmer(id, nama, alamat, nohp,
                                        npwp, jenisberas, tanggalpanen)
                                    : state.org == "consumer"
                                        ? user.userConsumer(id)
                                        : user.userLain(
                                            id,
                                            lamapengeringan,
                                            lamapenyimpanan,
                                            kadarair,
                                            derajatsosoh,
                                            beraskepala,
                                            butirpatah,
                                            butirgabah,
                                            bendalain,
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
}
