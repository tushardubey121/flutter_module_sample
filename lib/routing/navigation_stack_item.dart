sealed class NavigationStackItem {}

class DashboardScreenPage extends NavigationStackItem {}

class DashboardScreen2Page extends NavigationStackItem {}

class DashboardScreenLoan extends NavigationStackItem {
  DashboardScreenLoan({this.location = '/loan'});

  final String location;

  @override
  bool operator ==(Object other) =>
      other is DashboardScreenLoan && other.location == location;

  @override
  int get hashCode => location.hashCode;
}
