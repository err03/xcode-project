//
//  AccountMenuView.swift
//  Final
//
//  Created by error on 2020/11/18.
//

import SwiftUI

struct AccountMenuView: View {
    @EnvironmentObject var user:UserAccount
    var SignOutMenuList = ["Login"]
    var SignInMenuList = ["Setting","Account Manage","Order History","Logout"]
    @State var isLogout = false
    @State var selectedTab = Tabs.home
    var body: some View {
        //so while user login, then menu will change
        if(user.LoginIn == "yes"){
            List{
                Text("Account Manage")
                NavigationLink(destination:OrderHistoryView()){
                    Text("Order History")
                }
                Text("Setting")
                
                Button(action: {
                    isLogout = true
                }, label: {
                    Text("Logout")
                })
                .alert(isPresented:$isLogout){
                    Alert(title: Text("Logout"),message: Text("Do you wanna logout? "),primaryButton: .destructive(Text("Yes"),action: {user.LoginIn = "no"}),secondaryButton: .cancel(Text("No"),action:{isLogout = false})
                    )
                }//alert
                    
                
            }//list
        }else{
            List{
                NavigationLink(destination:LoginInView()){
                    Text("Login")
                }//navigation
            }//list
        }//else
    }//body
}

struct AccountMenuView_Previews: PreviewProvider {
    static var previews: some View {
        AccountMenuView()
            .environmentObject(UserAccount())
    }
}
