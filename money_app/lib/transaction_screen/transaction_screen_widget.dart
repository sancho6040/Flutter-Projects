import '../backend/backend.dart';
import '../components/credit_card_widget.dart';
import '../components/modal_copy_widget.dart';
import '../components/modal_widget.dart';
import '../components/transaction_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionScreenWidget extends StatefulWidget {
  const TransactionScreenWidget({
    Key key,
    this.id,
    this.value,
    this.type,
    this.name,
    this.image,
  }) : super(key: key);

  final int id;
  final double value;
  final String type;
  final String name;
  final String image;

  @override
  _TransactionScreenWidgetState createState() =>
      _TransactionScreenWidgetState();
}

class _TransactionScreenWidgetState extends State<TransactionScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          'your card',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: CreditCardWidget(
                  id: widget.id,
                  value: widget.value,
                  name: widget.name,
                  type: widget.type,
                  image: widget.image,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Services',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: ModalWidget(
                                    idModal: widget.id,
                                  ),
                                );
                              },
                            );
                          },
                          text: 'send',
                          icon: Icon(
                            Icons.send_rounded,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 108,
                            height: 40,
                            color: Color(0xFFE2E2E2),
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: ModalCopyWidget(
                                    idModal: widget.id,
                                  ),
                                );
                              },
                            );
                          },
                          text: 'add',
                          icon: Icon(
                            Icons.add_rounded,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 108,
                            height: 40,
                            color: Color(0xFFE2E2E2),
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      'Transactions',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                  child: StreamBuilder<List<TransactionsRecord>>(
                    stream: queryTransactionsRecord(
                      queryBuilder: (transactionsRecord) =>
                          transactionsRecord.where('id', isEqualTo: widget.id),
                    ),
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
                      List<TransactionsRecord> listViewTransactionsRecordList =
                          snapshot.data;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewTransactionsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTransactionsRecord =
                              listViewTransactionsRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: TransactionWidget(
                              toComp: listViewTransactionsRecord.to,
                              valueComp: listViewTransactionsRecord.value,
                              actionComp: listViewTransactionsRecord.action,
                              dateComp: listViewTransactionsRecord.date,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
