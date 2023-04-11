//
//  TicketSelectCell.swift
//  TicketGO
//
//  Created by Sezil Akdoğan on 3.04.2023.
//

import UIKit

class TicketSelectCell: UITableViewCell {

    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var fromName: UILabel!
    @IBOutlet weak var toName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var dateClock: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ model: TicketSelectModel) {
        companyImage.image = model.companyImage
        fromName.text = model.fromCity
        toName.text = model.toCity
        time.text = model.time
        dateClock.text = model.ticketClock
        price.text = model.price
       
    }
    
}
