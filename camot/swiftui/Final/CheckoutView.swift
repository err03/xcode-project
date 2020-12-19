//
//  CheckoutView.swift
//  Final
//
//  Created by error on 2020/11/25.
//

import SwiftUI
//MARK: main view
struct CheckoutView: View {
    @EnvironmentObject var valid:validCheckout
    @Binding var selectedTab:Tabs
    var body: some View {
        
            VStack(alignment:.leading){
                List{
                    //shipping info section
                    shippingInfo()
                    
                    //payment info section
                    paymentInfo()
                    
                }//list
                confirmButton(selectedTab: $selectedTab)
            }//vstack
            .onTapGesture {
                UIApplication.shared.windows.forEach{
                    window in
                    if window.isKeyWindow{
                        window.endEditing(true)
                    }
                }
            }
    }//body
    
    
    
}

//MARK: shipping info
struct shippingInfo:View {
    @EnvironmentObject var valid:validCheckout
    var body: some View{
        Section{
            Text("Shipping Info")
                .padding()
            VStack(alignment:.leading){
                Group{
                    //MARK:first name
                    HStack{
                        Text("First Name:")
                        TextField("first name",text:$valid.firstname)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 200, height: 40)
                            .border(!valid.validFirstName ? Color.red : Color.black.opacity(0.0))
                    }
                    
                    //MARK:last name
                    HStack{
                        Text("Last Name:")
                        TextField("last name",text:$valid.lastname)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 200, height: 40)
                            .border(!valid.validLastName ? Color.red : Color.black.opacity(0.0))
                    }
                    
                    //MARK:address 1
                    HStack{
                        Text("Address 1:")
                        TextField("address",text:$valid.address1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 200, height: 40)
                            .border(!valid.validAddress1 ? Color.red : Color.black.opacity(0.0))
                    }
                    
                    //MARK:address 2
                    HStack{
                        Text("Address 2:")
                        TextField("optional",text:$valid.address2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 200, height: 40)
                            .border(!valid.validAddress2 ? Color.red : Color.black.opacity(0.0))
                    }
                    
                    //MARK:city
                    HStack{
                        Text("City:")
                        TextField("city",text:$valid.city)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 120, height: 30)
                            .border(!valid.validCity ? Color.red : Color.black.opacity(0.0))
                    }
                }//group
                
                Group{
                    //MARK:state
                    HStack{
                        Text("State:")
                        TextField("state",text:$valid.state)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 70, height: 30)
                            .border(!valid.validState ? Color.red : Color.black.opacity(0.0))
                    }
                    
                    //MARK:zip code
                    HStack{
                        Text("Zip Code:")
                        TextField("zip code",text:$valid.zipCode)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100, height: 30)
                            .border(!valid.validZipCode ? Color.red : Color.black.opacity(0.0))
                    }
                    
                    //MARK:email
                    HStack{
                        Text("Email:")
                        TextField("email",text:$valid.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 120, height: 30)
                            .border(!valid.validEmail ? Color.red : Color.black.opacity(0.0))
                    }
                    
                    //MARK:phone number
                    HStack{
                        Text("Phone Number:")
                        TextField("Phone number",text:$valid.phoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 200, height: 40)
                            .border(!valid.validPhoneNumber ? Color.red : Color.black.opacity(0.0))
                    }
                }//group
            }//vstack
        }//section
    }//body
}

//MARK:Payment info
struct paymentInfo:View{
//    @State var isSelected = "card"
    @EnvironmentObject var valid:validCheckout
    var body: some View{
        Section{
            Text("Payment Method")
                .padding()
                VStack(alignment:.leading){
                    
                    //MARK:radio button 1
                    radioButton(_id:1,_label:"Credit/Debit Card",_isSelected: $valid.paymentMethodSelected)
                        .onTapGesture(perform: {
                            valid.paymentMethodSelected = "card"
                        })
                    //MARK:radio button 2
                    radioButton(_id:2,_label:"Paypal",_isSelected: $valid.paymentMethodSelected)
                        .onTapGesture(perform: {
                            valid.paymentMethodSelected = "paypal"
                        })
                    
                    ZStack{
                        //MARK:card section
                        cardSection()
                            .opacity((valid.paymentMethodSelected == "card") ? 1.0 : 0.0)
//                            .frame(width: .infinity, height: (valid.paymentMethodSelected == "card") ? 150 : 10)
                        
                        
                        //MARK:paypal section
                        paypalSection()
                            .opacity((valid.paymentMethodSelected == "paypal") ? 1.0 : 0.0)
//                            .frame(width: .infinity, height: (valid.paymentMethodSelected == "paypal") ? 150 : 10)
                    }//zstack
                }//vstack
        }//section
    }//body
}

//MARK:card section view
struct cardSection :View{
    @EnvironmentObject var valid:validCheckout
    var body: some View{
        VStack(alignment:.leading){
            Group{
                //MARK:card number
                Text("Card Number")
                TextField("Card number",text:$valid.cardNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300, height: 40)
                    .border(!valid.validCardNumber ? Color.red : Color.black.opacity(0.0))
                
                HStack{
                    //MARK:date expire
                    HStack{
                        Text("Date Exp:")
                        TextField("MM/YY",text:$valid.dateExp)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 70, height: 30)
                            .border(!valid.validDateExp ? Color.red : Color.black.opacity(0.0))
                    }//hstack - date expire
                    
                    //MARK:cvv
                    HStack{
                    Text("CVV:")
                        TextField("cvv",text:$valid.cvv)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 70, height: 30)
                        .border(!valid.validCvv ? Color.red : Color.black.opacity(0.0))
                    }//hstack - cvv
                    .padding(.leading)
                }//hstack
            }//group
        }//vstack
    }
}

//MARK:paypal section view
struct paypalSection :View{
    @EnvironmentObject var valid:validCheckout
    var body: some View{
        VStack{
            Text("Pay with Paypal")
            TextField("Email",text:$valid.paypalEmail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(!valid.validPaypalEmail ? Color.red : Color.black.opacity(0.0))
            SecureField("Password",text:$valid.paypalPassowrd)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(!valid.validPaypalPassword ? Color.red : Color.black.opacity(0.0))
        }//vstack
    }
}

//MARK:radio button
struct radioButton:View {
    var label = ""
    @Binding var isSelected:String
    var id:Int
    
    init(_id:Int,_label:String,_isSelected:Binding<String>){
        self.label = _label
        self._isSelected = _isSelected
        self.id = _id
    }
    
    var body: some View{
        HStack{
            ZStack{
                Circle()
                    .stroke(lineWidth: 1)
                    .frame(width: 20, height: 20)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 13, height: 13)
                    .opacity((isSelected == "card" && id == 1) ? 1.0 : (isSelected == "paypal" && id == 2) ? 1.0 : 0.0)
            }//zstack
            
            Text("\(label)")
        }//hstack
    }//body
}//radio button

//MARK:confirm button
struct confirmButton:View{
    @EnvironmentObject var valid:validCheckout
    @EnvironmentObject var cart:Cart
    @Binding var selectedTab:Tabs
    var body: some View{
        NavigationLink(destination:OrderConfirm(selectedTab: $selectedTab),isActive:$valid.validOrderConfirm){
            Button(action: {
                valid.validShippingInfo(_firstname: valid.firstname, _lastname: valid.lastname, _address1: valid.address1, _address2: valid.address2, _city: valid.city,_state: valid.state, _zipcode: valid.zipCode, _email: valid.email, _phoneNumber: valid.phoneNumber)
                
                valid.validPaymentInfo(_cardNumber: valid.cardNumber, _dateExp: valid.dateExp, _cvv: valid.cvv, _paypalEmail: valid.paypalEmail, _paypalPassword: valid.paypalPassowrd)
                
                valid.validOrderConfirm(_shippinginfo: valid.validShippingInfo, _paymentinfo: valid.validPaymentInfo)
                
                valid.initCheckInfo(_init: true)
            }, label: {
                Text("Place Order & Confirm")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            })//button
            .frame(width: 350, height: 80, alignment: .center)
            .background(Color.green)
            .padding(.leading)
        }//navigation link
    }//body
}
//MARK:preview
struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(selectedTab: .constant(Tabs.cart))
            .environmentObject(validCheckout())
            .environmentObject(Cart())
    }
}
