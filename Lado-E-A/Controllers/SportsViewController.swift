//
//  SportsViewController.swift
//  Lado-E-A
//
//  Created by Eyal Perets on 14/04/2020.
//  Copyright © 2020 myapps. All rights reserved.
//

import UIKit
import Firebase

class SportsViewController: UIViewController {

    @IBOutlet weak var titleLogo: UILabel!
    @IBOutlet weak var subTitleLogo: UILabel!
    var selectedButtons: Array<String> = []
        // זה המשתנה שבתוכו יש את סוגי הספורט שהמשתמש בחר
        // שאותו צריך לשמור בבסיס נתונים כסוג ספורט מועדף
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func buttonClicked(sender:UIButton)
    {


    sender.isSelected = !sender.isSelected
        if sender.isSelected == true {
        if let title = sender.titleLabel?.text {
            selectedButtons.append(title)
        }
    }
        else {
            if let title = sender.titleLabel?.text {
                selectedButtons.removeAll { $0 == title }
            }
        }
    print (selectedButtons)
    }

    @IBAction func continueButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "return2", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userInfo = Pref.init(fullName: (Auth.auth().currentUser?.displayName)!, preferance: selectedButtons)
        _ = Pref.save(userInfo)
//        let TableView = segue.destination as! MainTableViewController
   //     TableView.Preferance = selectedButtons
    }

}
