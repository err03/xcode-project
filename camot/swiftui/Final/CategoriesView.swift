//
//  CategoriesView.swift
//  Final
//
//  Created by error on 2020/11/18.
//

import SwiftUI
struct CategoriesView: View {
    @EnvironmentObject var categories:Categories
    @State var cRadius:CGFloat = 30.0
    @State var selection : Int? = nil
    @Binding var selectedTab:Tabs
    var body: some View {
        //this is categories view, there is computer, mouse, keyboard, and headset. And I was try to not DRY, but I fail because I dont know how to pass in the cateogries like, categories.computer / .mouse, etc. 
        ScrollView{
            VStack{
                NavigationLink(destination:CategoriesProductsView(product: categories.computer)){
                        Text("Computer")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 140)
                            .background(Color.gray)
                            .cornerRadius(cRadius)
                            .padding()
                            
                    }//navigationlink
                
                    NavigationLink(destination:CategoriesProductsView(product: categories.mouse)){
                        Text("Mouse")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 140)
                            .background(Color.gray)
                            .cornerRadius(cRadius)
                            .padding()
                    }//navigationlink
                    
                    NavigationLink(destination:CategoriesProductsView(product: categories.keyboard)){
                        Text("Keyboard")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 140)
                            .background(Color.gray)
                            .cornerRadius(cRadius)
                            .padding()
                    }//navigationlink
                    
                    NavigationLink(destination:CategoriesProductsView(product: categories.headset)){
                        Text("Headset")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 140)
                            .background(Color.gray)
                            .cornerRadius(cRadius)
                            .padding()
                    }//navigationlink
//                }
            }//vstack
            .padding()
        }//scrollview
    }//body
}

//struct categoryTemplate:View{
//    var name:String
//    var categories:Product
//    @State var cRadius:CGFloat = 30.0
//    var body: some View{
//        NavigationLink(destination:CategoriesProductsView(product: categories)){
//                Text("Computer")
//                    .fontWeight(.bold)
//                    .font(.title)
//                    .frame(width: 350, height: 140)
//                    .background(Color.gray)
//                    .cornerRadius(cRadius)
//                    .padding()
//                    .foregroundColor(.blue)
//            }//navigationlink
//    }
//}
struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(selectedTab: .constant(Tabs.category))
            .environmentObject(Categories())
    }
}
