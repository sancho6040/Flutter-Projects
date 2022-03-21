import '../backend/backend.dart';
import '../components/credit_card_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCardScreenWidget extends StatefulWidget {
  const NewCardScreenWidget({Key key}) : super(key: key);

  @override
  _NewCardScreenWidgetState createState() => _NewCardScreenWidgetState();
}

class _NewCardScreenWidgetState extends State<NewCardScreenWidget> {
  String radioButtonValue;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String image;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'New Card',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: CreditCardWidget(
                    id: functions.randomID(),
                    value: functions.setValue(valueOrDefault<String>(
                      radioButtonValue,
                      'Credit',
                    )),
                    name: textController.text,
                    type: valueOrDefault(radioButtonValue, "Credit"),
                    // radioButtonValue,
                    image: valueOrDefault<String>(
                      image,
                      'https://wallpaperaccess.com/full/6889482.jpg',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                            setState(() {
                              image =
                                  "https://wallpaperaccess.com/full/6889482.jpg";
                            });
                          },
                          text: '',
                          options: FFButtonOptions(
                            width: 25,
                            height: 25,
                            color: Color(0xFFF34821),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 100,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                            setState(() {
                              image =
                                  "https://media.istockphoto.com/photos/modern-abstract-background-picture-id1178390169?b=1&k=20&m=1178390169&s=170667a&w=0&h=wMuCApdJNQww4TaiO19Z1haAlBhI2n5wvmx4gMgkyP4=";
                            });
                          },
                          text: '',
                          options: FFButtonOptions(
                            width: 25,
                            height: 25,
                            color: Color(0xFF861BE8),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 100,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                            setState(() {
                              image =
                                  "https://static.vecteezy.com/system/resources/previews/002/434/209/original/luxury-dark-black-gradient-background-business-elegant-presentation-banner-vector.jpg";
                            });
                          },
                          text: '',
                          options: FFButtonOptions(
                            width: 25,
                            height: 25,
                            color: Color(0xFF929292),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 3,
                  indent: 30,
                  endIndent: 30,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    'Select an account type',
                    style: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: FlutterFlowRadioButton(
                    options: ['Credit', 'Debit'],
                    initialValue: 'Credit',
                    onChanged: (value) {
                      setState(() => radioButtonValue = value);
                    },
                    optionHeight: 25,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                    buttonPosition: RadioButtonPosition.left,
                    direction: Axis.horizontal,
                    radioButtonColor: Colors.blue,
                    inactiveRadioButtonColor: Color(0x8A000000),
                    toggleable: false,
                    horizontalAlignment: WrapAlignment.start,
                    verticalAlignment: WrapCrossAlignment.start,
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 3,
                  indent: 30,
                  endIndent: 30,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                  child: TextFormField(
                    controller: textController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'name',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xA5798083),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xA5798083),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Poppins',
                          color: Color(0xA5798083),
                        ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final cardsCreateData = createCardsRecordData(
                            id: functions.randomID(),
                            name: textController.text,
                            type: radioButtonValue,
                            value: functions.setValue(valueOrDefault<String>(
                              radioButtonValue,
                              '0',
                            )),
                            image: valueOrDefault<String>(
                              image,
                              'https://static.vecteezy.com/system/resources/previews/002/434/209/original/luxury-dark-black-gradient-background-business-elegant-presentation-banner-vector.jpg',
                            ),
                          );
                          await CardsRecord.collection
                              .doc()
                              .set(cardsCreateData);
                          Navigator.pop(context);
                        },
                        text: 'Create',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40,
                          color: Colors.black,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
