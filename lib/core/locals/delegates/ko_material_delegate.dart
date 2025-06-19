import 'package:flutter/material.dart';

class MaterialLocalizationJaDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return locale.countryCode == "KR" && locale.languageCode == "ko";
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return MaterialLocalizationJa();
  }

  @override
  bool shouldReload(dynamic old) {
    return false;
  }
}

class MaterialLocalizationJa extends MaterialLocalizations {
  @override
  String aboutListTileTitle(String applicationName) {
    return "applicationName";
  }

  @override
  String get alertDialogLabel => "Label";

  @override
  String get anteMeridiemAbbreviation => "Abbreviation";

  @override
  String get backButtonTooltip => "backButtonTooltip";

  @override
  String get bottomSheetLabel => "Bottom Sheet";

  @override
  String get calendarModeButtonLabel => "Label";

  @override
  String get cancelButtonLabel => "Cancel";

  @override
  String get closeButtonLabel => "Close";

  @override
  String get closeButtonTooltip => "";

  @override
  String get continueButtonLabel => "";

  @override
  String get copyButtonLabel => "";

  @override
  String get currentDateLabel => "";

  @override
  String get cutButtonLabel => "";

  @override
  String get dateHelpText => "";

  @override
  String get dateInputLabel => "";

  @override
  String get dateOutOfRangeLabel => "";

  @override
  String get datePickerHelpText => "";

  @override
  String dateRangeEndDateSemanticLabel(String formattedDate) {
    return "dateRangeEndDateSemanticLabel";
  }

  @override
  String get dateRangeEndLabel => "";

  @override
  String get dateRangePickerHelpText => "";

  @override
  String dateRangeStartDateSemanticLabel(String formattedDate) {
    return "";
  }

  @override
  String get dateRangeStartLabel => "";

  @override
  String get dateSeparator => "";

  @override
  String get deleteButtonTooltip => "";

  @override
  String get dialModeButtonLabel => "";

  @override
  String get dialogLabel => "";

  @override
  String get drawerLabel => "";

  @override
  int get firstDayOfWeekIndex => 1;

  @override
  String get firstPageTooltip => "";

  @override
  String formatCompactDate(DateTime date) {
    return "";
  }

  @override
  String formatDecimal(int number) {
    return "";
  }

  @override
  String formatFullDate(DateTime date) {
    return "";
  }

  @override
  String formatHour(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    return "";
  }

  @override
  String formatMediumDate(DateTime date) {
    return "";
  }

  @override
  String formatMinute(TimeOfDay timeOfDay) {
    return "";
  }

  @override
  String formatMonthYear(DateTime date) {
    return "";
  }

  @override
  String formatShortDate(DateTime date) {
    return "";
  }

  @override
  String formatShortMonthDay(DateTime date) {
    return "";
  }

  @override
  String formatTimeOfDay(TimeOfDay timeOfDay,
      {bool alwaysUse24HourFormat = false}) {
    return "";
  }

  @override
  String formatYear(DateTime date) {
    return "";
  }

  @override
  String get hideAccountsLabel => "";

  @override
  String get inputDateModeButtonLabel => "";

  @override
  String get inputTimeModeButtonLabel => "";

  @override
  String get invalidDateFormatLabel => "";

  @override
  String get invalidDateRangeLabel => "";

  @override
  String get invalidTimeLabel => "";

  @override
  String get keyboardKeyAlt => "";

  @override
  String get keyboardKeyAltGraph => "";

  @override
  String get keyboardKeyBackspace => "";

  @override
  String get keyboardKeyCapsLock => "";

  @override
  String get keyboardKeyChannelDown => "";

  @override
  String get keyboardKeyChannelUp => "";

  @override
  String get keyboardKeyControl => "";

  @override
  String get keyboardKeyDelete => "";

  @override
  String get keyboardKeyEject => "";

  @override
  String get keyboardKeyEnd => "";

  @override
  String get keyboardKeyEscape => "";

  @override
  String get keyboardKeyFn => "";

  @override
  String get keyboardKeyHome => "";

  @override
  String get keyboardKeyInsert => "";

  @override
  String get keyboardKeyMeta => "";

  @override
  String get keyboardKeyMetaMacOs => "";

  @override
  String get keyboardKeyMetaWindows => "";

  @override
  String get keyboardKeyNumLock => "";

  @override
  String get keyboardKeyNumpad0 => "";

  @override
  String get keyboardKeyNumpad1 => "";

  @override
  String get keyboardKeyNumpad2 => "";

  @override
  String get keyboardKeyNumpad3 => "";

  @override
  String get keyboardKeyNumpad4 => "";

  @override
  String get keyboardKeyNumpad5 => "";

  @override
  String get keyboardKeyNumpad6 => "";

  @override
  String get keyboardKeyNumpad7 => "";

  @override
  String get keyboardKeyNumpad8 => "";

  @override
  String get keyboardKeyNumpad9 => "";

  @override
  String get keyboardKeyNumpadAdd => "";

  @override
  String get keyboardKeyNumpadComma => "";

  @override
  String get keyboardKeyNumpadDecimal => "";

  @override
  String get keyboardKeyNumpadDivide => "";

  @override
  String get keyboardKeyNumpadEnter => "";

  @override
  String get keyboardKeyNumpadEqual => "";

  @override
  String get keyboardKeyNumpadMultiply => "";

  @override
  String get keyboardKeyNumpadParenLeft => "";

  @override
  String get keyboardKeyNumpadParenRight => "";

  @override
  String get keyboardKeyNumpadSubtract => "";

  @override
  String get keyboardKeyPageDown => "";

  @override
  String get keyboardKeyPageUp => "";

  @override
  String get keyboardKeyPower => "";

  @override
  String get keyboardKeyPowerOff => "";

  @override
  String get keyboardKeyPrintScreen => "";

  @override
  String get keyboardKeyScrollLock => "";

  @override
  String get keyboardKeySelect => "";

  @override
  String get keyboardKeyShift => "";

  @override
  String get keyboardKeySpace => "";

  @override
  String get lastPageTooltip => "";

  @override
  String licensesPackageDetailText(int licenseCount) {
    return "";
  }

  @override
  String get licensesPageTitle => "";

  @override
  String get lookUpButtonLabel => "";

  @override
  String get menuBarMenuLabel => "";

  @override
  String get menuDismissLabel => "";

  @override
  String get modalBarrierDismissLabel => "";

  @override
  String get moreButtonTooltip => "";

  @override
  List<String> get narrowWeekdays => [""];

  @override
  String get nextMonthTooltip => "";

  @override
  String get nextPageTooltip => "";

  @override
  String get okButtonLabel => "";

  @override
  String get openAppDrawerTooltip => "openAppDrawerTooltip";

  @override
  String pageRowsInfoTitle(
      int firstRow, int lastRow, int rowCount, bool rowCountIsApproximate) {
    return "pageRowsInfoTitle";
  }

  @override
  DateTime? parseCompactDate(String? inputString) {
    return null;
  }

  @override
  String get pasteButtonLabel => "pasteButtonLabel";

  @override
  String get popupMenuLabel => "popup";

  @override
  String get postMeridiemAbbreviation => "postMeridiemAbbreviation";

  @override
  String get previousMonthTooltip => "previousMonth";

  @override
  String get previousPageTooltip => "previous";

  @override
  String get refreshIndicatorSemanticLabel => "refresh";

  @override
  String remainingTextFieldCharacterCount(int remaining) {
    return "remainingTextFieldCharacterCount";
  }

  @override
  String get reorderItemDown => "reorderDown";

  @override
  String get reorderItemLeft => "reorderLeft";

  @override
  String get reorderItemRight => "reorderRight";

  @override
  String get reorderItemToEnd => "reorderEnd";

  @override
  String get reorderItemToStart => "reorderStart";

  @override
  String get reorderItemUp => "reorder";

  @override
  String get rowsPerPageTitle => "Rows";

  @override
  String get saveButtonLabel => "Save";

  @override
  String get scanTextButtonLabel => "Scan";

  @override
  String get scrimLabel => "Scrim";

  @override
  String scrimOnTapHint(String modalRouteContentName) {
    return "scrimOnTapHint";
  }

  @override
  ScriptCategory get scriptCategory => ScriptCategory.dense;

  @override
  String get searchFieldLabel => "searchFieldLabel";

  @override
  String get searchWebButtonLabel => "searchWebButtonLabel";

  @override
  String get selectAllButtonLabel => "selectAllButtonLabel";

  @override
  String get selectYearSemanticsLabel => "selectYearSemanticsLabel";

  @override
  String selectedRowCountTitle(int selectedRowCount) {
    return "selectedRowCountTitle";
  }

  @override
  String get shareButtonLabel => "shareButtonLabel";

  @override
  String get showAccountsLabel => "showAccountsLabel";

  @override
  String get showMenuTooltip => "showMenuTooltip";

  @override
  String get signedInLabel => "signedInLabel";

  @override
  String tabLabel({required int tabIndex, required int tabCount}) {
    return "";
  }

  @override
  TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = false}) {
    return TimeOfDayFormat.a_space_h_colon_mm;
  }

  @override
  String get timePickerDialHelpText => "timePickerDialHelpText";

  @override
  String get timePickerHourLabel => "timePickerHourLabel";

  @override
  String get timePickerHourModeAnnouncement => "timePickerHourModeAnnouncement";

  @override
  String get timePickerInputHelpText => "timePickerInputHelpText";

  @override
  String get timePickerMinuteLabel => "timePickerMinuteLabel";

  @override
  String get timePickerMinuteModeAnnouncement =>
      "timePickerMinuteModeAnnouncement";

  @override
  String get unspecifiedDate => "unspecifiedDate";

  @override
  String get unspecifiedDateRange => "unspecifiedDateRange";

  @override
  String get viewLicensesButtonLabel => "viewLicensesButtonLabel";

  @override
  // TODO: implement clearButtonTooltip
  String get clearButtonTooltip => throw UnimplementedError();

  @override
  // TODO: implement selectedDateLabel
  String get selectedDateLabel => throw UnimplementedError();
}
