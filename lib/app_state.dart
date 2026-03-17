import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_counter')) {
        try {
          final serializedData = prefs.getString('ff_counter') ?? '{}';
          _counter =
              ItemCountStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _cartProduct = prefs
              .getStringList('ff_cartProduct')
              ?.map((path) => path.ref)
              .toList() ??
          _cartProduct;
    });
    _safeInit(() {
      _cartSummary =
          prefs.getStringList('ff_cartSummary')?.map(double.parse).toList() ??
              _cartSummary;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _selectedPetName = '';
  String get selectedPetName => _selectedPetName;
  set selectedPetName(String value) {
    _selectedPetName = value;
  }

  String _selectedVaccineName = '';
  String get selectedVaccineName => _selectedVaccineName;
  set selectedVaccineName(String value) {
    _selectedVaccineName = value;
  }

  DateTime? _selecteddate = DateTime.fromMillisecondsSinceEpoch(1761226620000);
  DateTime? get selecteddate => _selecteddate;
  set selecteddate(DateTime? value) {
    _selecteddate = value;
  }

  String _selectedClock = '';
  String get selectedClock => _selectedClock;
  set selectedClock(String value) {
    _selectedClock = value;
  }

  ItemCountStruct _counter = ItemCountStruct();
  ItemCountStruct get counter => _counter;
  set counter(ItemCountStruct value) {
    _counter = value;
    prefs.setString('ff_counter', value.serialize());
  }

  void updateCounterStruct(Function(ItemCountStruct) updateFn) {
    updateFn(_counter);
    prefs.setString('ff_counter', _counter.serialize());
  }

  List<DocumentReference> _cartProduct = [];
  List<DocumentReference> get cartProduct => _cartProduct;
  set cartProduct(List<DocumentReference> value) {
    _cartProduct = value;
    prefs.setStringList('ff_cartProduct', value.map((x) => x.path).toList());
  }

  void addToCartProduct(DocumentReference value) {
    cartProduct.add(value);
    prefs.setStringList(
        'ff_cartProduct', _cartProduct.map((x) => x.path).toList());
  }

  void removeFromCartProduct(DocumentReference value) {
    cartProduct.remove(value);
    prefs.setStringList(
        'ff_cartProduct', _cartProduct.map((x) => x.path).toList());
  }

  void removeAtIndexFromCartProduct(int index) {
    cartProduct.removeAt(index);
    prefs.setStringList(
        'ff_cartProduct', _cartProduct.map((x) => x.path).toList());
  }

  void updateCartProductAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    cartProduct[index] = updateFn(_cartProduct[index]);
    prefs.setStringList(
        'ff_cartProduct', _cartProduct.map((x) => x.path).toList());
  }

  void insertAtIndexInCartProduct(int index, DocumentReference value) {
    cartProduct.insert(index, value);
    prefs.setStringList(
        'ff_cartProduct', _cartProduct.map((x) => x.path).toList());
  }

  List<double> _cartSummary = [];
  List<double> get cartSummary => _cartSummary;
  set cartSummary(List<double> value) {
    _cartSummary = value;
    prefs.setStringList(
        'ff_cartSummary', value.map((x) => x.toString()).toList());
  }

  void addToCartSummary(double value) {
    cartSummary.add(value);
    prefs.setStringList(
        'ff_cartSummary', _cartSummary.map((x) => x.toString()).toList());
  }

  void removeFromCartSummary(double value) {
    cartSummary.remove(value);
    prefs.setStringList(
        'ff_cartSummary', _cartSummary.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCartSummary(int index) {
    cartSummary.removeAt(index);
    prefs.setStringList(
        'ff_cartSummary', _cartSummary.map((x) => x.toString()).toList());
  }

  void updateCartSummaryAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    cartSummary[index] = updateFn(_cartSummary[index]);
    prefs.setStringList(
        'ff_cartSummary', _cartSummary.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCartSummary(int index, double value) {
    cartSummary.insert(index, value);
    prefs.setStringList(
        'ff_cartSummary', _cartSummary.map((x) => x.toString()).toList());
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool value) {
    _searchActive = value;
  }

  String _selectedImage = '';
  String get selectedImage => _selectedImage;
  set selectedImage(String value) {
    _selectedImage = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
