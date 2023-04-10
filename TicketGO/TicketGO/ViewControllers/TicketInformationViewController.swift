//
//  TicketInformationViewController.swift
//  TicketGO
//
//  Created by Sezil Akdoğan on 3.04.2023.
//

import UIKit

class TicketInformationViewController: UIViewController {
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var passengerInfoLabel: UILabel!
    
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var reservedSeatsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    var passengerInfo : Passenger!
    var ticket: Ticket!
    var hour: String!
    var minute: String!
    
    var fromLabelText: String?
    var toLabelText: String?
    var dateLabelText: String?
    var passengerInfoLabelText: String?
    var reservedSeatLabelText: String?
    var reservedSeatNumber: String?
    var priceLabelText: String?
    var selectedSeatsText: [Int] = []
    var stringSeat: String = ""
    var clockLabelText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromLabel.text = fromLabelText?.uppercased()
        toLabel.text = toLabelText?.uppercased()
        dateLabel.text = dateLabelText
        clockLabel.text = clockLabelText
        reservedSeatsLabel.text = reservedSeatLabelText
        priceLabel.text = (priceLabelText ?? "") + "₺"
        passengerInfoLabel.text = "\(passengerInfo.name.uppercased()) \(passengerInfo.surname.uppercased()) \(passengerInfo.id)"
        for seat in selectedSeatsText {
            stringSeat += String(seat + 1) + ", "
        }
        totalPrice.text = String(stringSeat.dropLast(2))
        
    }
}


