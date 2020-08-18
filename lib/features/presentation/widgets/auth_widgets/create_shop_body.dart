import 'package:flutter/material.dart';

import '../../../../core/utils/Constants.dart';
import '../../../data/models/User/UserModel.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../button_widget.dart';

class CreateShopBody extends StatefulWidget {
  const CreateShopBody({
    Key key,
    @required this.state,
    @required this.authBloc,
    @required this.user,
  }) : super(key: key);

  final state;
  final AuthBloc authBloc;
  final UserModel user;
  @override
  _CreateShopBodyState createState() => _CreateShopBodyState();
}

class _CreateShopBodyState extends State<CreateShopBody> {
  String shop_name,
      shop_address,
      shop_number,
      mpesa_number,
      bank_name,
      bank_user_name,
      bank_account_number;
  String allow_imports = 'false';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: Text(
            'Create Shop',
            style: kHeadingTextStyle,
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Shop Name",
                    labelStyle: kLabelStyle,
                    errorText: widget.state.title == "shop_name"
                        ? widget.state.message
                        : null,
                    hintText: "Enter shop name",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.local_mall),
                  ),
                  onChanged: (value) {
                    setState(() {
                      shop_name = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Shop Address",
                    labelStyle: kLabelStyle,
                    errorText: widget.state.title == "shop_address"
                        ? widget.state.message
                        : null,
                    hintText: "Enter shop address",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  onChanged: (value) {
                    setState(() {
                      shop_address = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Shop Number",
                          labelStyle: kRLabelStyle,
                          errorText: widget.state.title == "shop_number"
                              ? widget.state.message
                              : null,
                          hintText: "Enter shop number",
                          hintStyle: kRHintStyle,
                          prefixIcon: Icon(Icons.call),
                        ),
                        onChanged: (value) {
                          setState(() {
                            shop_number = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Mpesa Number",
                          labelStyle: kRLabelStyle,
                          errorText: widget.state.title == "mpesa_number"
                              ? widget.state.message
                              : null,
                          hintText: "Enter mpesa number",
                          hintStyle: kRHintStyle,
                          prefixIcon: Icon(Icons.transform),
                        ),
                        onChanged: (value) {
                          setState(() {
                            mpesa_number = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    // SvgPicture.asset(
                    //   svgSrc,
                    //   width: size.width * 0.18,
                    // ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: "Allow Imports",
                              labelStyle: kLabelStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorText: widget.state.title == "allow_import"
                                  ? widget.state.message
                                  : null,
                            ),
                            value: allow_imports,
                            items: [
                              DropdownMenuItem(
                                child: Text('Yes'),
                                value: 'true',
                              ),
                              DropdownMenuItem(
                                child: Text('No'),
                                value: 'false',
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                allow_imports = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Bank Name",
                    labelStyle: kLabelStyle,
                    errorText: widget.state.title == "bank_name"
                        ? widget.state.message
                        : null,
                    hintText: "Enter bank name",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.local_atm),
                  ),
                  onChanged: (value) {
                    setState(() {
                      bank_name = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Bank Username",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 12,
                          ),
                          errorText: widget.state.title == "bank_user_name"
                              ? widget.state.message
                              : null,
                          hintText: "Enter bank username",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 12,
                          ),
                          prefixIcon: Icon(Icons.call),
                        ),
                        onChanged: (value) {
                          setState(() {
                            bank_user_name = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Bank Account",
                          labelStyle: kRLabelStyle,
                          errorText: widget.state.title == "bank_account"
                              ? widget.state.message
                              : null,
                          hintText: "Enter bank account",
                          hintStyle: kRHintStyle,
                          prefixIcon: Icon(Icons.transform),
                        ),
                        onChanged: (value) {
                          setState(() {
                            bank_account_number = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              MyCustomButton(
                press: () => widget.authBloc.add(CreateShopEvent(
                  shop_name: shop_name,
                  shop_address: shop_address,
                  shop_number: shop_number,
                  mpesa_number: mpesa_number,
                  bank_name: bank_name,
                  bank_user_name: bank_user_name,
                  bank_account_number: bank_account_number,
                  allow_imports: allow_imports,
                  user: widget.user,
                )),
                title: 'Create Shop',
              )
            ],
          ),
        )
      ],
    );
  }
}
