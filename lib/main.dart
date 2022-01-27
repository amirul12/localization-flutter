import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'l10n/l10n.dart';
import 'lcoal_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: MaterialApp(

        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        // supportedLocales: AppLocalizations.supportedLocales,

        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.all,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: "test"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    _title(String val) {
      switch (val) {
        case 'en':
          return Text(
            'English',
            style: TextStyle(fontSize: 16.0),
          );
        case 'id':
          return Text(
            'Indonesia',
            style: TextStyle(fontSize: 16.0),
          );

        case 'es':
          return Text(
            'Spanish',
            style: TextStyle(fontSize: 16.0),
          );

        case 'it':
          return Text(
            'Italian',
            style: TextStyle(fontSize: 16.0),
          );

        default:
          return Text(
            'English',
            style: TextStyle(fontSize: 16.0),
          );
      }
    }

    Locale activeLocale = Localizations.localeOf(context);
// If our active locale is fr_CA
    debugPrint(activeLocale.languageCode); // => fr
    debugPrint(activeLocale.countryCode);
    var t = AppLocalizations.of(context);
    debugPrint(t.appTitle);

    // => CA

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).openSettings,
            ),
            Text(
              '${t.appTitle}',
              style: Theme.of(context).textTheme.headline4,
            ),
            DropdownButton(
                value: "lang",
                // onChanged: (Locale? val) {
                //   provider.setLocale(val!);
                // },
                items: L10n.all
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: _title(e.languageCode),
                ))
                    .toList())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
