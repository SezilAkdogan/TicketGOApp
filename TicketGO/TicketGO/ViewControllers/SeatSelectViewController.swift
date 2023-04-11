//
//  SeatSelectCollectionViewController.swift
//  TicketGO
//
//  Created by Sezil Akdoğan on 3.04.2023.
//

import UIKit

private enum Constant {
    static let reuseIdentifier: String = "Cell"
}

class SeatSelectViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var availableImg: UIImageView!
    @IBOutlet weak var selectedImg: UIImageView!
    @IBOutlet weak var soldImg: UIImageView!
    @IBOutlet weak var availableLbl: UILabel!
    @IBOutlet weak var selectedLbl: UILabel!
    @IBOutlet weak var soldLbl: UILabel!
    @IBOutlet weak var seatCollectionView: UICollectionView!
    @IBOutlet weak var passengerName: UITextField!
    @IBOutlet weak var passengerSurname: UITextField!
    @IBOutlet weak var passengerID: UITextField!
    
    var passenger: Passenger?
    var selectedChairCount = 0
    var selectedChairs = [Int]()
    var soldChairs = [Int]()
    //Aktarım
    var selectedInfo: TicketSelectModel?
    
    let userDefault = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seatCollectionView.register(UINib(nibName: "SeatCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constant.reuseIdentifier)
        seatCollectionView.collectionViewLayout = createSeats()
        seatCollectionView.delegate = self
        seatCollectionView.dataSource = self

       // configReserveButton()
        soldChairs = userDefault.array(forKey: "soldChairs") as? [Int] ?? [Int]()
            
        //stackView.layer.cornerRadius = 15
        selectedImg.image = UIImage(named: "selected")
        soldImg.image = UIImage(named: "sold")
        availableImg.image = UIImage(named: "seatImg")
        
    }
       
    func createSeats() -> UICollectionViewLayout {
        let seatSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0))
            
        let item = NSCollectionLayoutItem(layoutSize: seatSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 50, bottom: 5, trailing: -40)
            
        let rightSideGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(70))
        let rightSideGroup = NSCollectionLayoutGroup.horizontal(layoutSize: rightSideGroupSize, subitem: item, count: 2)
            
        let leftSideGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                                           heightDimension: .absolute(70))
        let leftSideGroup = NSCollectionLayoutGroup.horizontal(layoutSize: leftSideGroupSize, subitem: item, count: 1)
            
        let wholeSeatsGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80))
            
        let wholeSeatsGroup = NSCollectionLayoutGroup.horizontal(layoutSize: wholeSeatsGroupSize, subitems: [leftSideGroup, rightSideGroup])
            
        wholeSeatsGroup.interItemSpacing = .fixed(60)
            
        let section = NSCollectionLayoutSection(group: wholeSeatsGroup)
        section.interGroupSpacing = 5
            
        let seatLayout = UICollectionViewCompositionalLayout(section: section)
        return seatLayout
    }
        
    
    @IBAction func confirmClicked(_ sender: Any) {
        
        if selectedChairs.count == 0 {
            let alert = UIAlertController(title: "No Seats Selected", message: "You must choose at least 1 seat", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            for i in 0...selectedChairs.count-1{
                soldChairs.append(selectedChairs[i])
            }
            userDefault.set(soldChairs, forKey: "soldChairs")
            let controller = storyboard?.instantiateViewController(withIdentifier: "TicketInformationViewController") as! TicketInformationViewController
           
            if passengerName.text!.isEmpty || passengerSurname.text!.isEmpty || passengerID.text!.isEmpty {
                let alert = UIAlertController(title: "Error", message: "You must enter passenger information ", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                
            } else {
                let passenger = Passenger(name: passengerName.text!, surname: passengerSurname.text!, id: Int(passengerID.text!)!)
                
                //guard let price = selectedInfo?.price else { return }
                controller.fromLabelText = selectedInfo?.fromCity
                controller.toLabelText = selectedInfo?.toCity
                controller.dateLabelText = selectedInfo?.time
                controller.reservedSeatLabelText = String(selectedChairs.count)
                controller.clockLabelText = selectedInfo?.ticketClock
                controller.priceLabelText = String(selectedChairs.count * (Int(selectedInfo?.price ?? "") ?? 0))
                controller.selectedSeatsText = selectedChairs
                controller.passengerInfo = passenger
                controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .crossDissolve
                
                navigationController?.pushViewController(controller, animated: true)
                
            }
            
        }
        
    }
    
}
//MARK: Delegate, Data Source
extension SeatSelectViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        45
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.reuseIdentifier, for: indexPath) as! SeatCollectionViewCell
        cell.configure(with: indexPath.row)
        
     
       /* if soldChairs.contains(indexPath.row + 1){
            //cell.tintColor = .lightGray
            cell.seatImg.image = UIImage(named: "selected")
            //cell.isThisChairSold = true
        } else {
            cell.seatImg.image = UIImage(named: "sold")
        }*/
          
        
        // Koltuk seçili ise arka planını değiştir
        if selectedChairs.contains(indexPath.row) {
            cell.seatImg.image = UIImage(named: "sold")
        } else {
            cell.seatImg.image = UIImage(named: "seatImg")
        }
        cell.seatNumber.text = "\(indexPath.row + 1)"
        return cell
        
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Seat: ", indexPath.row)
        
        if selectedChairs.contains(indexPath.row) {
            if let index = selectedChairs.firstIndex(of: indexPath.row) {
                selectedChairs.remove(at: index)
               
            }
        } else {
            // Kontrol ekle
            if selectedChairs.count >= 5 {
                let alert = UIAlertController(title: "Error", message: "You can't choose more than 5 seats", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
            }
            selectedChairs.append(indexPath.row)
        }
        collectionView.reloadData()
    }
}
        
 
