sealed class SettingEvents {
  const SettingEvents();
}

final class FilterScreensByText extends SettingEvents {
  final String filterText;

  const FilterScreensByText(this.filterText);
}
