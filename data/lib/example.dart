// @overrideFuture<LoginResponse>
// login({required LoginRequestBody requestBody}) {
//   const endpoint = EndPoints.login;
//   var dioCall = dioClient.post(endpoint, data: requestBody.toJson());
//   try {
//     return callApiWithErrorParser(dioCall).then((response) =>
//         _parseLoginResponse(response));
//   } catch (e) {
//     rethrow;
//   }
// }
//
// LoginResponse _parseLoginResponse(Response response) {
//   return LoginResponse.fromJson(response.data);
// }
//
// void _getInAppMessage() async {
//   callDataService(_repository.getInAppMessage(),
//     onSuccess: _handleHomeInAppMessageSuccessResponse,
//     enableErrorMessage: false,
//     onStart: () => logger.d("Fetching in app message"),
//     onComplete: () => logger.d("Fetched in app message"),);
// }
//
// void _handleHomeInAppMessageSuccessResponse(InAppMessageResponse? message) {
//   if (message != null) {
//     final responseMessage = InAppMessageUIModel(
//       id: message.id ?? -1,
//       title: message.title ?? '',
//       body: message.body ?? '',);
//     inAppMessageController.trigger(responseMessage);
//   }
// }
