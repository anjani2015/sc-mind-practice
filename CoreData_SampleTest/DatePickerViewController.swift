//
//  DatePickerViewController.swift
//  CoreData_SampleTest
//
//  Created by Mittal, Anjani (external - Temp Staff) on 5/22/15.
//  Copyright (c) 2015 Mittal, Anjani (external - Temp Staff). All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var pickerView: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func done_TouchUpInside(sender: UIBarButtonItem) {
        NSNotificationCenter.defaultCenter().postNotificationName("activityDate", object: pickerView.date)
        self .dismissViewControllerAnimated(true, completion: nil)
    }
}
