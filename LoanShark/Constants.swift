//
//  Constants.swift
//  LoanShark
//
//  Created by James Kim on 8/10/15.
//
//

import Foundation

enum Status : Int {
    case Created
    case Ongoing
    case Paid
    case Defaulted
    case Rejected
}

enum NegStatus : Int {
    case Negotiated
    case Accepted
    case Rejected
}