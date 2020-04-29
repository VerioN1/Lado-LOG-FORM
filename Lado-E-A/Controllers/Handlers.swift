//
//  Handlers.swift
//  Lado-E-A
//
//  Created by Admin on 4/19/20.
//  Copyright © 2020 myapps. All rights reserved.
//

import Foundation
import Firebase

// the pref of the user uploaded to the database as string
struct Pref{
    var fullName : String
    var preferance : Array<Any>
    
    func save(fullName : String , preferance : Array<Any>) {
        var dic : [String: Any]
        let ref = Database.database().reference()
        dic = ["fullName":fullName , "preferance" : preferance]
        guard let profile = Auth.auth().currentUser?.email else {return}
        ref.child("Users").child(profile).setValue(dic)
    }
    
}

// signup function
func handleSignUp(email : String , fullName : String, pass : String, complitionHandler: @escaping (Bool)-> Void ) {
    Auth.auth().createUser(withEmail: email, password: pass){user , error in
        // checks if there was a problem with the given username or password
        if error == nil && user != nil{
            print("User Created succefully", user ?? "couldnt show who")
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = fullName
            changeRequest?.commitChanges{ error in
                if error == nil{
                   complitionHandler(false)
                }
            }
        } else {
            print("errorr --------", error!.localizedDescription )
            complitionHandler(true)
        }
        
        
    }
}
// sign in to asycruns func
func handleSignIn(email : String, pass : String, compHandler : @escaping(String)->Void){
    let Group = DispatchGroup()
    Group.enter()
    Auth.auth().signIn(withEmail: email, password: pass) {user , error in
        
        if error == nil && user != nil{
            
            Group.leave()
            Group.notify(queue:.main){
                compHandler("success")
            }
        }
        else
        {
            
            Group.leave()
            Group.notify(queue:.main){
                compHandler(error!.localizedDescription)
            }
        }
    }
    
}

