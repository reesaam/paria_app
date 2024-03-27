// Mocks generated by Mockito 5.4.4 from annotations
// in paria_app/test/unit_test/features/splash_screen/presentation/manager/splash_screen_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i8;

import 'package:flutter/material.dart' as _i2;
import 'package:get/get.dart' as _i4;
import 'package:get/get_state_manager/src/simple/list_notifier.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;
import 'package:paria_app/data/data_entities/core_data_entities/app_page_detail/app_page_detail.dart'
    as _i3;
import 'package:paria_app/features/splash_screen/presentation/manager/splash_screen_controller.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBuildContext_0 extends _i1.SmartFake implements _i2.BuildContext {
  _FakeBuildContext_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAppPageDetail_1 extends _i1.SmartFake implements _i3.AppPageDetail {
  _FakeAppPageDetail_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInternalFinalCallback_2<T> extends _i1.SmartFake
    implements _i4.InternalFinalCallback<T> {
  _FakeInternalFinalCallback_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SplashScreenController].
///
/// See the documentation for Mockito's code generation for more information.
class MockSplashScreenController extends _i1.Mock
    implements _i5.SplashScreenController {
  @override
  bool get internetStatus => (super.noSuchMethod(
        Invocation.getter(#internetStatus),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  set internetStatus(bool? _internetStatus) => super.noSuchMethod(
        Invocation.setter(
          #internetStatus,
          _internetStatus,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get availableUpdate => (super.noSuchMethod(
        Invocation.getter(#availableUpdate),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#availableUpdate),
        ),
        returnValueForMissingStub: _i6.dummyValue<String>(
          this,
          Invocation.getter(#availableUpdate),
        ),
      ) as String);

  @override
  set availableUpdate(String? _availableUpdate) => super.noSuchMethod(
        Invocation.setter(
          #availableUpdate,
          _availableUpdate,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get permissionsStatus => (super.noSuchMethod(
        Invocation.getter(#permissionsStatus),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#permissionsStatus),
        ),
        returnValueForMissingStub: _i6.dummyValue<String>(
          this,
          Invocation.getter(#permissionsStatus),
        ),
      ) as String);

  @override
  set permissionsStatus(String? _permissionsStatus) => super.noSuchMethod(
        Invocation.setter(
          #permissionsStatus,
          _permissionsStatus,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get logoSource => (super.noSuchMethod(
        Invocation.getter(#logoSource),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#logoSource),
        ),
        returnValueForMissingStub: _i6.dummyValue<String>(
          this,
          Invocation.getter(#logoSource),
        ),
      ) as String);

  @override
  set logoSource(String? _logoSource) => super.noSuchMethod(
        Invocation.setter(
          #logoSource,
          _logoSource,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get appName => (super.noSuchMethod(
        Invocation.getter(#appName),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#appName),
        ),
        returnValueForMissingStub: _i6.dummyValue<String>(
          this,
          Invocation.getter(#appName),
        ),
      ) as String);

  @override
  set appName(String? _appName) => super.noSuchMethod(
        Invocation.setter(
          #appName,
          _appName,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get appVersion => (super.noSuchMethod(
        Invocation.getter(#appVersion),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#appVersion),
        ),
        returnValueForMissingStub: _i6.dummyValue<String>(
          this,
          Invocation.getter(#appVersion),
        ),
      ) as String);

  @override
  set appVersion(String? _appVersion) => super.noSuchMethod(
        Invocation.setter(
          #appVersion,
          _appVersion,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.BuildContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeBuildContext_0(
          this,
          Invocation.getter(#context),
        ),
        returnValueForMissingStub: _FakeBuildContext_0(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.BuildContext);

  @override
  set context(_i2.BuildContext? _context) => super.noSuchMethod(
        Invocation.setter(
          #context,
          _context,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.AppPageDetail get pageDetail => (super.noSuchMethod(
        Invocation.getter(#pageDetail),
        returnValue: _FakeAppPageDetail_1(
          this,
          Invocation.getter(#pageDetail),
        ),
        returnValueForMissingStub: _FakeAppPageDetail_1(
          this,
          Invocation.getter(#pageDetail),
        ),
      ) as _i3.AppPageDetail);

  @override
  set pageDetail(_i3.AppPageDetail? _pageDetail) => super.noSuchMethod(
        Invocation.setter(
          #pageDetail,
          _pageDetail,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.InternalFinalCallback<void> get onStart => (super.noSuchMethod(
        Invocation.getter(#onStart),
        returnValue: _FakeInternalFinalCallback_2<void>(
          this,
          Invocation.getter(#onStart),
        ),
        returnValueForMissingStub: _FakeInternalFinalCallback_2<void>(
          this,
          Invocation.getter(#onStart),
        ),
      ) as _i4.InternalFinalCallback<void>);

  @override
  _i4.InternalFinalCallback<void> get onDelete => (super.noSuchMethod(
        Invocation.getter(#onDelete),
        returnValue: _FakeInternalFinalCallback_2<void>(
          this,
          Invocation.getter(#onDelete),
        ),
        returnValueForMissingStub: _FakeInternalFinalCallback_2<void>(
          this,
          Invocation.getter(#onDelete),
        ),
      ) as _i4.InternalFinalCallback<void>);

  @override
  bool get initialized => (super.noSuchMethod(
        Invocation.getter(#initialized),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  int get listeners => (super.noSuchMethod(
        Invocation.getter(#listeners),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  void dataInit() => super.noSuchMethod(
        Invocation.method(
          #dataInit,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void pageInit() => super.noSuchMethod(
        Invocation.method(
          #pageInit,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onReadyFunction() => super.noSuchMethod(
        Invocation.method(
          #onReadyFunction,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToNextPage() => super.noSuchMethod(
        Invocation.method(
          #goToNextPage,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onInitFunction() => super.noSuchMethod(
        Invocation.method(
          #onInitFunction,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onCloseFunction() => super.noSuchMethod(
        Invocation.method(
          #onCloseFunction,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onInit() => super.noSuchMethod(
        Invocation.method(
          #onInit,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onReady() => super.noSuchMethod(
        Invocation.method(
          #onReady,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onClose() => super.noSuchMethod(
        Invocation.method(
          #onClose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void update([
    List<Object>? ids,
    bool? condition = true,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #update,
          [
            ids,
            condition,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void $configureLifeCycle() => super.noSuchMethod(
        Invocation.method(
          #$configureLifeCycle,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Disposer addListener(_i7.GetStateUpdate? listener) => (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValue: () {},
        returnValueForMissingStub: () {},
      ) as _i7.Disposer);

  @override
  void removeListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refresh() => super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refreshGroup(Object? id) => super.noSuchMethod(
        Invocation.method(
          #refreshGroup,
          [id],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyChildrens() => super.noSuchMethod(
        Invocation.method(
          #notifyChildrens,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListenerId(
    Object? id,
    _i8.VoidCallback? listener,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #removeListenerId,
          [
            id,
            listener,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Disposer addListenerId(
    Object? key,
    _i7.GetStateUpdate? listener,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListenerId,
          [
            key,
            listener,
          ],
        ),
        returnValue: () {},
        returnValueForMissingStub: () {},
      ) as _i7.Disposer);

  @override
  void disposeId(Object? id) => super.noSuchMethod(
        Invocation.method(
          #disposeId,
          [id],
        ),
        returnValueForMissingStub: null,
      );
}
