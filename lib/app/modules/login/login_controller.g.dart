// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(i<CustomerRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$isApiCallProcessAtom =
      Atom(name: '_LoginControllerBase.isApiCallProcess');

  @override
  bool get isApiCallProcess {
    _$isApiCallProcessAtom.reportRead();
    return super.isApiCallProcess;
  }

  @override
  set isApiCallProcess(bool value) {
    _$isApiCallProcessAtom.reportWrite(value, super.isApiCallProcess, () {
      super.isApiCallProcess = value;
    });
  }

  @override
  String toString() {
    return '''
isApiCallProcess: ${isApiCallProcess}
    ''';
  }
}
