import 'package:flutter/material.dart';

typedef DateChangedCallback(DateTime time);

// ignore: must_be_immutable
class GenericDatePicker extends StatefulWidget {

  final DateTime firstDate;
  final DateTime lastDate;
  DateChangedCallback? onChange;
  DateTime? selectedTime;

  GenericDatePicker(this.firstDate, this.lastDate,{this.selectedTime, Key? key, this.onChange}) : super(key: key);

  @override
  _GenericDatePickerState createState() => _GenericDatePickerState();
}

class _GenericDatePickerState extends State<GenericDatePicker> {
  
  _changeDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedTime!,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      locale: Locale("es", "MX")
    );
    if (picked != null && picked != widget.selectedTime) {
      setState(() {
        if(widget.onChange != null)
          widget.onChange!(picked);
        widget.selectedTime = picked;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    widget.selectedTime ??= DateTime.now();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: () => _changeDate(context),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 12),
          child: Text(
            "${widget.selectedTime!.day} / ${widget.selectedTime!.month} / ${widget.selectedTime!.year}",
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        style: TextButton.styleFrom(
          primary: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))), 
          padding: EdgeInsets.zero
        ),
      )
    );
  }


}
