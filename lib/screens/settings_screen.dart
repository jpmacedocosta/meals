import 'package:flutter/material.dart';

import '../components/main_drawer.dart';

import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }
  Widget _createSwitch(
      String title,
      String subtitle,
      bool value,
      Function(bool) onChanged,
      ) {
    return SwitchListTile.adaptive(
      activeColor: Theme.of(context).colorScheme.secondary,
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) => {
        onChanged(value),
        widget.onSettingsChanged(settings),
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Gluten Free',
                  'Show just gluten-free meals',
                  settings.isGlutenFree,
                      (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  'Lactose free',
                  'Show just lactose-free meals',
                  settings.isLactoseFree,
                      (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegan',
                  'Show just vegan meals',
                  settings.isVegan,
                      (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  'Vegetarian',
                  'Show just vegetarian meals',
                  settings.isVegetarian,
                      (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
