//
//  shippingAddress.swift
//  Final
//
//  Created by error on 2020/11/25.
//

import SwiftUI

struct shippingAddress: View {
    
    @State var shippingInfo = ["First Name","Last Name","Address 1","Address 2","City","State","Zip Code","Phone Number"]
    @State var firstName = ""
    @State var lastName = ""
    @State var address1 = ""
    @State var address2 = ""
    @State var city = ""
    @State var state = ""
    @State var phoneNumber = ""
    var body: some View {
        
        VStack{
            Group{
                Text("First Name:")
                TextField("first name",text:$firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Last Name:")
                TextField("last name",text:$lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
    ////
                Text("Address 1:")
                TextField("address",text:$address1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
    //
                Text("Address 2:")
                TextField("address",text:$address2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
    //
                Text("City:")
                TextField("city",text:$city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }//group

            Text("State:")
            TextField("state",text:$state)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Text("Phone Number:")
            TextField("Phone number",text:$phoneNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }//vstack
    }
}

struct shippingAddress_Previews: PreviewProvider {
    static var previews: some View {
        shippingAddress()
    }
}
