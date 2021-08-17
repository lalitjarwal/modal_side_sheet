# Side Sheet

A package to use Material side sheet into your Flutter project.
Learn more about side sheet at [Material.io](https://material.io/components/sheets-side)

## Getting Started

This package comes with two types of side sheets, `Standard side sheet` and `Modal side sheet`.

## Modal Side Sheet

Modal side sheets present content while blocking interaction with the rest of the screen.
This side sheet generally used in mobile devices as per recommended by Material Design by Google.
See also : [Modal Side Sheet](https://material.io/components/sheets-side#modal-side-sheet)

![Modal Side Sheet](https://lh3.googleusercontent.com/c6-TFu796SV5GzwB0VCeeTQQ4jaaKsCwfJREZPX3tCDHS56cjFjwazWks7TTRnFNyfxNl7RhBtOTx0Hxw-GnG9nnWFGq-e0vqhRSC0M=w1064-v0)

You can use it by calling `showModalSideSheet()` function into your Flutter project.

```dart
ElevatedButton(
    onPressed: () {
        showModalSideSheet(
            context: context,
            ignoreAppBar: false,
            body: ListView.builder(
                itemBuilder: (context, index) {
                    return ListTile(
                        leading: Icon(Icons.face),
                        title: Text("I am on $index index"),
                        trailing: Icon(Icons.safety_divider),
                    );
                },
            ));
        },
    child: Text("Show Modal Side Sheet")),
```

## Standard Side Sheet

Standard side sheets co-exist with the screen’s primary UI region, which allows viewing and interaction with both surfaces. They are used only on tablet and desktop.
See also: [Standard Side Sheet](https://material.io/components/sheets-side#standard-side-sheet)

![Standard Side Sheet](https://lh3.googleusercontent.com/EKjdlNMWlftW4M9dFBi1HsSTvS1rWMmFKb3UaXbsv3PAmHEeCdO00HPTOBcsIXc7zZ_DEPYr_Jk9PkN9TqUeTEXWTDzbNlx-su4kLSY=w1064-v0)

This side sheet can be used with `BodyWithSideSheet` widget.
Just place this widget into your `Scaffold`'s body property.

```dart
@override
Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(title:Text("Standard Side Sheet Demo")),
        body:BodyWithSideSheet(
            body:Container(
                child:Text("My App Body"),
            ),
            sheetBody:Container(
                child:Text("My Sheet Body"),
            ),
            show:true
        ),
    );
}
```

## Contributing

This is fully open source project so you are welcome to sontribute to any features or bug-fixing.

Don't forgot to star and fork the repository and make your first pull request.

## License

Project released under `MIT License`.
