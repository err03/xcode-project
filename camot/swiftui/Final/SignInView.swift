//
//  SignInView.swift
//  Final
//
//  Created by error on 2020/11/29.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var user:UserAccount
    var body: some View {
        //here is also if user is sign in, when sign in success, then user able to go back to login in
        return Group{
            if(!user.signInSuccess){
                signIn()
            }else{
                signInSuccess()
            }
        }
    }//body
}

struct signIn:View{
    @EnvironmentObject var user:UserAccount
    var body: some View{
        VStack{
            HStack{
                Text("UserName:")
                TextField("User Name",text:$user.SignInUsername)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border((!user.validSignInUsername) ? Color.red : Color.black.opacity(0.0))
                    .autocapitalization(.none)
            }//hstack
            
            HStack{
                Text("Password:")
                SecureField("password",text:$user.SignInPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border((!user.validSignInPassword || !user.validSignInPassowrdSame) ? Color.red : Color.black.opacity(0.0))
            }//hstack
            
            HStack{
                Text("Confirm Password:")
                SecureField("confirm password",text:$user.SignInConfirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border((!user.validSignConfirmPassword  || !user.validSignInPassowrdSame) ? Color.red : Color.black.opacity(0.0))
            }//hstack
            
            Text("Password not same")
                .opacity(!user.validSignInPassowrdSame ? 1.0 : 0.0)
                .foregroundColor(.red)
            Button(action: {
                user.userSignIn()
            }, label: {
                Text("Sign Up")
            })
        }//vstack
        .padding()
    }//body
}
struct signInSuccess:View{
    var body: some View{
        Text("Sign up success!!!")
    }//body
}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(UserAccount())
    }
}
