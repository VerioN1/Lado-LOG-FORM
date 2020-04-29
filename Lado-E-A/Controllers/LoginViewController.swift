//
//  LoginViewController.swift
//  Lado-E-A
//
//  Created by Admin on 4/23/20.
//  Copyright © 2020 myapps. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginButton(_ sender: Any) {
    
        guard let email = Email.text , !email.isEmpty else {return errorHandler("email is mepty")}
        guard let pass = Password.text, !pass.isEmpty else {return errorHandler("Password is empty")}
      
        
        handleSignIn(email: email, pass: pass){notice in
            
            
        
            if notice != "success"{
               return self.errorHandler(notice)
            }
            
            else{
               self.performSegue(withIdentifier: "return", sender: Any?.self)

            }
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func errorHandler(_ text: String){
          
           let alertController = UIAlertController(title: "אופס!", message: text , preferredStyle: .alert)
                           let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                           alertController.addAction(alertAction)
                           present(alertController, animated: true, completion: nil)
                           
                           return
          
    }
}
