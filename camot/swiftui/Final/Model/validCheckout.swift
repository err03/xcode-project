//
//  validCheckout.swift
//  Final
//
//  Created by error on 2020/11/27.
//

import Foundation
class validCheckout:ObservableObject{
    
    @Published var list:[CheckInfo] = []
    //MARK:String - shipping info
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var address1 = ""
    @Published var address2 = ""
    @Published var city = ""
    @Published var state = ""
    @Published var zipCode = ""
    @Published var email = ""
    @Published var phoneNumber = ""
    
    //MARK: String - payment info
    @Published var paymentMethodSelected = ""
    
    @Published var cardNumber = ""
    @Published var dateExp = ""
    @Published var cvv = ""
    
    @Published var paypalEmail = ""
    @Published var paypalPassowrd = ""
    
    @Published var validOrderConfirm:Bool = false
    //MARK:Bool - shipping info
    @Published var validShippingInfo:Bool = true
    
    @Published var validFirstName:Bool = true
    @Published var validLastName:Bool = true
    @Published var validAddress1:Bool = true
    @Published var validAddress2:Bool = true
    @Published var validCity:Bool = true
    @Published var validState:Bool = true
    @Published var validZipCode:Bool = true
    @Published var validEmail:Bool = true
    @Published var validPhoneNumber:Bool = true

    //MARK:Bool - payment info
    @Published var validPaymentInfo:Bool = true
    
    @Published var validCardNumber:Bool = true
    @Published var validDateExp:Bool = true
    @Published var validCvv:Bool = true

    @Published var validPaypalEmail:Bool = true
    @Published var validPaypalPassword:Bool = true
     
    //MARK: init checkout info
    func initCheckInfo(_init:Bool){
        if(_init == true){
            firstname = ""
            lastname = ""
            address1 = ""
            address2 = ""
            city = ""
            state = ""
            zipCode = ""
            email = ""
            phoneNumber = ""
            
            //MARK: String - payment info
            paymentMethodSelected = ""
            
            cardNumber = ""
            dateExp = ""
            cvv = ""
            
            paypalEmail = ""
            paypalPassowrd = ""
        }
    }
    //MARK: validShippingInfo
    func validShippingInfo(_firstname:String,_lastname:String,_address1:String,_address2:String,_city:String,_state:String,_zipcode:String,_email:String,_phoneNumber:String){
        
        validFirstName(firstname: _firstname)
        validLastName(lastname: _lastname)
        validAddress1(address: _address1)
        validAddress2(address: _address2)
        validCity(city: _city)
        validState(state: _state)
        validZipCode(zipcode: _zipcode)
        validEmail(email: _email)
        validPhoneNumber(phonenumber: _phoneNumber)
        
//        list.append(CheckInfo(firstname: _firstname, lastname: _lastname, address1: _address1, address2: _address2, city: _city, state: _state, zipcode: _zipcode))
        list.insert(CheckInfo(firstname: _firstname, lastname: _lastname, address1: _address1, address2: _address2, city: _city, state: _state, zipcode: _zipcode), at: list.startIndex)
        
        print("valid firstName:\(validFirstName)\n valid lastName:\(validLastName) \n valid address1:\(validAddress1) \n valid address2:\(validAddress2) \n valid city:\(validCity) \n valid zipcode:\(validZipCode) \n valid email:\(validEmail) \n valid phoneNumber:\(validPhoneNumber)")
        print("------------")
        if(validFirstName && validLastName && validAddress1 && validAddress2 && validCity && validState && validZipCode && validEmail && validPhoneNumber){
            validShippingInfo = true
            print("valid shipping info: true")
            return
        }
        print("valid shipping info: false")
        validShippingInfo = false
    }
    
    //MARK: valid paymentInfo
    func validPaymentInfo(_cardNumber:String,_dateExp:String,_cvv:String,_paypalEmail:String,_paypalPassword:String){
        switch paymentMethodSelected {
        case "card":
            validCardNumber(cardnumber:_cardNumber)
            validDateExp(dateexp: _dateExp)
            validCvv(cvv: _cvv)
            
            print("valid carnumber:\(validCardNumber) \n valid cvv:\(validCvv) \n valid dateexp:\(validDateExp)")
            print("------------")
            if(validCardNumber && validDateExp && validCvv){
                print("valid payment info:true")
                validPaymentInfo = true
                return
            }
            print("valid payment info:false")
            validPaymentInfo = false
        case "paypal":
            validPaypalEmail(email:_paypalEmail)
            validPaypalPassword(password: _paypalPassword)
            
            print("valid paypal email:\(validPaypalEmail) \n valid paypal password:\(paypalPassowrd)")
            print("------------")
            if(validPaypalEmail && validPaypalPassword){
                print("valid payment info:true")
                validPaymentInfo = true
                return
            }
            print("valid payment info:false")
            validPaymentInfo = false
        default:
            validPaymentInfo = false
            break
        }
         
    }
    //MARK: valid order confirm
    func validOrderConfirm(_shippinginfo:Bool,_paymentinfo:Bool){
        print("shipping info:\(_shippinginfo) ; payment info: \(_paymentinfo)")
        if(_shippinginfo && _paymentinfo){
            self.validOrderConfirm = true
            print("valid order confirm: true")
            print("------------")
            return
        }
        print("valid order confirm: false")
        print("------------")
        self.validOrderConfirm = false
    }
    //MARK:- valid shipping info part
    
    
    
    //MARK: valid firstname
    func validFirstName(firstname:String){
        if (firstname == ""){
            self.validFirstName = false
            return
        }
        self.firstname = firstname
        self.validFirstName = true
    }
    //MARK: validLastName
    func validLastName(lastname:String){
        if (lastname == ""){
            self.validLastName = false
            return
        }
        self.lastname = lastname
        self.validLastName = true
    }
    //MARK: valid address 1
    func validAddress1(address:String){
        if (address == ""){
            self.validAddress1 = false
            return
        }
        self.address1 = address
        print("---------address1:\(self.address1)")
        self.validAddress1 = true
    }
    
    //MARK: valid address 2
    func validAddress2(address:String){
        if (address == ""){
            print("address 2:\(address)")
            self.validAddress2 = true
            return
        }
        self.address2 = address
        self.validAddress2 = true
    }
    
    //MARK: valid city
    func validCity(city:String){
        if (city == ""){
            self.validCity = false
            return
        }
        self.city = city
        self.validCity = true
    }
    
    //MARK: valid state
    func validState(state:String){
        if (state == ""){
            self.validState = false
            return
        }
        self.state = state
        self.validState = true
    }
    
    //MARK: valid zipcode
    func validZipCode(zipcode:String){
        if (zipcode == ""){
            self.validZipCode = false
            return
        }
        self.zipCode = zipcode
        self.validZipCode = true
    }
    
    //MARK: valid email
    func validEmail(email:String){
        if (email == ""){
            self.validEmail = false
            return
        }
        self.email = email
        self.validEmail = true
    }
    
    //MARK: valid phoneNumber
    func validPhoneNumber(phonenumber:String){
        if (phonenumber == ""){
            self.validPhoneNumber = false
            return
        }
        self.phoneNumber = phonenumber
        self.validPhoneNumber = true
    }
    
    //MARK:- valid payment info part
    
    
    
    //MARK: valid cardnumber
    func validCardNumber(cardnumber:String){
        if (cardnumber == ""){
            self.validCardNumber = false
            return
        }
        self.cardNumber = cardnumber
        self.validCardNumber = true
    }
    
    //MARK: valid dateexp
    func validDateExp(dateexp:String){
        if (dateexp == ""){
            self.validDateExp = false
            return
        }
        self.dateExp = dateexp
        self.validDateExp = true
    }
    
    //MARK: valid cvv
    func validCvv(cvv:String){
        if (cvv == ""){
            self.validCvv = false
            return
        }
        self.cvv = cvv
        self.validCvv = true
    }
    
    //MARK: valid email
    func validPaypalEmail(email:String){
        if(email == ""){
            self.validPaypalEmail = false
            return
        }
        self.paypalEmail = email
        self.validPaypalEmail = true
    }
    
    //MARK: valid password
    func validPaypalPassword(password:String){
        if(password == ""){
            self.validPaypalPassword = false
            return
        }
        self.paypalPassowrd = password
        self.validPaypalPassword = true
    }
}//valid checkout
