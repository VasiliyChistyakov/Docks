//
//  OnceViewController.swift
//  Docks
//
//  Created by Василий  on 14.02.2022.
//

import UIKit

class OnceViewController: UIViewController {
    
    var nameLable: String?
    let dateFormater = DateFormatter()
    var openDate: String!
    var exitDate: String!
    
    @IBOutlet weak var oneDate: UILabel!
    @IBOutlet weak var onceNameLabel: UILabel!
    @IBOutlet weak var twoDate: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var oneButtonLabel: UIButton!
    @IBOutlet weak var twoButtonLabel: UIButton!
    @IBOutlet weak var tapButtonLabel: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormater.dateFormat = "dd MMM,yyyy"
        
        self.onceNameLabel.text = nameLable
        
    }
    
    
    @IBAction func dateTapAction(_ sender: UIButton) {
        let open = "\(dateFormater.string(from: datePicker.date))"
        if !open.isEmpty {
            openDate = open
            oneDate.text = "с \(open)" }
    }
    
    @IBAction func twoDateTapAction(_ sender: UIButton) {
        let exit = "\(dateFormater.string(from: datePicker.date))"
        if !exit.isEmpty {
            exitDate = exit
            twoDate.text = "с \(exit)"
        }
    }
    
    @IBAction func openList(_ sender: UIButton) {
        guard let openDateList = openDate, let exitDateList = exitDate else { return errorFetchAllert()}
        let date = "c \(openDateList) по \(exitDateList) "
        fetchAllert(date: date)
    }
    
    func fetchAllert(date: String) {
        if nameLable == "Сообщить о болезни" {
            let ac = UIAlertController(title: "Скорейшего выздоровления 👩‍⚕️" , message: "БЛ открыт \(date)" , preferredStyle: .alert)
            let ok = UIAlertAction(title: "Отправить данные о БЛ", style: .default) { _ in
                self.navigationController?.popToRootViewController(animated: true)
            }
            let change = UIAlertAction(title: "Изменить дату", style: .default) { _ in }
            
            ac.addAction(ok)
            ac.addAction(change)
            
            present(ac, animated: true, completion: nil)
        } else {
            let ac = UIAlertController(title: "Оставайтесь дома 🏠" , message: "Удаленная работа \(date)" , preferredStyle: .alert)
            let ok = UIAlertAction(title: "Отправить на согласование", style: .default) { _ in
                self.navigationController?.popToRootViewController(animated: true)
            }
            let change = UIAlertAction(title: "Изменить дату", style: .default) { _ in }
            
            ac.addAction(ok)
            ac.addAction(change)
            
            present(ac, animated: true, completion: nil)
            
        }
    }
    
    func errorFetchAllert() {
        let ac = UIAlertController(title: "Заполнены не все поля 🤦‍♀️", message: "Проверьте правильность заполнения полей, и попробуйте еще раз", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { _ in }
        
        ac.addAction(ok)
        
        present(ac, animated: true, completion: nil)
    }
    
}


