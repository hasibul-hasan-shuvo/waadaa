enum Environment {
  dev,
  staging,
  test,
  prod;

  @override
  toString() {
    switch (this) {
      case Environment.dev:
        return 'Dev';
      case Environment.staging:
        return 'Staging';
      case Environment.test:
        return 'Test';
      case Environment.prod:
        return 'Prod';
    }
  }
}
