// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

AppBar Custom_AppBar(context, TabController? _tabController, List<String> tabs) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.onBackground,
    title: Center(
      child: SizedBox(
        height: 50,
        width: 250,
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: Color.fromARGB(255, 223, 185, 16),
            borderRadius: BorderRadius.circular(10),
          ),
          labelColor: Theme.of(context).colorScheme.surface,
          // unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
          dividerColor: Colors.red,
          tabs: tabs
              .map((tabText) => SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        tabText,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    ),
  );
}
