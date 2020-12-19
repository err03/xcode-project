//
//  TopHeadView.swift
//  Final
//
//  Created by error on 2020/11/18.
//

import SwiftUI

struct TopHeadView: View {
    
    var body: some View {
        //this is the top head view, which is the title and the user account
            VStack{
                
            }//vstack
            .navigationBarItems(leading: Text("Catmot")
                                    .frame(width: 300, height: 100, alignment: .leading)
                                    .font(.system(size:50))
                                ,
                                trailing:
                                    NavigationLink(
                                    destination: AccountMenuView(),
                                    label: {
                                        Image(systemName: "person.circle")
                                            .font(.system(size: 45))
                                            .foregroundColor(.black)
                                    }//label
                                )//navigationlink
            )//navigationbar items
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct TopHeadView_Previews: PreviewProvider {
    static var previews: some View {
        TopHeadView()
    }
}
