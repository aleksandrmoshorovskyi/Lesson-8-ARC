//
//  ViewController.swift
//  Lesson-8-ARC
//
//  Created by Aleksandr Moroshovskyi on 14.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func myBtnClicked(_ sender: Any) {
    
        let a = A() // ARC -> a -> +1
        let b = B() // ARC -> b -> +1
        
//        b.retain() -> MRC (Manual Reference Counter)
        a.b = b     // ARC -> b -> +1
//        b.release() -> MRC
        b.a = a     // ARC -> a -> +1
        
        debugPrint("-> did execute")
    }
    
}

class A {
    
    var b: B!
    
    init() {
        debugPrint("class A init")
    }
    
    deinit {
        debugPrint("class A deinit")
    }
    
    var imagesData: [Data] = []
    
    func fillArray() {
        for _ in 1...10 {
            let imageData = UIImage(named: "img1")?.pngData() ?? Data()
            imagesData.append(imageData)
        }
    }
    
}

class B {
    
    //var a: A!
    weak var a: A!
    
    init() {
        debugPrint("class B init")
    }
    
    deinit {
        debugPrint("class B deinit")
    }
    
    var imagesData2: [Data] = []
    
    func fillArray() {
        for _ in 1...10 {
            let imageData2 = UIImage(named: "img2")?.pngData() ?? Data()
            imagesData2.append(imageData2)
        }
    }
    
}
