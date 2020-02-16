//
//  ViewController.swift
//  lovetestgui
//
//  Created by Francesco Mattiussi on 16/02/2020.
//  Copyright © 2020 Francesco Mattiussi. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tu_tf: NSTextField!
    @IBOutlet weak var crush_tf: NSTextField!
    
    @IBAction func genera_percentuale(_ sender: Any) {
        
        func dialogOKCancel(question: String, text: String) {
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = text
            alert.alertStyle = .informational
            alert.addButton(withTitle: "Ok!")
            alert.beginSheetModal(for: self.view.window!)
        }

        dialogOKCancel(question: "Ecco la tua percentuale di compatibilità:", text: percentuale(tu: tu_tf.stringValue, crush: crush_tf.stringValue))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func percentuale(tu: String, crush: String) -> String {

        var numeri: [Int] = []

        for i in tu + crush {
            
            var corrispondenze = 0
            
            for j in tu + crush {
                
                if i == j {
                    
                    corrispondenze += 1
                }
            }
            
            numeri.append(corrispondenze)
            
            corrispondenze = 0
        }

        print(numeri)

        while numeri.count >= 3 && numeri[numeri.count - 1] != 0 {
            
            var temp: [Int] = []
            
            while numeri.count >= 2 {
                
                if numeri[0] + numeri[numeri.count - 1] > 9 {
                    
                    let cifreA = String(numeri[0] + numeri[numeri.count - 1]).map { Int(String($0))! }
                    
                    temp.append(contentsOf: cifreA)
                    
                    
                } else {
                    
                    temp.append(numeri[0] + numeri[numeri.count - 1])
                }
                
                numeri.remove(at: 0)
                numeri.remove(at: numeri.count - 1)
                
            }
            
            if numeri.count != 0 {
                let extra = numeri[0]
                numeri = temp
                numeri.append(extra)
            } else {
                numeri = temp
            }
            
            print(numeri)
            
        }

        var percentuale = ""
        _ = numeri.map{ percentuale = percentuale + "\($0)" }
        
        return percentuale + "%"
    }


}

