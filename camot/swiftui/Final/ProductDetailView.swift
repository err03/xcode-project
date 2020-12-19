//
//  ProductDetailView.swift
//  Final
//
//  Created by error on 2020/11/21.
//

import SwiftUI

struct ProductDetailView: View {
    var product:Product
    @EnvironmentObject var cart:Cart
    @State var isTrue:Bool = false
    @State var qty = "1"
    var body: some View {
        ScrollView{
            VStack{
                Section{
                    VStack(alignment:.leading){
                        Image(product.getImage())
                            .resizable()
                            .frame(width:250,height:230)
                        
                        //star
                        HStack{
                            ForEach(1 ... product.getRate(),id:\.self){
                                _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 30))
                            }//foreach
                            
                            Text("(15)")
                        }//hstack
                    }
                    
                    VStack(alignment:.leading){
                        Text("Name:\(product.getName())")
                        HStack{
                            Text("Qty:")
                            Button(action: {
                                let num = Int(qty)! - 1
                                if(num < 0){
                                    qty = "0"
                                    return
                                }
                                qty = String(num)
                            }, label: {
                                Image(systemName: "minus.circle")
                            })
                            TextField("", text: $qty)
                                .frame(width: 30)
                                .background(Color.white)
                                .overlay(Rectangle().stroke(lineWidth: 1))
                                .keyboardType(.numberPad)
                            
                            Button(action: {
                                let num = Int(qty)! + 1
                                qty = String(num)
                            }, label: {
                                Image(systemName: "plus.circle")
                            })
                        }
                        
                        Text("Price: $\(String(format:"%.2f",product.getPrice()))")
                            .padding(.top)
                        
                    }//vstack
                    .font(.system(size: 23))
                    .padding()
                    
                    Text("Describe:")
                    Text("\(product.getDescription())")
                        .padding()
                }//section
                
                Button(action: {
                    product.setQty(_qty: Int(qty)!)
                    cart.add(product: product)
                    isTrue.toggle()
                    print("\(qty)")
                }, label: {
                    Text("Add To Cart")
                })//button
                .alert(isPresented:$isTrue){
                    Alert(title: Text("Cart"),message: Text("item is added to Cart"),dismissButton: .cancel(Text("OK"),action:{isTrue = false})
                    )
                }//alert
            }//vstack
        }//scrollview
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product:Categories().computer.first!)
            .environmentObject(Cart())
    }
}
