import '../backend/backend.dart';
import '../components/credit_card_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../new_card_screen/new_card_screen_widget.dart';
import '../transaction_screen/transaction_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardsScreenWidget extends StatefulWidget {
  const CardsScreenWidget({Key key}) : super(key: key);

  @override
  _CardsScreenWidgetState createState() => _CardsScreenWidgetState();
}

class _CardsScreenWidgetState extends State<CardsScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Cards',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 22,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewCardScreenWidget(),
                ),
              );
            },
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: StreamBuilder<List<CardsRecord>>(
                    stream: queryCardsRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      List<CardsRecord> listViewCardsRecordList = snapshot.data;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewCardsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewCardsRecord =
                              listViewCardsRecordList[listViewIndex];
                          return InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TransactionScreenWidget(
                                    id: listViewCardsRecord.id,
                                    type: listViewCardsRecord.type,
                                    name: listViewCardsRecord.name,
                                    image: listViewCardsRecord.image,
                                    value: listViewCardsRecord.value,
                                  ),
                                ),
                              );
                            },
                            onLongPress: () async {
                              await listViewCardsRecord.reference.delete();
                            },
                            child: CreditCardWidget(
                              id: listViewCardsRecord.id,
                              value: listViewCardsRecord.value,
                              name: listViewCardsRecord.name,
                              type: listViewCardsRecord.type,
                              image: listViewCardsRecord.image,
                            ),
                          );
                        },
                      );
                    },
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
