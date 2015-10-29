//
//© Copyright 2015 IBM Corp.
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

import UIKit
import PresenceInsightsSDK
import CoreLocation


//need to add CLLocationManagerDelegate and PIBeaconSensorDelegate
//PiBeaconSensorDelegate is needed to run method didRangeBeacons. getting all the ranged beacons 
//CLLocationManagerDelegate is needed to access and request authoriztion to use ble location
class ViewController: UIViewController, CLLocationManagerDelegate, PIBeaconSensorDelegate{
    
    //initializing the parameters (BM info)
    //initializing objects: PIBeaconSensor, PIAdapter, CLLocationmanger
    let locationManager = CLLocationManager()
    let tenantID = ""
    let orgID = ""
    let username = ""
    let passwd = ""
    let siteID = ""
    let floorID = ""
    let baseURL =  ""
    

    
    var piBeaconSensor : PIBeaconSensor!
    var piAdapter : PIAdapter!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //creating piAdapter with bm credentials/info
        piAdapter = PIAdapter(tenant: tenantID,
            org: orgID,
            baseURL: baseURL,
            username: username,
            password: passwd)
        //piAdapter.enableLogging()
        //creating piBeaconsensor with piAdapater that we created above
        piBeaconSensor = PIBeaconSensor(adapter: piAdapter)
        
        //setting piBeaconSensor to self to run didRangeBeacons
        piBeaconSensor.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //setting locationManager to self
        locationManager.delegate = self
 
        //checking and asking user for allowing ble location access
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse)
        {
            locationManager.requestWhenInUseAuthorization()
        }
       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startSensing(sender: UIButton) {
        
        //sdk call for start sensing
        //call back is necessary
        piBeaconSensor.start { (NSError) -> () in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if(NSError == nil){
                    self.alert("Success", messageInput: "Started Sensing for Beacons")
                }
                else{
                    self.alert("Error", messageInput: "\(NSError)")
                }
            })
        }
    }
    
    @IBAction func stopSensing(sender: UIButton) {
        //sdk call to stop beacon sensing
        piBeaconSensor.stop()
        alert("Success", messageInput: "Successfully stopped sensing for beacons")

    }
    
    @IBAction func getUUID(sender: UIButton) {
        
        //getes UUID from PI instance
        piAdapter.getAllBeaconRegions { (uuids, NSError) -> () in
            // Do whatever you want with the beacon UUIDs here.
            
            //for this app, we will pop up message with the list of UUIDs
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if(NSError == nil){
                    self.alert("UUIDS", messageInput: "UUID: \(uuids)")
                }
                else{
                    self.alert("Error", messageInput: "\(NSError)")
                }
            })
        }
    }

    @IBAction func getBeacons(sender: UIButton) {
        
        piAdapter.getAllBeacons(siteID, floor: floorID) { (beacons, NSError) -> () in
            //you can do whatever you want with the beacons that returned.
            //for demo purposes will display number of beacons
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if(NSError == nil){
                    let num = beacons.count
                    self.alert("Number of Beacons", messageInput: "Total number of beacons for the floor: \(num)")
                }
                else{
                    self.alert("Error", messageInput: "\(NSError)")
                }
            })
            
        }
        
       
    }
    
    
    func didRangeBeacons(beacons: [CLBeacon]) {
        // Do whatever you want with the ranged beacons here.
        //anything you want to locally on the app goes here
        
        //for testing purposes. will just print out to the console
        print(beacons)
    }
    
    //function to easily create alert messages
    func alert(titleInput : String , messageInput : String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
  
   

}

