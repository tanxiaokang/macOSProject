//
//  EventMonitor.swift
//  MenusDemo
//
//  Created by tanxiaokang on 2018/7/2630.
//  Copyright © 2018年 runze. All rights reserved.
//

import Cocoa

public class EventMonitor {
    private var monotor: Any?
    private let mask: NSEvent.EventTypeMask
    private let handler:(NSEvent?) -> Void
    
    public init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) -> Void) {
        self.mask = mask
        self.handler = handler
    }
    deinit {
        stop()
    }
    
    public func start() {
        monotor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }
    
    public func stop() {
        if monotor != nil {
            NSEvent.removeMonitor(monotor!)
            monotor = nil
        }
    }
}
