//
//  SeatCollectionViewCell.swift
//  TicketGO
//
//  Created by Sezil Akdoğan on 4.04.2023.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var seatNumber: UILabel!
    @IBOutlet weak var seatImg: UIImageView!
    
    var isThisChairSold = false
    let image = UIImage(named: "seatImg")?.withRenderingMode(.alwaysOriginal)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        seatImg.translatesAutoresizingMaskIntoConstraints = false
        seatImg.layer.masksToBounds = true
        seatImg.image = image
        seatImg.contentMode = .scaleAspectFit
    }

    func configure(with seatNumber: Int) {
        self.seatNumber.text = String(seatNumber)
    }
}
    


