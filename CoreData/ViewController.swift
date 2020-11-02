//
//  ViewController.swift
//  CoreData
//
//  Created by Niroj Thapa on 11/2/20.
//

import UIKit
import FloatingButtonPOP_swift
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,FloaterViewDelegate {
    let items = ["Item 1", "Item2", "Item3", "Item4"]

    func userDidTapOnItem(at index: Int, with model: String) {
        print(index)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let typeSelectionVC = storyboard.instantiateViewController(identifier: "AddPurchaseViewController") as! AddPurchaseViewController
        typeSelectionVC.modalPresentationStyle = .overFullScreen
        typeSelectionVC.shouldDismissViewOnTapOutside = true
        typeSelectionVC.shouldAddFullOverlay = true
        self.present(typeSelectionVC, animated: true)

    }
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomePageTableViewCell", bundle: nil), forCellReuseIdentifier: "HomePageTableViewCell")
        self.addFloatingButton()

    }
    func addFloatingButton(){
        addFloaterMenu(with: [("Add Items", UIImage(named: "Image"))], mainItem: ("", UIImage(named: "Image")), dropShadow: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTableViewCell", for: indexPath) as! HomePageTableViewCell
        cell.lbl_po_id.text = items[indexPath.row]
        cell.lbl_lastUpadte.text = items[indexPath.row]
        cell.lbl_total_items.text = items[indexPath.row]
               return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

