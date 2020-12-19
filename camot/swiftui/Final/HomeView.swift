//
//  HomeView.swift
//  Final
//
//  Created by error on 2020/11/18.
//

import SwiftUI

//this is home view, and there's nothing able to tap, just for look
struct HomeView: View {
    @Binding var selectedTab:Tabs
    var body: some View {
        let width:CGFloat = 370

        VStack{
            Section{
                Text("Big ADd")
            }
            .frame(width: width, height: 300)
            .background(Color.blue)
            .padding(3)
                
            Section{
                Text("Small ads")
            }
            .frame(width: width, height: 120)
            .background(Color.yellow)
            .padding(3)
            
            Section{
                Text("Categories")
            }
            .frame(width: width, height: 200)
            .background(Color.gray)
        }//vstack
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedTab: .constant(Tabs.home))
    }
}
