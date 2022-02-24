//
//  ViewController.swift
//  willset
//
//  Created by Keshav Raj Kashyap on 24/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var topView: UIView!
    var myNameArray = [String](){
        didSet{
            if self.myNameArray != oldValue{
                tableView.reloadData()
            }
        }willSet(resultData){
                self.myNameArray = resultData
            }
        }
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableView.delegate = self
        tableView.dataSource = self
        topView.isHidden = true
        tableView.isHidden = false
//        tableView.reloadData()
        print(myNameArray)
        // Do any additional setup after loading the view.
    }

    @IBAction func addButton(_ sender: Any) {
        tableView.isHidden = true
        topView.isHidden = false
    }
    
    @IBAction func doneButton(_ sender: Any) {
        topView.isHidden = true
        myNameArray.append( inputTextField.text!)
         print(myNameArray)
        tableView.isHidden = false
//        tableView.reloadData()
        inputTextField.text = ""
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as?TableViewCell{
            cell.nameArray.text = myNameArray[indexPath.row]
            return cell
        }
      return UITableViewCell()

    }
}
