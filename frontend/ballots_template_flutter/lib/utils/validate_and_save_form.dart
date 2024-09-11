bool validateAndSaveForm(formKey) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    return true;
  }
  return false;
}
