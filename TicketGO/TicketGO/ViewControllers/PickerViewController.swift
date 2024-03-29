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
   
    var fromCityPickerView = UIPickerView()
    var toCityPickerView = UIPickerView()
    
    @IBOutlet weak var fromCityTextField: UITextField!
    @IBOutlet weak var toCityTextField: UITextField!
    
    var selectedDate: Date?
    let dateFormatter = DateFormatter()
   
    @IBOutlet weak var datePickerOulet: UIDatePicker!
    @IBAction func datePicker(_ sender: UIDatePicker) {
        selectedDate = sender.date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromCityTextField.inputView = fromCityPickerView
        toCityTextField.inputView = toCityPickerView
        fromCityPickerView.delegate = self
        fromCityPickerView.dataSource = self
        toCityPickerView.delegate = self
        toCityPickerView.dataSource = self
        fromCityPickerView.tag = 1
        toCityPickerView.tag = 2
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonClickedFromPicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        doneButton.tintColor = .systemOrange
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([spaceButton, doneButton], animated: false)
        self.fromCityTextField.inputAccessoryView = toolbar
        self.toCityTextField.inputAccessoryView = toolbar

    }
    @objc func doneButtonClickedFromPicker() {
        self.fromCityTextField.resignFirstResponder()
        self.toCityTextField.resignFirstResponder()

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
            price: "350"),
         TicketSelectModel(
            companyImage: UIImage(named: "nilüfer")!,
            fromCity: selectedFromCity,
            toCity: selectedToCity,
            time: date,
            ticketClock: "19:00",
            price: "250"),
         TicketSelectModel(
            companyImage: UIImage(named: "metro")!,
            fromCity: selectedFromCity,
            toCity: selectedToCity,
            time: date,
            ticketClock: "20:30",
            price: "200"),
        ]
        if fromCityTextField.text?.isEmpty == true || toCityTextField.text?.isEmpty == true {
            let alert = UIAlertController(title: "Error", message:"Please you must choose a city", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else if fromCityTextField.text == toCityTextField.text {
            let alert = UIAlertController(title: "Error", message:"Departure and arrival points cannot be the same.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }else {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}

extension PickerViewController: UIPickerViewDelegate ,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return cities.count
        case 2:
            return cities.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return cities[row]
        case 2:
            return cities[row]
        default:
            return "Data not found!"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case 1:
            fromCityTextField.text = cities[row]
            //fromCityTextField.resignFirstResponder()
            selectedFromCity = cities[row]
        case 2:
            toCityTextField.text = cities[row]
            //toCityTextField.resignFirstResponder()
            selectedToCity = cities[row]
        default:
            break
        }
    }
}

