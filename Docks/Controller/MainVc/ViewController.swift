//
//  ViewController.swift
//  Docks
//
//  Created by Василий  on 14.02.2022.
//

import UIKit

enum Actions: CaseIterable {
    
    case сertificateOfVaccination
    case reportIllness
    case switchToRemoteWork
    case hrSupport
    case technicalSupport
    
    func getCases() -> TableArray {
        switch self {
        case .сertificateOfVaccination:
            return TableArray(iconNamle: "💉", nameLable: "Сертификат о вакцинации")
        case .reportIllness:
            return TableArray(iconNamle: "👩‍⚕️", nameLable: "Сообщить о болезни")
        case .switchToRemoteWork:
            return TableArray(iconNamle: "🧑‍💻", nameLable: "Перейти на удаленную работу")
        case .hrSupport:
            return TableArray(iconNamle: "👩‍💼", nameLable: "Получить консультацию HR")
        case .technicalSupport:
            return TableArray(iconNamle: "👨‍🔧", nameLable: "Сломалась техника")
        }
    }
}


class ViewController: UIViewController {
    
    let actions = Actions.allCases
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        array = [
        //            TableArray(iconNamle: "🏄", nameLable: "Ваш отпуск"),
        //            TableArray(iconNamle: "💸", nameLable: "Ваш оклад")
        //
        //        ]
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.iconLabel.text = actions[indexPath.row].getCases().iconNamle
        cell.nameLabel.text = actions[indexPath.row].getCases().nameLable
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let action = actions[indexPath.row]
        
        switch action {
        case .сertificateOfVaccination:
            performSegue(withIdentifier: "SecondVC", sender: indexPath)
        case .reportIllness:
            performSegue(withIdentifier: "OnceVC", sender: indexPath)
        case .switchToRemoteWork:
            performSegue(withIdentifier: "OnceVC", sender: indexPath)
        case .technicalSupport:
            performSegue(withIdentifier: "SupportVC", sender: indexPath)
        case .hrSupport:
            performSegue(withIdentifier: "SupportVC", sender: indexPath)
        }
          
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVC" {
            let nameLabelSecond = segue.destination as! SecondViewController
            let indexPath = sender as! IndexPath
            
            let nameLabel = actions[indexPath.row].getCases().nameLable
            nameLabelSecond.nameLable = nameLabel
        }
        
        if segue.identifier == "OnceVC" {
            let nameLabelOnce = segue.destination as! OnceViewController
            let indexPath = sender as! IndexPath
            
            let nameLabel = actions[indexPath.row].getCases().nameLable
            nameLabelOnce.nameLable = nameLabel
        }
    }
}

