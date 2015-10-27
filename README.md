#MobileFirst Platform - PI Beacon Sensing 
The purpose of this app is to show how to leverage Presence Insights SDK and use for Beacon sensing for IOS (Swift).

##Instructions
You would need to use a ios device to use Beacon SDK. Xcode simulator does not support beacons. 

* Open PIBeaconSDK.xcodeproj
* Edit the file ViewController.swift
	- change the bluemix credentials/information
		- tenantID, orgID, siteID, floorID, username and password (all this information can be found in your Presence Insights Dashboard)
* Make sure you select your ios device instead of the simulator
* Click the play button to build and run


##Quick Walkthrough
ViewController.swift is a great way to see how objects were initialized and implemented.

On the sample app, there are 4 buttons the user can press:

* "Start Sensing"
	- Device will start scanning for nearby beacons and if the beacon exist in the Presence Insights, it will send that location payload to Presence Insights.
	- The app will alert the user stating it successfully started scanning.
* "Get UUID for Beacons"
	- Grabs all the UUIDs from the Presence Insights and pop up message listing them.
* "Get Beacons on the Floor"
	- The app will grab the beacons and alert the user number of beacons on the floor. 
* "Stop Sensing"
	- Device will stop scanning for beacons
	- They app will alert the user stating it has successfully stopped the scanning.
	
There is also another function you can implement that gets a list of CLBeacons detected by the locationManager. In this app, it currently just prints out to the console but can implement anything you would like in your app.


Copyright 2015 IBM Corp.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


