//
//  Ticket.swift
//  TicketGO
//
//  Created by Sezil Akdoğan on 2.04.2023.
//

import Foundation
import UIKit

struct Ticket {
    var passenger: Passenger
    var date: TicketDate
    var clock: Clock
    var from: String?
    var to: String?
    var selectedChairCount: Int?
    var selectedChairs: [Int]?
}
