import 'package:get/get.dart';

import '../../../features/accounts/domain/entities/account_balance_entity/account_balance_entity.dart';

///Sorts
extension RxSort on Rx<AppAccountBalanceEntitiesList> {
  get defaultSortFunction => {sortByFirstNameAZ, refresh()};
  get sortByFirstNameAZ => {value.sortByFirstNameAZ, refresh()};
  get sortByFirstNameZA => {value.sortByFirstNameZA, refresh()};
  get sortByBalanceInc => {value.sortByBalanceInc, refresh()};
  get sortByBalanceDec => {value.sortByBalanceDec, refresh()};
  get sortByRecordsCountInc => {value.sortByRecordsCountInc, refresh()};
  get sortByRecordsCountDec => {value.sortByRecordsCountDec, refresh()};
}

extension Sort on AppAccountBalanceEntitiesList {
  get defaultSortFunction => sortByFirstNameAZ;

  get sortByFirstNameAZ {
    List<AppAccountBalanceEntity> balances = List<AppAccountBalanceEntity>.empty(growable: true);
    balances.addAll(balancesList);
    balances.sort((a, b) => (a.contact!.firstName ?? a.contact!.lastName)!.compareTo(b.contact!.firstName ?? b.contact!.lastName!));
    balancesList = balances;
    return balancesList.toList();
  }

  get sortByFirstNameZA {
    List<AppAccountBalanceEntity> balances = List<AppAccountBalanceEntity>.empty(growable: true);
    balances.addAll(balancesList);
    balances.sort((a, b) => (b.contact!.firstName ?? b.contact!.lastName)!.compareTo(a.contact!.firstName ?? a.contact!.lastName!));
    balancesList = balances;
    return balancesList.toList();
  }

  get sortByBalanceInc {
    List<AppAccountBalanceEntity> balances = List<AppAccountBalanceEntity>.empty(growable: true);
    balances.addAll(balancesList);
    balances.sort((a, b) => a.balance!.compareTo(b.balance!));
    balancesList = balances;
    return balancesList.toList();
  }

  get sortByBalanceDec {
    List<AppAccountBalanceEntity> balances = List<AppAccountBalanceEntity>.empty(growable: true);
    balances.addAll(balancesList);
    balances.sort((a, b) => b.balance!.compareTo(a.balance!));
    balancesList = balances;
    return balancesList.toList();
  }

  get sortByRecordsCountInc {
    List<AppAccountBalanceEntity> balances = List<AppAccountBalanceEntity>.empty(growable: true);
    balances.addAll(balancesList);
    balances.sort((a, b) => a.count!.compareTo(b.count!));
    balancesList = balances;
    return balancesList.toList();
  }

  get sortByRecordsCountDec {
    List<AppAccountBalanceEntity> balances = List<AppAccountBalanceEntity>.empty(growable: true);
    balances.addAll(balancesList);
    balances.sort((a, b) => b.count!.compareTo(a.count!));
    balancesList = balances;
    return balancesList.toList();
  }
}

///Details
extension RxDetails on Rx<AppAccountBalanceEntitiesList> {
  List<AppAccountBalanceEntity> get balancesList => value.balancesList;
  int get count => value.count;
  bool get isEmpty => value.isEmpty;
}

extension Details on AppAccountBalanceEntitiesList {
  int get count => balancesList.length;
  bool get isEmpty => balancesList.isEmpty;
}
