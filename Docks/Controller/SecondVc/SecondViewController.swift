//
//  SecondViewController.swift
//  Docks
//
//  Created by Василий  on 14.02.2022.
//

import UIKit
import MobileCoreServices

class SecondViewController: UIViewController, UIDocumentPickerDelegate {
    
    var nameLable: String?

    @IBOutlet weak var lableSecondName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lableSecondName.text = nameLable
    }

    @IBAction func addToDoc(_ sender: Any) {
        
        let allertController = UIAlertController(title: "Выберите файл", message: "", preferredStyle: .actionSheet)
        let file = UIAlertAction(title: "Файл", style: .default) { _ in
            let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypePDF as String], in: .import)
            documentPicker.delegate = self
            documentPicker.allowsMultipleSelection = false
            
            self.present(documentPicker, animated: true, completion: nil)
        }
        
        let photo = UIAlertAction(title: "Сделать фото", style: .default) { _ in }
        let cancel = UIAlertAction(title: "Отменить", style: .default) { _ in }
        allertController.addAction(file)
        allertController.addAction(photo)
        allertController.addAction(cancel)
        present(allertController, animated: true, completion: nil)
    }
}

extension ViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
    }
}
