//
//  SearchViewController.swift
//  TicketGO
//
//  Created by Sezil Akdoğan on 2.04.2023.
//

import UIKit

class PickerViewController: UIViewController {
    
    let cities = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Iğdır", "Isparta", "İstanbul", "İzmir", "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri", "Kırıkkale", "Kırklareli", "Kırşehir", "Kilis", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Mardin", "Mersin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Osmaniye", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Şanlıurfa", "Şırnak", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", "Yalova", "Yozgat", "Zonguldak"]
    var selectedFromCity: String?
    var selectedToCity: String?
    var selectedCity: String?

    var selectedDate: Date?
    let dateFormatter = DateFormatter()

    
    var model: [TicketSelectModel] = []
    var secondModel = TicketDate()
    var thirdModel = Clock()
   
    @IBOutlet weak var fromCityPickerView: UIPickerView!
    @IBOutlet weak var toCityPickerView: UIPickerView!
    @IBOutlet weak var datePickerOulet: UIDatePicker!
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        selectedDate = sender.date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TicketSelectViewController") as! TicketSelectViewController
        dateFormatter.dateFormat = "dd/MM/YY"
        let date = dateFormatter.string(from: selectedDate ?? Date())
        
        controller.company = [TicketSelectModel(
            companyImage: UIImage(named: "metro")!,
            fromCity: selectedFromCity,
            toCity: selectedToCity,
            time: date,
            ticketClock: "11:00",
            price: "300"),
        TicketSelectModel(
            companyImage: UIImage(named: "truva")!,
            fromCity: selectedFromCity,
            toCity: selectedToCity,
            time: date,
            ticketClock: "12:30",
            price: "200"),
        TicketSelectModel(
            companyImage: UIImage(named: "ulusoy")!,
            fromCity: selectedFromCity,
            toCity: selectedToCity,
            time: date,
            ticketClock: "13:00",
            price: "100"),
        TicketSelectModel(
            companyImage: UIImage(named: "varan")!,
            fromCity: selectedFromCity,
            toCity: selectedToCity,
            time: date,
            ticketClock: "14:30",
            price: "150"),
         TicketSelectModel(
            companyImage: UIImage(named: "nilüfer")!,
            fromCity: selectedFromCity,
            toCity: selectedToCity,
            time: date,
            ticketClock: "15:00",
            price: "300"),
        TicketSelectModel(
            companyImage: UIImage(named: "truva")!,
            fromCity: selectedFromCity,
            toCity: selectedToCity,
            time: date,
            ticketClock: "16:30",
            price: "200")
        ]
    
       navigationController?.pushViewController(controller, animated: true)
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
    
 
}

