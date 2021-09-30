//
//  CheckPasswordViewController.swift
//  CheckPasswordAPP_V1
//
//  Created by fred fu on 2021/9/16.
//

import UIKit


class CheckPasswordViewController: UIViewController, UITextFieldDelegate {
    
    //檢查帳號是否為空值
    func checkaccountNil(userNameFieldText: String) {
        if userNameFieldText.isEmpty == true {
            errorArlt(title: SystemMsgTitle.errorMsgTitle.rawValue, errorMsg: ErrorMsg.checkAccountNil.rawValue)
        }
    }
    
    //檢查密碼是否為空值
    func checkPasswordNil(passwordFieldText: String) {
        if passwordFieldText.isEmpty == true {
            errorArlt(title: SystemMsgTitle.errorMsgTitle.rawValue, errorMsg: ErrorMsg.checkPasswordNil.rawValue)
        }
    }
    
    //檢查重複輸入密碼是否為空值
    func reCheckPasswordNil(repasswordFieldText: String) {
        if repasswordFieldText.isEmpty == true {
            errorArlt(title: SystemMsgTitle.errorMsgTitle.rawValue, errorMsg: ErrorMsg.reCheckPasswordNil.rawValue)
        }
    }
    
    //檢查密碼長度是否介於8~20字元
    func checkPasswordLong(passwordField: String) {
        if passwordField.count < NumberMaxMin.minNumber.rawValue || passwordField.count > NumberMaxMin.maxNumber.rawValue {
            errorArlt(title: SystemMsgTitle.errorMsgTitle.rawValue, errorMsg: ErrorMsg.passwordLongError.rawValue)
        }
    }
    
    //檢查密碼是否包含帳號
    func checkEqualUserNameAndRepassword(userNameFieldText: String, passwordFieldText: String) {
        if passwordFieldText.contains(userNameFieldText) {
            errorArlt(title: SystemMsgTitle.errorMsgTitle.rawValue, errorMsg: ErrorMsg.equalUserName.rawValue)
        }
        
    }
    
    //檢查密碼是否包含常見密碼
    func checkInTenMostCommonPasswords(passwordFieldText: String) {
        for i in 0...tenMostCommonPasswords.count - 1 {
            if passwordFieldText.contains(tenMostCommonPasswords[i]) {
                errorArlt(title: SystemMsgTitle.errorMsgTitle.rawValue, errorMsg: ErrorMsg.inTenMostCommonPasswords.rawValue)
            }
        }
    }
    
    //檢查密碼是否包含特殊字元
    func checkInSpecialCharacters(passwordFieldText: String) {
        
        for (index, password) in passwordFieldText.enumerated() {
            if CheckData.punctuation.rawValue.contains(password) {
                break
            } else {
                if index == passwordFieldText.count - 1 {
                    errorArlt(title: SystemMsgTitle.errorMsgTitle.rawValue, errorMsg: ErrorMsg.noPunctuation.rawValue)
                }
            }
        }
    }
    
    //檢查密碼是否包含數字
    func checkPasswordInNumber(passwordFieldText: String) {
        for (index, password) in passwordFieldText.enumerated() {
            if CheckData.digits.rawValue.contains(password) {
                break
            } else {
                if index == passwordFieldText.count - 1 {
                    errorArlt(title: SystemMsgTitle.errorMsgTitle.rawValue, errorMsg: ErrorMsg.noNumber.rawValue)
                }
            }
        }
    }
    
    //檢查密碼是否包含大寫英文字元
    func checkPasswordInBigEnglish(passwordFieldText: String) {
        for (index, password) in passwordFieldText.enumerated() {
            if CheckData.bigEnglish.rawValue.contains(password) {
                break
            } else {
                if index == passwordFieldText.count - 1 {
                    errorArlt(title: SystemMsgTitle.errorMsgTitle.rawValue, errorMsg: ErrorMsg.noBigEnglish.rawValue)
                }
            }
        }
        
    }
    
    //檢查密碼是否包含小寫英文字元
    func checkPasswordInSmallEnglish(passwordFieldText: String) {
        for (index, password) in passwordFieldText.enumerated() {
            if passwordFieldText.contains(password) {
                break
            } else {
                if index == passwordFieldText.count - 1 {
                    errorArlt(title: SystemMsgTitle.errorMsgTitle.rawValue, errorMsg: ErrorMsg.noSmallEnglish.rawValue)
                }
            }
        }
    }
    
    //檢查密碼與重複輸入密碼是否一致
    func checkPasswordEqualRePassword(passwordFieldText: String, rePasswordFieldText: String) {
        if passwordFieldText == rePasswordFieldText {
        } else {
            errorArlt(title: SystemMsgTitle.errorMsgTitle.rawValue, errorMsg: ErrorMsg.passwordEqualRepassword.rawValue)
        }
    }
    
    //註冊成功訊息
    func checkregistrationSuccess(registrationSuccess: String) {
        errorArlt(title: SystemMsgTitle.sysTemmsgTitle.rawValue, errorMsg: SystemMSG.registrationSuccess.rawValue)
    }
    
    //Arlt Func
    func errorArlt(title: String, errorMsg: String) {
        
        let alertController = UIAlertController(title: title, message: errorMsg, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: AlertbuttonLabel.buttonMSG.rawValue, style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
        
    }
    
    //點擊空白處收鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
    }

    
    //Main.storyboard畫面
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var rePasswordLabel: UILabel!
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rePasswordField: UITextField!
    
    @IBOutlet weak var singButton: UIButton!
    @IBOutlet weak var registButton: UIButton!
    
    @IBOutlet weak var lowView: UIView!
    @IBOutlet weak var midleView: UIView!
    @IBOutlet weak var highView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //首頁滿版漸層顏色
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.blue.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //Label文字設定
        userNameLabel.text = LabelMSG.username.rawValue
        passwordLabel.text = LabelMSG.password.rawValue
        rePasswordLabel.text = LabelMSG.checkPassword.rawValue
        
        //Button文字以及樣式設定
        singButton.setTitle(LabelMSG.login.rawValue, for: .normal)
        registButton.setTitle(LabelMSG.register.rawValue, for: .normal)
        singButton.tintColor = .cyan
        registButton.tintColor = .cyan
        
        //密碼強度view顏色設定
        lowView.backgroundColor = .red
        midleView.backgroundColor = .yellow
        highView.backgroundColor = .green
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func singButtonAction(_ sender: Any) {
        
        
    }
    
    
    
    @IBAction func registButtonAction(_ sender: Any) {
        
        //帳號輸入Field是否為空值
        checkaccountNil(userNameFieldText: userNameField.text!)
        
        //密碼輸入Field是否為空值
        checkPasswordNil(passwordFieldText: passwordField.text!)
        
        //重新輸入密碼Field是否為空值
        reCheckPasswordNil(repasswordFieldText: rePasswordField.text!)
        
        
        //檢查密碼長度
        checkPasswordLong(passwordField: passwordField.text!)
        
        //是否包含帳號檢查
        checkEqualUserNameAndRepassword(userNameFieldText: userNameField.text!, passwordFieldText: passwordField.text!)
        
        //常見密碼檢查
        checkInTenMostCommonPasswords(passwordFieldText: passwordField.text!)
        
        //檢查包含數字
        checkPasswordInNumber(passwordFieldText: passwordField.text!)
        
        //英文大寫檢查
        checkPasswordInBigEnglish(passwordFieldText: passwordField.text!)
        
        //英文小寫檢查
        checkPasswordInSmallEnglish(passwordFieldText: passwordField.text!)
        
        //特殊字元檢查
        checkInSpecialCharacters(passwordFieldText: passwordField.text!)
        
        //重複輸入兩次的密碼檢查
        checkPasswordEqualRePassword(passwordFieldText: passwordField.text!, rePasswordFieldText: rePasswordField.text!)
        
        //密碼創建成功
        checkregistrationSuccess(registrationSuccess: SystemMSG.registrationSuccess.rawValue)
        
        //收鍵盤
        
    }
    
    
}
