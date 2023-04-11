//
//  TicketSelectViewController.swift
//  TicketGO
//
//  Created by Sezil Akdoğan on 3.04.2023.
//

import UIKit

class TicketSelectViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var company: [TicketSelectModel] = []
    var fromCity: String?
    var toCity: String?
    var selectedDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.systemYellow
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: "TicketSelectCell", bundle: nil), forCellReuseIdentifier: "ticketCell")
    }
    
}

extension TicketSelectViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        company.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! TicketSelectCell
        cell.configure(company[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
       let controller = storyboard?.instantiateViewController(withIdentifier: "SeatSelectViewController") as! SeatSelectViewController
        let selectInformation = company[indexPath.row]
        controller.selectedInfo = selectInformation
       navigationController?.pushViewController(controller, animated: true)
        
    }

}
