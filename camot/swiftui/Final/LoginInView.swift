//
//  LoginInView.swift
//  Final
//
//  Created by error on 2020/11/29.
//

import SwiftUI

struct LoginInView: View {
    @EnvironmentObject var user:UserAccount
    var body: some View {
        //here is the, user able to login, when user success login, then will return to contentview()
        return Group{
            if (user.LoginIn == "yes"){
                ContentView()
            }else{
                login()
            }
        }
    }//body
}

struct login:View {
    @EnvironmentObject var user:UserAccount
    var body: some View{
        VStack{
            Text("something srong with your username or passowrd")
                .opacity((user.LoginIn == "no") ? 1.0 : 0.0)
                .foregroundColor(.red)
            HStack{
                Text("UserName:")
                TextField("User Name",text:$user.LoginUsername)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border((user.LoginIn == "no" || !user.validLoginUsername) ? Color.red : Color.black.opacity(0.0))
                    .keyboardType(.alphabet)
                    .autocapitalization(.none)
            }//hstack
            
            HStack{
                Text("Password:")
                SecureField("password",text:$user.LoginPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border((user.LoginIn == "no" || !user.validLoginPassword ) ? Color.red : Color.black.opacity(0.0))
            }//hstack
            
            Button(action: {
                user.userLoginIn()
            }, label: {
                Text("Login")
            })
            
            NavigationLink(destination:SignInView()){
                Text("Didn't have account? Sign In")
            }
        }//vstack
        .padding()
    }
}
struct LoginInView_Previews: PreviewProvider {
    static var previews: some View {
        LoginInView()
            .environmentObject(UserAccount())
    }
}
