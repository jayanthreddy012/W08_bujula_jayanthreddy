//
//  ViewController.swift
//  oct_11_coredata
//
//  Created by Jayanth Bujula on 10/12/18.
//  Copyright © 2018 Teamproject. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var courseTitle: UITextField!
    @IBOutlet weak var courseNum: UITextField!
    @IBOutlet weak var deptAbbr: UITextField!
    // strings that hold textfield results
    var  deptAbbrResult = ""
    var  courseNumResult: Int16 = 0
    var  courseTitleResult = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         deptAbbr.delegate = self
        courseTitle.delegate = self
        courseNum.delegate = self
    }
    @IBAction func saveInfo(_ sender: UIButton) {
        // alert if textfields are empty
         if (deptAbbr.text?.isEmpty)!{
            let alertcontroller = UIAlertController(title: "Department Abbreviation is empty!!", message: "Add all fields to save", preferredStyle: .alert)
            let alertaction = UIAlertAction(title: "Back", style: .cancel, handler: nil)
            alertcontroller.addAction(alertaction)
            present(alertcontroller, animated: true)
        }else if (courseNum.text?.isEmpty)!{
            let alertcontroller = UIAlertController(title: "Course number is empty!!", message: "Add all fields to save", preferredStyle: .alert)
            let alertaction = UIAlertAction(title: "Back", style: .cancel, handler: nil)
            alertcontroller.addAction(alertaction)
            present(alertcontroller, animated: true)
        }else if(courseTitle.text?.isEmpty)!{
            let alertcontroller = UIAlertController(title: "Course title is empty!!", message: "Add all fields to save", preferredStyle: .alert)
            let alertaction = UIAlertAction(title: "Back", style: .cancel, handler: nil)
            alertcontroller.addAction(alertaction)
            present(alertcontroller, animated: true)
        }  else {
            // unwindsegue to table controller
            performSegue(withIdentifier: "unwindidentifier", sender: self)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        deptAbbrResult = deptAbbr.text ?? "Bad DeprAbbr"
        courseNumResult = Int16(courseNum.text ?? "-1")!
        courseTitleResult = courseTitle.text ?? "Bad Title"
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        deptAbbr.resignFirstResponder()
        courseTitle.resignFirstResponder()
        courseNum.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // restrict to enter only numbers in course number field
        if textField.tag == 1{
            let allowCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowCharacters.isSuperset(of: characterSet)
        }
        return true
    }
}

