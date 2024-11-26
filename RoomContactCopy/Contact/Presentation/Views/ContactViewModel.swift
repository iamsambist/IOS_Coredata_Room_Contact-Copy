//
//  ContactViewModel.swift
//  RoomContactCopy
//
//  Created by MacBook Two on 25/11/2024.
//

import Foundation
import CoreData

class CoreViewModel : ObservableObject {
    @Published var userInformation = UserContactDetails(firstName: "", lastName: "", phoneNumber: "")
    @Published var sortType : String = CoreDataSortOptions.firstName.rawValue
    
    @Published var savedCotact : [ContactDetails] = []
    
    let container : NSPersistentContainer
    init(){
        self.container = NSPersistentContainer(name: "ContactContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error while Loading data. \(error)")
            }
        }
        fetchUserContact(sortedBy: sortType) // Ensure initial data is loaded
    }
    func fetchUserContact() {
        let fetchRequest = NSFetchRequest<ContactDetails>(entityName: "ContactDetails")
        
        
        
        do {
            savedCotact = try container.viewContext.fetch(fetchRequest)
            
        } catch let error {
            print("Error While fetching CoreData \(error)")
        }
    }
    func fetchUserContact(sortedBy : String?){
        let fetchRequest = NSFetchRequest<ContactDetails>(entityName: "ContactDetails")
        
        if let sortKey = sortedBy {
               fetchRequest.sortDescriptors = [NSSortDescriptor(key: sortKey, ascending: true)]
           }
        
        do {
            savedCotact = try container.viewContext.fetch(fetchRequest)
            
        } catch let error {
            print("Error While fetching CoreData \(error)")
        }
    }
    
    func addUserContact( ){
        let contactDetailEntity = ContactDetails(context: container.viewContext)
        contactDetailEntity.firstName = userInformation.firstName
        contactDetailEntity.lastName = userInformation.lastName
        contactDetailEntity.phoneNumber = userInformation.phoneNumber
        saveData()
        fetchUserContact(sortedBy: sortType) // Automatically update savedCotact after adding a contact
    }
    
    func deleteUser(indexSet : IndexSet){
        var index = indexSet.first!
        var targetUserDetail = savedCotact[index]
        container.viewContext.delete(targetUserDetail)
        saveData()
        fetchUserContact(sortedBy: sortType)
    }
    func saveData(){
        do {
            try container.viewContext.save()
        } catch let error {
            print("error while saving \(error)")
        }
    }
}
