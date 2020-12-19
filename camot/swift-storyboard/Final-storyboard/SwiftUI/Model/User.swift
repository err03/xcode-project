//
//  User.swift
//  Final
//
//  Created by error on 2020/11/29.
//

import Foundation
class User{
    private var username = ""
    private var password = ""
    
    init(username:String,password:String){
        setUsername(_username: username)
        setPassword(_password: password)
    }
    
    func setUsername(_username:String){
        self.username = _username
    }
    func getUsername() -> String{
        username
    }
    
    func setPassword(_password:String){
        self.password = _password
    }
    func getPassword() -> String{
        password
    }
}
