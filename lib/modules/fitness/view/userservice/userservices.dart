import 'package:fitness/modules/fitness/view/usermodel/usermodell.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Userservices {
  Box<Usermodell>? _usermodel;
  ValueNotifier<List<Usermodell>> getnotifier = ValueNotifier<List<Usermodell>>(
    [],
  );
  Future<void> openbox() async {
    _usermodel = await Hive.openBox<Usermodell>("boxxy");
  }

  Future<void> close() async{
    await _usermodel!.close();
    getnotifier.value = _usermodel!.values.toList();
  }

  Future<void> addworkout(Usermodell workout) async {
    if (_usermodel == null) {
      await openbox();                                                        
    }
    await _usermodel?.add(workout);
    getnotifier.value = _usermodel!.values.toList();
  }

  Future<void> updateworkout(int index, Usermodell workout) async {
    if (_usermodel == null) {
      await openbox();
    }
    await _usermodel!.putAt(index, workout);
    getnotifier.value = _usermodel!.values.toList();
  }

  Future<void> getworkout() async {
    if (_usermodel == null) {
      await openbox();
    }
    getnotifier.value = _usermodel!.values.toList();
  }

  Future<void> deleteworkout(int index) async {
    await _usermodel!.deleteAt(index);
    getnotifier.value = _usermodel!.values.toList();
  }

  Future<int> getAllBack() async {
    return _usermodel!.values
        .where((e) => e.catagary == 'back')
        .toList()
        .length;
  }

  Future<int> getAllLeg() async { 
    return _usermodel!.values.where((e) => e.catagary == 'leg').toList().length;
  }

  Future<int> getAllChest() async {
    return _usermodel!.values
        .where((e) => e.catagary == 'chest')
        .toList()
        .length;
  }
}
