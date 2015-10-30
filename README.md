# IBM Presence Insights Beacon Sensing 

The purpose of this application is to show how to leverage the Presence Insights SDK for beacon sensing for IOS (Swift).

You must use a IOS device to use a beacon SDK as the Xcode simulator does not support beacons. 

1. Open PIBeaconSDK.xcodeproj.
2. Edit the ViewController.swift file to update the Bluemix credentials, tenantID, orgID, siteID, floorID, username and password. Note that all of this information can be found in your Presence Insights Dashboard.
3. Select your IOS device instead of the simulator.
3. Click **Play** to build and run the application.

The ViewController.swift appliction is a great way to see how objects are initialized and implemented. The application will perform an initial check to see if the device is already registered. If the device is registered, it will alert the user and populate the device name and type.

The sample application contains the following fields and options:

* **Start Sensing**
	- Device will start scanning for nearby beacons and if the beacon exist in the Presence Insights, it will send that location payload to Presence Insights.
	- The application alerts the user stating it successfully started scanning.
* **Get UUID for Beacons**
	- Grabs all the UUIDs from the Presence Insights and list all pop up messages.
* **Get Beacons on the Floor**
	- The application grabs the beacons and alerts the user of the number of beacons on the floor. 
* **Stop Sensing**
	- Device stops scanning for beacons.
	- The application alerts the user that it has successfully stopped scanning.
	
There is also another function you can implement that gets a list of CLBeacons detected by the locationManager. This application prints out to the console but can implement anything you would like in your application.


Copyright 2015 IBM Corp.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.


