/// Codes of all errors which
/// can occur in app.
enum ErrorCode {
  noInternet,
  nameIsEmpty,
  requestFailed,
  unkownError,
}

extension Ext on ErrorCode {
  String translate() {
    /// Too lazy to add intl.
    return switch (this) {
      ErrorCode.nameIsEmpty => 'Вы ничего не ввели',
      ErrorCode.noInternet => 'Вы отключены от интернета',
      ErrorCode.requestFailed => 'Ошибка запроса',
      ErrorCode.unkownError => 'Неизвестная ошибка. Попробуйте еще раз'
    };
  }
}
