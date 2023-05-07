//
//  ViewController.swift
//  toDoListApp
//
//  Created by Tahir F. Kizir on 7.05.2023.
//

import UIKit

class ViewController: UIViewController
{
    
    private var loginButtonViewHeight : NSLayoutConstraint?
    private var loginViewAction = false
    
    private let welcomeLabel : UILabel =
    {
       let lbl = UILabel()
        lbl.textColor = UIColor(named:"lightBlack")
        lbl.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        lbl.text = "Microsoft To Do uygulamasına hoş geldiniz"
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let welcomeDescriptionLabel : UILabel =
    {
       let lbl = UILabel()
        lbl.textColor = UIColor.darkGray
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .light)
        lbl.text = "İş, okul veya Microsoft hesabıyla oturum açın."
        return lbl
    }()
    
    private let noAccountLabel : UILabel =
    {
       let lbl = UILabel()
        lbl.textColor = UIColor.systemBlue
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lbl.text = "Microsoft hesabınız yok mu?"
        return lbl
    }()
    
    private let welcomeImage : UIImageView =
    {
       let imgv = UIImageView()
        imgv.image = UIImage(named: "lgn1")
        
        return imgv
    }()
    
    private let xCircle : UIImageView =
    {
       let imgv = UIImageView()
        imgv.image = UIImage(named: "x-circle")
        imgv.isUserInteractionEnabled = true
        imgv.isHidden = true
        return imgv
    }()
    
    @objc func xCircleClicked()
    {
        loginTextField.text = ""
    }
    
    private let loginTextField : UITextField =
    {
       let tx = UITextField()
        tx.layer.cornerRadius = 5
        tx.layer.borderColor = UIColor.systemGray.cgColor
        tx.layer.borderWidth = 0.5
        tx.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tx.frame.height))
        tx.leftViewMode = .always
        tx.attributedPlaceholder = NSAttributedString(
            string: "E-posta veya telefon numarası",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        return tx
    }()
    
    private lazy var welcomeView : UIView =
    {
       let view = UIView()
        view.addSubview(welcomeLabel)
        welcomeLabel.anchor(top: view.topAnchor, paddingTop: 25, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 50, right: view.rightAnchor, paddingRight: 50, centerX: nil, paddingCenterX: 0, centerY: nil, paddingCenterY: 0, width: 0, height: 0)
        
        view.addSubview(welcomeImage)
        welcomeImage.anchor(top: welcomeLabel.bottomAnchor, paddingTop: 10, bottom: view.centerYAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, centerX: nil, paddingCenterX: 0, centerY: nil, paddingCenterY: 0, width: 0, height: 0)
        
        view.addSubview(loginTextField)
        loginTextField.anchor(top: welcomeImage.bottomAnchor, paddingTop: 15, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: -20, right: view.rightAnchor, paddingRight: -20, centerX: nil, paddingCenterX: 0, centerY: nil, paddingCenterY: 0, width: 0, height: 50)
        
        view.addSubview(xCircle)
        xCircle.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: loginTextField.rightAnchor, paddingRight: 10, centerX: nil, paddingCenterX: 0, centerY: loginTextField.centerYAnchor, paddingCenterY: 0, width: 20, height: 20)
        
        view.addSubview(loginButtonView)
        loginButtonView.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10).isActive = true
        loginButtonView.leftAnchor.constraint(equalTo: loginTextField.leftAnchor).isActive = true
        loginButtonView.rightAnchor.constraint(equalTo: loginTextField.rightAnchor).isActive = true
        loginButtonViewHeight = loginButtonView.heightAnchor.constraint(equalToConstant: 0)
        loginButtonViewHeight?.isActive = true
        
        view.addSubview(welcomeDescriptionLabel)
        welcomeDescriptionLabel.anchor(top: loginButtonView.bottomAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, centerX: view.centerXAnchor, paddingCenterX: 0, centerY: nil, paddingCenterY: 0, width: 0, height: 0)
   
        view.addSubview(noAccountLabel)
        noAccountLabel.anchor(top: nil, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, centerX: view.centerXAnchor, paddingCenterX: 0, centerY: nil, paddingCenterY: 0, width: 0, height: 0)
        
        return view
    }()
    
    private let loginButtonLabel : UILabel =
    {
        let lbl = UILabel()
        lbl.textColor = UIColor.systemBackground
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lbl.text = "Oturum açın"
        return lbl
    }()
    
    private lazy var loginButtonView : UIView =
    {
       let view = UIView()
        view.backgroundColor = UIColor.systemBlue
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.addSubview(loginButtonLabel)
        loginButtonLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, centerX: view.centerXAnchor, paddingCenterX: 0, centerY: view.centerYAnchor, paddingCenterY: 0, width: 0, height: 0)
        
        return view
    }()
    
    func isValidEmail(testStr:String) -> Bool
    {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    func isValidPhoneNumber(value: String) -> Bool
    {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    
    func configureUI()
    {
        view.addSubview(welcomeView)
        welcomeView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20, left: view.leftAnchor, paddingLeft: 55, right: view.rightAnchor, paddingRight: 55, centerX: nil, paddingCenterX: 0, centerY: nil, paddingCenterY: 0, width: 0, height: 0)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(xCircleClicked))
        xCircle.addGestureRecognizer(tap)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        configureUI()
        loginTextField.delegate = self
        
    }


}

extension ViewController : UITextFieldDelegate
{
    func textFieldDidChangeSelection(_ textField: UITextField)
    {
        let tx = textField.text!
        if tx.count > 0
        {
            xCircle.isHidden = false
            if isValidEmail(testStr: tx) || isValidPhoneNumber(value: tx)
            {
                if loginViewAction == false
                {
                    loginButtonViewHeight?.constant = 50
                    UIView.animate(withDuration: 0.2) {
                        self.view.layoutIfNeeded()
                        self.loginButtonView.alpha = 1
                    }
                }
                loginViewAction = true
            }
            else
            {
                if loginViewAction
                {
                    loginButtonViewHeight?.constant = 0
                    UIView.animate(withDuration: 0.2) {
                        self.view.layoutIfNeeded()
                        self.loginButtonView.alpha = 0
                    }
                }
                loginViewAction = false
            }
        }
        else
        {
            loginViewAction = false
            xCircle.isHidden = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        let tx = textField.text!
        if isValidEmail(testStr: tx) || isValidPhoneNumber(value: tx)
        {
            loginViewAction = true
        }
        else if tx.count == 0
        {
            return true
        }
        else
        {
            let alert = UIAlertController(title: "Microsoft To Do", message: "Lütfen geçerli bir e-posta adresi veya telefon numarası girin.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Kapat", style: .default)
            alert.addAction(action)
            self.present(alert, animated: false)
        }
        
        return true
    }
}

extension UIView
{
    
    func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat, bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat, left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat,centerX:NSLayoutXAxisAnchor?,paddingCenterX:CGFloat,centerY:NSLayoutYAxisAnchor?,paddingCenterY:CGFloat, width: CGFloat, height: CGFloat)
{
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top
        {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom
        {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right
        {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let left = left
        {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let centerX = centerX
        {
            centerXAnchor.constraint(equalTo: centerX, constant: paddingCenterX).isActive = true
        }
        if let centerY = centerY
        {
            centerYAnchor.constraint(equalTo: centerY, constant: paddingCenterY).isActive = true
        }
        if width != 0
        {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0
        {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
