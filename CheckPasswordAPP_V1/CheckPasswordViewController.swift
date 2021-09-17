//
//  CheckPasswordViewController.swift
//  CheckPasswordAPP_V1
//
//  Created by fred fu on 2021/9/16.
//

import UIKit

class CheckPasswordViewController: UIViewController {
    
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
        
        userNameLabel.text = "輸入使用者名稱"
        passwordLabel.text = "輸入密碼"
        rePasswordLabel.text = "確認密碼"
        
        singButton.setTitle("登入", for: .normal)
        registButton.setTitle("註冊", for: .normal)
        
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
        
        
    }
    
    
}
