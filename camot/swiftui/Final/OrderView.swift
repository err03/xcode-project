//
//  OrderView.swift
//  Final
//
//  Created by error on 2020/11/30.
//

import SwiftUI

struct OrderView: View {
    var order:Order
    var body: some View {
        VStack(alignment:.leading){
            Section(header:
                        VStack(alignment:.leading){
                            Text("Order: #\(order.getOrderNumber())")
                            Text("Delivery Date:\(order.getOrderDate())")
                        }//hstack
                        .padding(.leading)
            ){
                List{
                    VStack{
                        Text("\(order.getFullName())")
                        Text("\(order.getAddress())")
                    }//vstack
                }//list
                .frame(width: 400, height: 100, alignment: .center)
            }//section
            .border(Color.black)
        }//vstack
        
    }//body
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(order:OrderHistory().list.first!)
    }
}
