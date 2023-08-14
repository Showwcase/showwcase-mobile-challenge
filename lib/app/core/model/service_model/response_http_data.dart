class ResponseHttpData {
  bool isSuccessful = true;
  String errorMessage = '';
  int stateCode = 400;
  dynamic mData = '';

  ResponseHttpData(
      this.errorMessage, this.stateCode, this.mData, this.isSuccessful);
}
