import 'package:flutter/material.dart';
import 'package:travel_app/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const screenRout = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false;

  @override
  void initState() {
    // TODO: implement initState
    _Summer = widget.currentFilters['summer'] as bool;
    _Winter = widget.currentFilters['winter'] as bool;
    _Family = widget.currentFilters['family'] as bool;
    super.initState();
  }

  Widget SwichList(
      String titles, String subTitle, var currentValue, dynamic updetValue) {
    return SwitchListTile(
      title: Text(titles),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updetValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('التصفية')),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'summer': _Summer,
                'winter': _Winter,
                'family': _Family,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: DrawerTap(),
      body: Column(
        children: [
          SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                SwichList(
                  'الرحلات الصيفية',
                  'إظهار الرحلات الصيفية',
                  _Summer,
                  (newValue) {
                    setState(() {
                      _Summer = newValue;
                    });
                  },
                ),
                SwichList(
                  'الرحلات الشتوية',
                  'إظهار الرحلات الشتوية',
                  _Winter,
                  (newValue) {
                    setState(() {
                      _Winter = newValue;
                    });
                  },
                ),
                SwichList(
                  'الرحلات العائلية',
                  'إظهار الرحلات العائلية فقط',
                  _Family,
                  (newValue) {
                    setState(() {
                      _Family = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
