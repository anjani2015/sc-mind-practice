//
//  ViewController.swift
//  CoreData_SampleTest
//
//  Created by Mittal, Anjani (external - Temp Staff) on 5/21/15.
//  Copyright (c) 2015 Mittal, Anjani (external - Temp Staff). All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var formatter = NSDateFormatter()
    @IBOutlet weak var activityDateTextField: UITextField!
    @IBOutlet weak var activityTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        formatter.dateFormat = "YYYY-MM-dd hh:mm:ss a"
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "selectedActivityDate:", name: "activityDate", object: nil)
    }

    deinit{
       NSNotificationCenter.defaultCenter().removeObserver(self, name: "activityDate", object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func selectedActivityDate(notification : NSNotification)
    {
        let activityDate = formatter.stringFromDate(notification.object as NSDate)
        println(activityDate)
        self.activityDateTextField.text = activityDate
    }
    
    @IBAction func save_TouchUpInside(sender: UIButton) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedCtxt = appDel.managedObjectContext!
        
        let dairyDataTemp = NSEntityDescription.insertNewObjectForEntityForName("DailyDairy", inManagedObjectContext: managedCtxt) as DailyDairy
        
        dairyDataTemp.activityOnDate = formatter.dateFromString(self.activityDateTextField.text)
        dairyDataTemp.activityDesc = activityTextView.text
        
        var error : NSError?
        managedCtxt.save(&error)
        
        if let err = error{
            println(err.localizedFailureReason)
        }
        else{
            self.activityDateTextField.text = ""
            self.activityTextView.text = ""
            println("Activity saved successfully")
        }
    }
    
    @IBAction func unWindSegue (segue: UIStoryboardSegue){
        
    }

}

