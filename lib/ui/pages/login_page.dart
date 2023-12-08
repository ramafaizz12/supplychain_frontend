part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _onLoginbuttonpressed() {
    context.read<LoginAndAuthBloc>().add(LoginButton(
        email: username.text,
        password: password.text,
        organization: organization));
    setState(() {});
  }

  String? organization;
  AuthService auth = AuthService();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isemailvalid = false;
  bool obscure = true;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AppStarted());
    return LayoutBuilder(
      builder: (p0, p1) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroudcolor,
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
                top: p1.maxHeight * 0.15,
                left: p1.maxWidth * 0.032,
                right: p1.maxWidth * 0.032),
            child: Column(
              children: [
                SizedBox(
                  height: p1.maxHeight * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: p1.maxHeight * 0.02,
                          right: p1.maxHeight * 0.02),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "MASUK",
                              style: textpoppins.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: whitecolor,
                                  fontSize: p1.maxHeight * 0.02),
                            ),
                            Shimmer.fromColors(
                              baseColor: pinkcolor,
                              highlightColor: pinkabu,
                              child: Text(
                                "SUPPLY CHAIN",
                                style: textpoppins.copyWith(
                                    fontWeight: FontWeight.w900,
                                    fontSize: p1.maxHeight * 0.03),
                              ),
                            ),
                            SizedBox(
                              height: p1.maxHeight * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: textpoppins.copyWith(
                                      color: whitecolor,
                                      fontSize: p1.maxHeight * 0.02),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: whitecolor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (text) {},
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 8),
                                          border: InputBorder.none),
                                      controller: username,
                                      style: textpoppins,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: p1.maxHeight * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Password",
                                  style: textpoppins.copyWith(
                                      color: whitecolor,
                                      fontSize: p1.maxHeight * 0.02),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: whitecolor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Stack(children: [
                                    TextField(
                                      obscureText: obscure,
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 8),
                                          border: InputBorder.none),
                                      controller: password,
                                      style: textpoppins,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: p1.maxHeight * 0.02,
                                          right: p1.maxWidth * 0.02),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: obscure != true
                                              ? InkWell(
                                                  child: const Icon(
                                                      Icons.visibility),
                                                  onTap: () {
                                                    setState(() {
                                                      obscure = true;
                                                    });
                                                  })
                                              : InkWell(
                                                  child: const Icon(
                                                      Icons.visibility_off),
                                                  onTap: () {
                                                    setState(() {
                                                      obscure = false;
                                                    });
                                                  })),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            DropdownSearch<String>(
                              selectedItem: organization,
                              onChanged: (value) {
                                setState(() {
                                  organization = value;
                                });
                              },
                              items: const [
                                "farmer",
                                "manufacturer",
                                "distributor",
                                "retailer",
                                "wholesaler",
                                "consumer"
                              ],
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                baseStyle:
                                    textpoppins.copyWith(color: whitecolor),
                                dropdownSearchDecoration: InputDecoration(
                                  labelStyle:
                                      textpoppins.copyWith(color: whitecolor),
                                  labelText: "Organization",
                                ),
                              ),
                              popupProps: const PopupProps.menu(
                                showSelectedItems: true,

                                // popupItemDisabled: isItemDisabled,
                                // onChanged: itemSelectionChanged,

                                showSearchBox: true,
                              ),
                            ),
                            SizedBox(
                              height: p1.maxHeight * 0.05,
                            ),
                            BlocBuilder<LoginAndAuthBloc, LoginAndAuthState>(
                              builder: (context, state) {
                                return state is LoginLoaded
                                    ? SpinKitFadingFour(
                                        color: birumuda,
                                        size: 50,
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ButtonUtama(
                                            width: p1.maxWidth * 0.4,
                                            height: p1.maxHeight * 0.05,
                                            namabutton: "Login",
                                            voidcallback: () {
                                              _onLoginbuttonpressed();
                                              // await auth.loginapi(
                                              //     "ramafais27@gmail.com",
                                              //     "121289",
                                              //     "manufacturer");
                                            },
                                          ),
                                        ],
                                      );
                              },
                            ),
                            BlocBuilder<LoginAndAuthBloc, LoginAndAuthState>(
                                builder: (context, state) {
                              return state is LoginFailure
                                  ? Text(
                                      "Password atau Username Salah",
                                      style: textpoppins.copyWith(
                                          fontSize: p1.maxHeight * 0.02,
                                          color: blackcolor),
                                    )
                                  : const SizedBox();
                            })
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: p1.maxHeight * 0.07,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
