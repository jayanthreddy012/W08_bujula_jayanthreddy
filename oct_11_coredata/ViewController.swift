//
//  ViewController.swift
//  oct_11_coredata
//
//  Created by Jayanth Bujula on 10/12/18.
//  Copyright © 2018 Teamproject. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var courseTitle: UITextField!
    @IBOutlet weak var courseNum: UITextField!
    @IBOutlet weak var deptAbbr: UITextField!
    var  deptAbbrResult = ""
    var  courseNumResult: Int16 = 0
    var  courseTitleResult = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        deptAbbrResult = deptAbbr.text ?? "Bad DeprAbbr"
        courseNumResult = Int16(courseNum.text ?? "-1")!
        courseTitleResult = courseTitle.text ?? "Bad Title"
    }

}

