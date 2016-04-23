//
//  AppDelegate.swift
//  sollteicheinbiertrinkenApp
//
//  Created by Felix Tesche on 23.04.16.
//  Copyright © 2016 Felix Tesche. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var answerPanel: NSMenuItem!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1);
    let statusItem2 = NSStatusBar.systemStatusBar().statusItemWithLength(0);
    
    func setInterval(interval:NSTimeInterval, block:()->Void) -> NSTimer {
        return NSTimer.scheduledTimerWithTimeInterval(interval, target: NSBlockOperation(block: block), selector: "interval", userInfo: nil, repeats: true)
    }
    
    func interval(){
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("interval"), userInfo: nil, repeats: true)
        let yesIcon = NSImage(named: "yesIcon")
        let noIcon = NSImage(named: "noIcon")
        if(hour() < 16){
            noIcon?.template = true
            statusItem.image = noIcon
        }
        else {
            yesIcon?.template = true
            statusItem.image = yesIcon
        }
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        interval()
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func hour() -> Int
    {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute], fromDate: date)
        let hour = components.hour
        return hour
    }


    @IBAction func menuClicked(sender: NSMenuItem) {
    }
}

