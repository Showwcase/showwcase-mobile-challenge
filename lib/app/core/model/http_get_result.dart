class HttpGetResult<T>{
  bool isSuccessful=true;
  String errorMessage='';
  int statusCode = 400;
  T mData;


  HttpGetResult(this.errorMessage, this.statusCode, this.mData,this.isSuccessful);
}