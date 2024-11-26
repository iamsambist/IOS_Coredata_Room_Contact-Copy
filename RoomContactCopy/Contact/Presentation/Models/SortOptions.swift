//
//  SortOptions.swift
//  RoomContactCopy
//
//  Created by MacBook Two on 25/11/2024.
//

import Foundation

enum SortOptions {
    case FIRST_NAME
    case LAST_NAME
    case PHONE_NUMBER
}

enum CoreDataSortOptions : String {
    case firstName = "firstName"
    case lastName = "lastName"
    case phoneNumber = "phoneNumber"
}
