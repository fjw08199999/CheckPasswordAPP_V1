//
//  CheckPasswordData.swift
//  CheckPasswordAPP_V1
//
//  Created by fred fu on 2021/9/16.
//


//比對與低安全性相同密碼資料
let tenMostCommonPasswords = [
    "123456",
    "password",
    "12345678",
    "qwerty",
    "12345",
    "123456789",
    "letmein",
    "1234567",
    "football",
    "iloveyou"
]


//檢查密碼用資料
enum CheckData: String, CaseIterable {
    case digits = "0123456789",
         smallEnglish = "abcdefghijklmnopqrstuvwxyz",
         bigEnglish = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
         punctuation = "!@#$%^&*(),.<>;'`~[]{}\\|/?_-+= ",
         noData = ""
    
}


//設定Arlt抬頭訊息設定
enum SystemMsgTitle: String {
    case sysTemmsgTitle = "系統訊息"
    case errorMsgTitle = "錯誤訊息"
}


//設定系統訊息設定
enum SystemMSG: String {
    case registrationSuccess = "恭喜通過密碼安全性原則"
    case registrationFail = "未註冊成功，請重註冊"
}


//錯誤訊息設定
enum ErrorMsg: String {
    case checkAccountNil = "帳號不能為空白"
    case checkPasswordNil = "密碼不能為空白"
    case reCheckPasswordNil = "重新輸入密碼處不能為空白"
    case passwordLongError = "密碼長度需超過八個字元以及小於二十個字元"
    case inTenMostCommonPasswords = "不能包含常見密碼"
    case noPunctuation = "密碼必須包含特殊字元"
    case equalUserName = "密碼不能包含帳號名稱"
    case noBigEnglish = "密碼必須包含大寫英文字母"
    case noSmallEnglish = "密碼必須包含小寫英文字母"
    case noNumber = "密碼必須包含數字"
    case passwordEqualRepassword = "密碼必須與重新輸入密碼相同"
}


//Arlt按鈕訊息設定
enum AlertbuttonLabel: String {
    case buttonMSG = "OK"
}


//使用Label文字設定
enum LabelMSG: String {
    case username = "請輸入使用者名稱"
    case password = "請輸入密碼"
    case checkPassword = "再輸入一次密碼"
    case login = "登入"
    case register = "註冊"
}


//密碼長度設定 8~20
enum NumberMaxMin: Int {
    case maxNumber = 20
    case minNumber = 8
}

