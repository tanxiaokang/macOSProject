//
//  QuotesViewController.swift
//  MenusDemo
//
//  Created by tanxiaokang on 2018/7/2630.
//  Copyright © 2018年 runze. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {

    @IBOutlet var textLabel: NSTextField!
    
    let quotes = Quote.all
    
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentQuoteIndex = 0;
    }
    
    func updateQuote() {
        textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }
    
}

extension QuotesViewController {
    
    @IBAction func previous(sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }
    
    @IBAction func next(sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
    }
    
    @IBAction func quit(sender: NSButton) {
        NSApplication.shared.terminate(sender)
    }
    
    // MARK: Storyboard instantiation
    static func freshController() -> QuotesViewController {
        
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "QuotesViewController")
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? QuotesViewController else {
            fatalError("Way cant i find QuotesViewController? - Check Main.storyboard")
        }
        return viewController
    }
    
}
