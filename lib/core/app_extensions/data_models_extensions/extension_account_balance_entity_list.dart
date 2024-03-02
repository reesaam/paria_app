import 'package:get/get.dart';

import '../../../features/accounts/domain/entities/account_balance_entity/account_balance_entity.dart';

///Sorts
extension RxSort on Rx<AppAccountBalanceEntitiesList> {
  get defaultSortFunction => {sortByFirstName, refresh()};
  get sortByFirstName => {value.sortByFirstName, refresh()};
  get sortByBalance => {value.sortByBalance, refresh()};
  get sortByRecordsCount => {value.sortByRecordsCount, refresh()};
}

extension Sort on AppAccountBalanceEntitiesList {
  get defaultSortFunction => sortByFirstName;

  get sortByFirstName {
    List<AppAccountBalanceEntity> balances =
        List<AppAccountBalanceEntity>.empty(growable: true);
    balances.addAll(balancesList);
    balances.sort((a, b) => (a.contact!.firstName ?? a.contact!.lastName)!
        .compareTo(b.contact!.firstName ?? b.contact!.lastName!));
    balancesList = balances;
    return balancesList.toList();
  }

  get sortByBalance {
    List<AppAccountBalanceEntity> balances =
        List<AppAccountBalanceEntity>.empty(growable: true);
    balances.addAll(balancesList);
    balances.sort((a, b) => b.balance!.compareTo(a.balance!));
    balancesList = balances;
    return balancesList.toList();
  }

   get sortByRecordsCount {
    List<AppAccountBalanceEntity> balances =
    List<AppAccountBalanceEntity>.empty(growable: true);
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
