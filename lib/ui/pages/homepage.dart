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
              Icons.track_changes,
              color: bluecolor,
              size: 35,
            )),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: LayoutBuilder(
          builder: (context, p1) => BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return state is AuthAuthenticated
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
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: whitecolor,
                                      ),
                                    ),
                                    Text(
                                      "Selamat Datang, ${state.organization}",
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
                                child: state.organization == "farmer"
                                    ? userFarmer()
                                    : state.organization == "consumer"
                                        ? userConsumer()
                                        : state.organization == "manufacturer"
                                            ? usermanufacturer()
                                            : state.organization ==
                                                    "distributor"
                                                ? userdistributor()
                                                : state.organization ==
                                                        "wholesaler"
                                                    ? userwholesaler()
                                                    : Center(
                                                        child: Text(
                                                          "User Tidak Ditemukan",
                                                          style: textpoppins,
                                                        ),
                                                      )),
                          ),
                        )
                      ],
                    )
                  : const Text("Error");
            },
          ),
        )));
  }
}
