//
//  ContentView.swift
//  RoomContactCopy
//
//  Created by MacBook Two on 25/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State var selectedSortOptions : SortOptions = SortOptions.FIRST_NAME
    @StateObject private var contactModel = CoreViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView (.horizontal){
                    HStack (spacing: 10 ){
                        HStack {
                            Image(systemName: selectedSortOptions == SortOptions.FIRST_NAME ? "largecircle.fill.circle" : "circle")
                            Text ("FIRST_NAME")
                        }
                        .onTapGesture {
                            selectedSortOptions = SortOptions.FIRST_NAME
                            contactModel.sortType = CoreDataSortOptions.firstName.rawValue
                            contactModel.fetchUserContact(sortedBy: contactModel.sortType)
                        }
                        HStack {
                            Image(systemName: selectedSortOptions == SortOptions.LAST_NAME ? "largecircle.fill.circle" : "circle")
                            Text ("LAST_NAME")
                        }
                        .onTapGesture {
                            selectedSortOptions = SortOptions.LAST_NAME
                            contactModel.sortType = CoreDataSortOptions.lastName.rawValue
                            contactModel.fetchUserContact(sortedBy: contactModel.sortType)
                        }
                        HStack {
                            Image(systemName: selectedSortOptions == SortOptions.PHONE_NUMBER ? "largecircle.fill.circle" : "circle")
                            Text ("PHONE_NUMBER")
                        }
                        .onTapGesture {
                            selectedSortOptions = SortOptions.PHONE_NUMBER
                            contactModel.sortType = CoreDataSortOptions.phoneNumber.rawValue
                            contactModel.fetchUserContact(sortedBy: contactModel.sortType)
                        }
                    }
                }
                //: SCROLL END
                    VStack {
                        List {
                            ForEach(contactModel.savedCotact){ contact in
                                HStack {
                                    Text(contact.firstName ?? "NO Name")
                                    Text(contact.lastName ?? "No ")
                                    Text(contact.phoneNumber ?? "no")
                                }
                            }
                            .onDelete(perform: {indexSet in
                                
                                })
                            
                            
                        }// List: END
                        .scrollContentBackground(.hidden)
                    }
                Spacer()
                
                HStack {
                    Spacer()
                    NavigationLink(destination: AddUserView(coreViewModel : contactModel)) {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 40,height: 40)
                    .padding(.trailing,10)
                    .padding(.bottom,5)
                    
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
