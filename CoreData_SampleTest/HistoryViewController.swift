//
//  HistoryViewController.swift
//  CoreData_SampleTest
//
//  Created by Mittal, Anjani (external - Temp Staff) on 5/22/15.
//  Copyright (c) 2015 Mittal, Anjani (external - Temp Staff). All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    var historyData = [DailyDairy]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadDairy()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDairy(){
        var error: NSError? = nil
        let appDel = UIApplication.sharedApplication().delegate as AppDelegate
        let managedCtx = appDel.managedObjectContext!
        
        let fetchReq = NSFetchRequest(entityName: "DailyDairy") as NSFetchRequest
        let sortReq = NSSortDescriptor(key: "activityOnDate", ascending: false)
        fetchReq.sortDescriptors = [sortReq]
        fetchReq.returnsObjectsAsFaults = false
        
        let data : [AnyObject] = managedCtx.executeFetchRequest(fetchReq, error: &error)!
        historyData = data as [DailyDairy]
        println(data)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("dairyCellIdentifier") as UITableViewCell
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "YYYY-MM-dd hh:mm:ss a"
        
        let dataTemp = historyData[indexPath.row]
        
        cell.textLabel?.text = dataTemp.activityDesc
        cell.detailTextLabel?.text = formatter.stringFromDate(dataTemp.activityOnDate)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}
