import 'dart:io';

void main() async {
  print("Enter the feature name:");
  String? featureName = stdin.readLineSync()?.trim();

  if (featureName == null || featureName.isEmpty) {
    print("Feature name cannot be empty.");
    return;
  }

  final featurePath = 'lib/app/modules/$featureName';
  final viewPath = '$featurePath/view';
  final viewModelPath = '$featurePath/viewmodel';
  final routerPath = 'lib/app/router/router.dart';
  final routesPath = 'lib/app/router/routes.dart';
  final navigatorPath = 'lib/app/router/navigator.dart';

  _createDirectories(viewPath, viewModelPath);
  _createFeatureFiles(featureName, viewPath, viewModelPath);
  _updateRoutesFile(featureName, routesPath);
  _updateRouterFile(featureName, routerPath);
  _updateNavigatorFile(featureName, navigatorPath);

  print("✅ Feature '$featureName' created successfully!");

  await _runBuildRunner();
}

void _createDirectories(String viewPath, String viewModelPath) {
  Directory(viewPath).createSync(recursive: true);
  Directory(viewModelPath).createSync(recursive: true);
}

void _createFeatureFiles(
    String featureName, String viewPath, String viewModelPath) {
  createViewFile(featureName, viewPath);
  createViewModelFile(featureName, viewModelPath);
  createStateFile(featureName, viewModelPath);
}

void createViewFile(String featureName, String viewPath) {
  final viewFile = File('$viewPath/${featureName}_page.dart');
  viewFile.writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/modules/$featureName/viewmodel/${featureName}_state.dart';
import 'package:waadaa/app/modules/$featureName/viewmodel/${featureName}_view_model.dart';

class ${_snakeCaseToPascalCase(featureName)}Page extends BasePage<${_snakeCaseToPascalCase(featureName)}ViewModel, ${_snakeCaseToPascalCase(featureName)}State> {
  ${_snakeCaseToPascalCase(featureName)}Page({super.key});

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text("This is $featureName page"),
    );
  }
}
''');
}

void createViewModelFile(String featureName, String viewModelPath) {
  final viewModelFile = File('$viewModelPath/${featureName}_view_model.dart');
  viewModelFile.writeAsStringSync('''
import 'package:di/di.dart';
import 'package:waadaa/app/base/base_view_model.dart';
import 'package:waadaa/app/modules/$featureName/viewmodel/${featureName}_state.dart';

@injectable
class ${_snakeCaseToPascalCase(featureName)}ViewModel extends BaseViewModel<${_snakeCaseToPascalCase(featureName)}State> {
  ${_snakeCaseToPascalCase(featureName)}ViewModel() : super(${_snakeCaseToPascalCase(featureName)}State.initial());
}
''');
}

void createStateFile(String featureName, String viewModelPath) {
  final stateFile = File('$viewModelPath/${featureName}_state.dart');
  stateFile.writeAsStringSync('''
import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_status.dart';

class ${_snakeCaseToPascalCase(featureName)}State extends BaseState {

  ${_snakeCaseToPascalCase(featureName)}State({
    super.status,
  });

  ${_snakeCaseToPascalCase(featureName)}State.initial();

  @override
  ${_snakeCaseToPascalCase(featureName)}State copyWith({
    BaseStatus? status,
  }) {
    return ${_snakeCaseToPascalCase(featureName)}State(
      status: status ?? this.status,
    );
  }
}
''');
}

void _updateRoutesFile(String featureName, String routesPath) {
  final routesFile = File(routesPath);
  if (!routesFile.existsSync()) {
    print("routes.dart not found. Please ensure it exists.");
    return;
  }

  String routesContent = routesFile.readAsStringSync();

  // Ensure no duplicate constants for AppRoutes
  if (!routesContent
      .contains("static const String ${_snakeCaseToCamelCase(featureName)}")) {
    routesContent = _updateAppRoutes(featureName, routesContent);
    routesContent = _updatePaths(featureName, routesContent);

    routesFile.writeAsStringSync(routesContent);
    print("Updated routes.dart with $featureName route.");
  } else {
    print("routes.dart already contains $featureName route.");
  }
}

String _updateAppRoutes(String featureName, String routesContent) {
  final appRoutesPattern = RegExp(r"class AppRoutes \{([\s\S]*?)\}");
  final appRoutesMatch = appRoutesPattern.firstMatch(routesContent);

  if (appRoutesMatch != null) {
    final newRoute =
        "  static const String ${_snakeCaseToCamelCase(featureName)} = '$featureName';";
    final appRoutesBody = appRoutesMatch.group(1) ?? '';
    return routesContent.replaceFirst(appRoutesMatch.group(0)!,
        "class AppRoutes {$appRoutesBody$newRoute\n}");
  }

  return routesContent;
}

String _updatePaths(String featureName, String routesContent) {
  final pathsPattern = RegExp(r"class _Paths \{([\s\S]*?)\}");
  final pathsMatch = pathsPattern.firstMatch(routesContent);

  if (pathsMatch != null) {
    final newPathsBody =
        "  static const String ${_snakeCaseToCamelCase(featureName)} = '/$featureName';";
    final pathsBody = pathsMatch.group(1) ?? '';
    return routesContent.replaceFirst(
        pathsMatch.group(0)!, "class _Paths {$pathsBody$newPathsBody\n}");
  }

  return routesContent;
}

void _updateRouterFile(String featureName, String routerPath) {
  final routerFile = File(routerPath);
  if (!routerFile.existsSync()) {
    print("router.dart not found. Please ensure it exists.");
    return;
  }

  String routerContent = routerFile.readAsStringSync();

  routerContent = _addImportForFeature(featureName, routerContent);
  routerContent = _addRouteToRouter(featureName, routerContent);

  routerFile.writeAsStringSync(routerContent);
}

String _addImportForFeature(String featureName, String routerContent) {
  final importStatement =
      "import 'package:waadaa/app/modules/$featureName/view/${featureName}_page.dart';";

  if (!routerContent.contains(importStatement)) {
    routerContent = "$importStatement\n$routerContent";
    print("Added import for ${featureName}_page.dart in router.dart.");
  }
  return routerContent;
}

String _addRouteToRouter(String featureName, String routerContent) {
  final newRoute = '''
    AppRoute(
      path: _Paths.${_snakeCaseToCamelCase(featureName)},
      name: AppRoutes.${_snakeCaseToCamelCase(featureName)},
      buildPage: (context, state) => ${_snakeCaseToPascalCase(featureName)}Page(),
    ),
''';

  if (!routerContent.contains(newRoute)) {
    final routesListPattern = RegExp(
        r"static final List<GoRoute> _routes = \[(.*?)\];",
        multiLine: true,
        dotAll: true);
    final match = routesListPattern.firstMatch(routerContent);

    if (match != null) {
      final closingBracketIndex = routerContent.lastIndexOf(']');
      if (closingBracketIndex != -1) {
        final beforeClosingBracket =
            routerContent.substring(0, closingBracketIndex).trim();
        final afterClosingBracket =
            routerContent.substring(closingBracketIndex);

        routerContent =
            '$beforeClosingBracket\n$newRoute  $afterClosingBracket';
        print("Added route for $featureName to router.dart.");
      }
    } else {
      print(
          "Could not find _routes list in router.dart. Please ensure it exists.");
    }
  }
  return routerContent;
}

void _updateNavigatorFile(String featureName, String navigatorPath) {
  final navigatorFile = File(navigatorPath);

  if (!navigatorFile.existsSync()) {
    print("navigator.dart not found. Please ensure it exists.");
    return;
  }

  String navigatorContent = navigatorFile.readAsStringSync();

  // Generate the function name and function content
  final functionName = "navigateTo${_snakeCaseToPascalCase(featureName)}";
  final functionContent = '''
  Future $functionName() {
    return _router.pushNamed(AppRoutes.${_snakeCaseToCamelCase(featureName)});
  }
''';

  // Check if the function already exists
  if (navigatorContent.contains("Future $functionName()")) {
    print(
        "Navigation function for $featureName already exists in navigator.dart.");
    return;
  }

  // Add the function before the last closing brace '}'
  final closingBraceIndex = navigatorContent.lastIndexOf('}');
  if (closingBraceIndex != -1) {
    navigatorContent =
        '${navigatorContent.substring(0, closingBraceIndex).trimRight()}\n\n$functionContent${navigatorContent.substring(closingBraceIndex)}';
    print("Added navigation function for $featureName in navigator.dart.");
  } else {
    print(
        "Could not find closing brace in navigator.dart. Please ensure the file is valid.");
  }

  // Write the updated content back to the file
  navigatorFile.writeAsStringSync(navigatorContent);
}

Future<void> _runBuildRunner() async {
  print("Running build_runner...");
  final result = await Process.run('fvm',
      ['dart', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);
  print(result.stdout);
  print(result.stderr);
}

String _snakeCaseToPascalCase(String input) {
  return input.split('_').map((e) => _capitalize(e)).join();
}

String _snakeCaseToCamelCase(String input) {
  List<String> parts = input.split('_');
  return parts.first + parts.skip(1).map((e) => _capitalize(e)).join();
}

String _capitalize(String input) {
  return input[0].toUpperCase() + input.substring(1);
}
