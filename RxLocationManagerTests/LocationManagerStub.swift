//
//  LocationManagerStub.swift
//  RxLocationManager
//
//  Created by Yonny Hao on 16/7/24.
//  Copyright © 2016年 GFWGTH. All rights reserved.
//

import Foundation
import CoreLocation
@testable
import RxLocationManager

class LocationManagerStub: LocationManagerBridge{
    var whenInUseAuthorizationRequested = false
    var alwaysAuthorizationRequested = false
    
    var currentLocation:CLLocation?
    var currentDistanceFilter: CLLocationDistance = 0.0
    var currentDesiredAccuracy: CLLocationAccuracy = 0.0
    var currentPausesLocationUpdatesAutomatically = false
    var currentAllowsBackgroundLocationUpdates = false
    var currentActivityType = CLActivityType.Other
    
    var currentlyDeferedSetting:(CLLocationDistance, NSTimeInterval)?
    
    var currentHeadingFilter = 0.0
    var currentHeadingOrientation = CLDeviceOrientation.Portrait
    
    var currentMonitoredRegions = Set<CLRegion>()
    var currentRangedRegions = Set<CLBeaconRegion>()
    
    //instance methods on CLLocationManager instance
    #if os(iOS) || os(watchOS) || os(tvOS)
    func requestWhenInUseAuthorization(){
        whenInUseAuthorizationRequested = true
    }
    #endif
    #if os(iOS) || os(watchOS)
    func requestAlwaysAuthorization(){
        alwaysAuthorizationRequested = true
    }
    #endif
    
    #if os(iOS) || os(watchOS) || os(tvOS)
    var location: CLLocation? {
        get{
            return currentLocation
        }
    }
    #endif
    
    func startUpdatingLocation(){
        
    }
    func stopUpdatingLocation(){
        
    }
    @available(iOSApplicationExtension 9.0, *)
    func requestLocation(){
        
    }
    var distanceFilter: CLLocationDistance {
        get{
            return currentDistanceFilter
        }
        set{
            currentDistanceFilter = newValue
        }
    }
    var desiredAccuracy: CLLocationAccuracy {
        get{
            return currentDesiredAccuracy
        }
        set{
            currentDesiredAccuracy = newValue
        }
    }
    #if os(iOS)
    var pausesLocationUpdatesAutomatically: Bool {
        get{
           return currentPausesLocationUpdatesAutomatically
        }
        set{
            currentPausesLocationUpdatesAutomatically = newValue
        }
    }
    @available(iOSApplicationExtension 9.0, *)
    var allowsBackgroundLocationUpdates: Bool {
        get{
            return currentAllowsBackgroundLocationUpdates
        }
        set{
            return currentAllowsBackgroundLocationUpdates = newValue
        }
    }
    func allowDeferredLocationUpdatesUntilTraveled(distance: CLLocationDistance, timeout: NSTimeInterval){
        currentlyDeferedSetting = (distance, timeout)
    }
    func disallowDeferredLocationUpdates(){
        currentlyDeferedSetting = nil
    }
    var activityType: CLActivityType {
        get{
            return currentActivityType
        }
        set{
            currentActivityType = newValue
        }
    }
    #endif
    
    #if os(iOS) || os(OSX)
    func startMonitoringSignificantLocationChanges(){
        
    }
    func stopMonitoringSignificantLocationChanges(){
        
    }
    #endif
    
    #if os(iOS)
    func startUpdatingHeading(){
        
    }
    func stopUpdatingHeading(){
        
    }
    func dismissHeadingCalibrationDisplay(){
        
    }
    var headingFilter: CLLocationDegrees {
        get{
            return currentHeadingFilter
        }
        set{
            currentHeadingFilter = newValue
        }
    }
    var headingOrientation: CLDeviceOrientation {
        get{
            return currentHeadingOrientation
        }
        set{
            currentHeadingOrientation = newValue
        }
    }
    #endif
    
    #if os(iOS) || os(OSX)
    func startMonitoringForRegion(region: CLRegion){
        
    }
    func stopMonitoringForRegion(region: CLRegion){
        
    }
    var monitoredRegions: Set<CLRegion> {
        get{
            return currentMonitoredRegions
        }
    }
    var maximumRegionMonitoringDistance: CLLocationDistance {
        get{
            return 20
        }
    }
    func requestStateForRegion(region: CLRegion){
        
    }
    #endif
    
    #if os(iOS)
    var rangedRegions: Set<CLRegion> {
        get{
            return currentRangedRegions
        }
    }
    func startRangingBeaconsInRegion(region: CLBeaconRegion){
        
    }
    func stopRangingBeaconsInRegion(region: CLBeaconRegion){
        
    }
    #endif
    
    #if os(iOS)
    func startMonitoringVisits(){
        
    }
    func stopMonitoringVisits(){
        
    }
    #endif
    
    // bridged delegate methods
    var didFailWithError: ((CLLocationManager, NSError) -> Void)?
    var didChangeAuthorizationStatus: ((CLLocationManager, CLAuthorizationStatus)->Void)?
    
    #if os(OSX)
    var didUpdateLocations: ((CLLocationManager, [AnyObject]) -> Void)?
    #else
    var didUpdateLocations: ((CLLocationManager, [CLLocation]) -> Void)?
    #endif
    
    #if os(iOS) || os(OSX)
    var didFinishDeferredUpdatesWithError: ((CLLocationManager, NSError?) -> Void)?
    var didEnterRegion: ((CLLocationManager, CLRegion) -> Void)?
    var didExitRegion: ((CLLocationManager, CLRegion) -> Void)?
    var monitoringDidFailForRegion: ((CLLocationManager, CLRegion?, NSError) -> Void)?
    var didDetermineState:((CLLocationManager, CLRegionState, CLRegion) -> Void)?
    var didStartMonitoringForRegion:((CLLocationManager, CLRegion) -> Void)?
    #endif
    
    #if os(iOS)
    var didPausedUpdate:((CLLocationManager) -> Void)?
    var didResumeUpdate:((CLLocationManager) -> Void)?
    var displayHeadingCalibration:Bool = true
    var didUpdateHeading: ((CLLocationManager, CLHeading) -> Void)?
    var didRangeBeaconsInRegion:((CLLocationManager, [CLBeacon], CLBeaconRegion) -> Void)?
    var rangingBeaconsDidFailForRegion:((CLLocationManager, CLBeaconRegion, NSError) -> Void)?
    var didVisit:((CLLocationManager, CLVisit) -> Void)?
    #endif
    
    required init(){
        
    }
    
}
