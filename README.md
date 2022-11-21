# How to get the selected dates using the selection changed callback in the Flutter Calendar?

This example demonstrates how to get the selected dates using the selection changed callback in the Flutter Calendar.

## Obtaining selected dates

Using the [onSelectionChanged](https://pub.dev/documentation/syncfusion_flutter_calendar/latest/calendar/SfCalendar/onSelectionChanged.html) callback, you can get the selected details from the Flutter Event Calendar and display them in the Alert dialog window. When the controller's selected date changes, the onSelectionChanged callback is triggered.

```

void selectionChanged(CalendarSelectionDetails details) {
    if (_controller.view == CalendarView.month ||
        _controller.view == CalendarView.timelineMonth) {
      _text = DateFormat('dd, MMMM yyyy').format(details.date!).toString();
    } else {
      _text =
          DateFormat('dd, MMMM yyyy hh:mm a').format(details.date!).toString();
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
                child: const Text("Details shown by selection changed callback")),
            content:
            Container(child: Text("You have selected " + '$_text')),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('close'))
            ],
          );
        });
  }

```



## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v1.22+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘create a flutter maps widget in 10 minutes’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview),
 [Flutter documentation](https://flutter.dev/docs/get-started/install).