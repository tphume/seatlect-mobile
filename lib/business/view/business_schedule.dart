import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservation_repository/reservation_repository.dart';

class BusinessSchedule extends StatefulWidget {
  final DateTime start;
  final DateTime end;

  const BusinessSchedule({Key key, this.start, this.end}) : super(key: key);

  @override
  _BusinessScheduleState createState() => _BusinessScheduleState();
}

class _BusinessScheduleState extends State<BusinessSchedule> {
  bool loading = true;
  List<Reservation> reservation = [];

  @override
  void didChangeDependencies() {
    final resRepo = context.read<ReservationRepo>();

    () async {
      try {
        final r = await resRepo.ListReservation(widget.start, widget.end);

        setState(() {
          loading = false;
          reservation = r;
        });
      } catch (e) {
        // Display error here or something
      }
    }();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Schedule',
              style: GoogleFonts.dmSans(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: loading
            ? Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Container(
                  height: 200,
                  child: CircularProgressIndicator(),
                ),
              )
            : Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                child: Column(
                  children: [
                    Expanded(child: _buildResult()),
                  ],
                ),
              ));
  }

  Widget _buildResult() {
    return ListView(children: []);
  }
}
