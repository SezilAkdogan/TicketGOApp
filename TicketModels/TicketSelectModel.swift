//
//  TicketSelectModel.swift
//  TicketGO
//
//  Created by Sezil Akdoğan on 3.04.2023.
//

import Foundation
import UIKit

struct TicketSelectModel {
    let companyImage: UIImage
    let fromCity: String?
    let toCity: String?
    let time: String?
    let price: String
    let cities = ["Adana", "Ankara", "Bursa", "İstanbul", "İzmir", "Tekirdağ"]
    
}
