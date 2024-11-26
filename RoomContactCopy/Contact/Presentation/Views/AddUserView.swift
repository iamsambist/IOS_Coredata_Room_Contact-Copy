//
//  AddUserView.swift
//  RoomContactCopy
//
//  Created by MacBook Two on 25/11/2024.
//

import SwiftUI

struct AddUserView: View {
    @ObservedObject var coreViewModel : CoreViewModel
    @Environment(\.presentationMode) var pmode
    @State private var firstName : String = ""
    @State private var lastName : String = ""
    @State private var phoneNumber : String = ""
    

    var body: some View {
        VStack {
            TextField ("ENTER FIRST NAME",text: $firstName)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 2))
                .padding(.horizontal)
             
            TextField ("ENTER LAST NAME",text: $lastName)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 2))
                .padding(.horizontal)
            
            TextField ("ENTER PHONE NUMBER",text: $phoneNumber)
                .keyboardType(.numberPad)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 2))
                .padding(.horizontal)
            
            HStack {
                Spacer()
                Button {
                    coreViewModel.userInformation = UserContactDetails(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber)
                    coreViewModel.addUserContact()
                    pmode.wrappedValue.dismiss()
                }label: {
                    Text ("SAVE")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 200,height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top)
                .padding(.trailing)
            }
        }
    }
}

#Preview {
    AddUserView(coreViewModel: CoreViewModel())
}
