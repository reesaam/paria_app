import '../data_entities/core_data_entities/app_version/app_version.dart';

AppVersionsList get appVersions => AppVersionsList(
        versionsList: List<AppVersion>.of([
      const AppVersion(version: '0.0.1', changes: [], released: false),
      const AppVersion(version: '0.0.2', changes: [], released: false),
      const AppVersion(version: '0.0.3', changes: [], released: false),
      const AppVersion(version: '0.0.4', changes: [], released: false),
      const AppVersion(version: '0.0.5', changes: [], released: true),
      const AppVersion(
          version: '0.0.6',
          changes: [
            'Major Refactor',
          ],
          released: false),
      const AppVersion(version: '0.0.7', changes: ['Some Refactor', 'Edit Contact Correction for Edit Records', 'AddEdit Contact and Record Validation Messages'], released: true),
      const AppVersion(
          version: '0.1.0',
          changes: [
            'Initialization with new structure',
          ],
          released: false),
      const AppVersion(
          version: '0.1.1',
          changes: [
            'Implementation Features on new structure',
          ],
          released: false),
      const AppVersion(
          version: '0.2.0',
          changes: [
            'Apply New Structure Changes on the App',
            'Implementation Major Changes in Structure',
          ],
          released: false),
      const AppVersion(
          version: '0.2.1',
          changes: [
            'Contacts Page Complete Implementation',
          ],
          released: false),
      const AppVersion(
          version: '0.2.2',
          changes: [
            'Accounts Page Complete Implementation',
          ],
          released: false),
      const AppVersion(
          version: '0.2.3',
          changes: [
            'Entities, Models and Mappers Implementation',
            'Data Backup and Restore Complete Implementation',
          ],
          released: false),
      const AppVersion(
          version: '0.2.4',
          changes: [
            'Major Changes in DateTime',
          ],
          released: false),
      const AppVersion(
          version: '0.2.5',
          changes: [
            'ContactsBalance Page Implementation',
            'About Page Implementation',
            'AppVersion Implementation',
            'Changes in AppData Model and Entities',
          ],
          released: false),
      const AppVersion(
          version: '0.2.6',
          changes: [
            'Release Prepared',
            'First release after refactoring and restructuring',
          ],
          released: true),
    ]));
