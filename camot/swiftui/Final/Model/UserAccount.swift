//
//  UserAccount.swift
//  Final
//
//  Created by error on 2020/11/28.
//

import Foundation
class UserAccount:ObservableObject{
    @Published var userAccount:[User] = []
    @Published var LoginIn = ""
    
    //MARK:String - login
    @Published var LoginUsername = ""
    @Published var LoginPassword = ""
    
    @Published var validLoginUsername:Bool = true
    @Published var validLoginPassword:Bool = true
    
    //MARK:String - sign in
    @Published var SignInUsername = ""
    @Published var SignInPassword = ""
    @Published var SignInConfirmPassword = ""
    
    @Published var validSignInUsername:Bool = true
    @Published var validSignInPassword:Bool = true
    @Published var validSignConfirmPassword:Bool = true
    @Published var validSignInPassowrdSame:Bool = true
    
    @Published var signInSuccess = false
    
    init(){
        userAccount.append(User(username: "admin", password: "123"))
    }
    
    //MARK: user sign in
    func userSignIn(){
        if(SignInUsername == ""){
            validSignInUsername = false
        }else{
            validSignInUsername = true
        }
        
        if(SignInPassword == ""){
            validSignInPassword = false
        }else{
            validSignInPassword = true
        }
        
        if(SignInConfirmPassword == ""){
            validSignConfirmPassword = false
        }else{
            validSignConfirmPassword = true
        }
        
        if(SignInPassword == SignInConfirmPassword){
            validSignInPassowrdSame = true
        }else{
            validSignInPassowrdSame = false
        }
        
        if(validSignInUsername && validSignInPassowrdSame){
            SignInConfirm()
        }
    }//sign in
    
    func SignInConfirm(){
        signInSuccess = true
        userAccount.append(User(username: SignInUsername, password: SignInPassword))
    }
    
    //MARK:user login
    func userLoginIn(){
        if(LoginUsername == ""){
            validLoginUsername = false
        }else{
            validLoginUsername = true
        }
        
        print("valid login username:\(validLoginUsername)")
        if(LoginPassword == ""){
            validLoginPassword = false
        }else{
            validLoginPassword = true
        }
        print("valid login password:\(validLoginPassword)")
        
        if(validLoginUsername && validLoginPassword){
            print("accounts:\(userAccount)")
            for a in userAccount{
                print("username:\(a.getUsername());pasword:\(a.getPassword())")
                print("-----")
                if(a.getUsername() == LoginUsername){   //found username
                    if(a.getPassword() == LoginPassword){ //found match password
                        LoginIn = "yes"
                    }else{  //if found but not same password
                        LoginIn = "no"
                    }
                }else{  //if not found user
                    LoginIn = "no"
                }
            }//for
        }
        print("login success:\(LoginIn)")
    }//login in
}
