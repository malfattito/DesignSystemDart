import 'package:untitled/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';

class ActionButtonActions {
  static void enableButton(ActionButtonViewModel viewModel) {
    viewModel.enable();
  }

  static void disableButton(ActionButtonViewModel viewModel) {
    viewModel.disable();
  }

  static void showError(ActionButtonViewModel viewModel) {
    viewModel.showError();
  }

  static void clearError(ActionButtonViewModel viewModel) {
    viewModel.clearError();
  }
}

