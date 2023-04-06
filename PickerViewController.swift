//
//  SearchViewController.swift
//  TicketGO
//
//  Created by Sezil Akdoğan on 2.04.2023.
//

import UIKit

class PickerViewController: UIViewController {
    
    let cities = ["Adana", "Ankara", "Bursa", "İstanbul", "İzmir", "Tekirdağ"]
    var selectedCity: String?

    var selectedFromCity: String?
    var selectedToCity: String?

    var selectedDate: Date?
    let dateFormatter = DateFormatter()
    
    var model: [TicketSelectModel] = []
    var secondMmodel = TicketDate()
   
    @IBOutlet weak var fromCityPickerView: UIPickerView!
    @IBOutlet weak var toCityPickerView: UIPickerView!
    @IBOutlet weak var datePickerOulet: UIDatePicker!
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        //selectedDate = sender.date
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TicketSelectViewController") as! TicketSelectViewController
        dateFormatter.dateFormat = "YY/MM/dd"
        let a = dateFormatter.string(from: selectedDate ?? Date())


        controller.company = [TicketSelectModel(
            companyImage: UIImage(named: "metro")!,
            fromCity: selectedFromCity,
            toCity: selectedToCity,
            time: a,
            price: "300"),
        TicketSelectModel(
            companyImage: UIImage(named: "truva")!,
            fromCity: selectedFromCity,
            toCity: selectedToCity,
            time: a,
            price: "300")]

        navigationController?.pushViewController(controller, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SeatSelectViewController") as! SeatSelectViewController
       vc.goTicketInfoDate = TicketDate(day: a)
        
    }
    
}

extension PickerViewController: UIPickerViewDelegate ,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView {
        case toCityPickerView:
            selectedToCity = cities[row]
        case fromCityPickerView:
            selectedFromCity = cities[row]
        default:
            break
        }
    }
    
  
  /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? TicketSelectViewController {
            destinationVC.fromCity = String(fromCityPickerView.selectedRow.)
            destinationVC.toCity = String(toCityPickerView.selectedRow(inComponent: 0))
        }
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TicketSelectViewController {
            destination.selectedDate = (presentingViewController as? PickerViewController )?.selectedDate
        }
    }
    
}

