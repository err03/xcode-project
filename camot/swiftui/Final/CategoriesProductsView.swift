//
//  CategoriesProductsView.swift
//  Final
//
//  Created by error on 2020/11/22.
//

import SwiftUI
//MARK:CategoriesProductsView
struct CategoriesProductsView: View {
    var product:[Product] = []
    
    var body: some View {
        VStack{
            List(product){p in
                NavigationLink(destination:ProductDetailView(product: p)){
                    HStack{
                        Image(p.getImage())
                            .resizable()
                            .frame(width:150,height:130)
                        VStack(alignment:.leading){
                            Text("\(p.getName())")
                            
                            let price = String(format:"%.2f",p.getPrice())
                            Text("Price: $\(price)")
                                .padding(.top)
                            
                        }//vstack
                        .font(.system(size: 23))
                        .padding()
                    }//hstack
                }
            }//list
        }//vstack
        .padding()
    }//body
}

//MARK:productTemplate
struct productTemplate:View{
    
    var p:Product
    init(_p:Product){
        self.p = _p
    }
    
    var body:some View{
        NavigationLink(destination:ProductDetailView(product: p)){
            productView(_p: p)
        }//navigation link
    }//body
}

//MARK:productView
struct productView:View{
    
    var p:Product
    init(_p:Product){
        self.p = _p
    }
    
    var body:some View{
        
        HStack(alignment:.top){
            Image(systemName: "app")
                .font(.system(size: 150))
            VStack(alignment:.leading){
                Text("\(p.getName())")
                
                let price = String(format:"%.2f",p.getPrice())
                Text("Price: $\(price)")
                    .padding(.top)
                
            }//vstack
            .font(.system(size: 23))
            .padding()
        }//hstack
        
    }//body
}
//MARK:preview
struct CategoriesProductsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesProductsView(product:Categories().computer)
    }
}
