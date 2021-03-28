class LoginResultVM {
  bool? isNew;
  String? accessToken;
  String? refreshToken;
  int? expiresIn;

  LoginResultVM(
      {this.isNew, this.accessToken, this.refreshToken, this.expiresIn});

  LoginResultVM.fromJson(Map<String, dynamic> json) {
    isNew = json['is_new'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_new'] = this.isNew;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
