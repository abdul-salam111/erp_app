class DeleteTokenRequestModel {
  final String accessToken;

  const DeleteTokenRequestModel({required this.accessToken});

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
      };
}
