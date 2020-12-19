//
//  ContentView.swift
//  Final
//
//  Created by error on 2020/11/18.
//

import SwiftUI

enum Tabs:Hashable{
    case home
    case category
    case cart
}

struct ContentView: View {
    @State var selectedTab = Tabs.home
    var body: some View {
        
        NavigationView{
            VStack{
                TopHeadView()
                //tabView
                TabView(selection:$selectedTab){
                    //Home
                    NavigationView{
                        HomeView(selectedTab:$selectedTab)
                    }
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }.tag(Tabs.home)
                    
                    //Categories
                    NavigationView{
                        CategoriesView(selectedTab:$selectedTab)
                    }.tabItem {
                        Image(systemName: "rectangle.split.3x3.fill")
                        Text("Categories")
                    }.tag(Tabs.category)
                    
                    //cart
                    NavigationView{
                        CartView(selectedTab:$selectedTab)
                        
                    }.tabItem {
                        Image(systemName: "cart")
                        Text("Cart")
                    }.tag(Tabs.cart)
                }//tabview
            }//vstack
        }//navigationview
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Cart())
            .environmentObject(Categories())
            .environmentObject(validCheckout())
            .environmentObject(UserAccount())
            .environmentObject(OrderHistory())
    }
}
