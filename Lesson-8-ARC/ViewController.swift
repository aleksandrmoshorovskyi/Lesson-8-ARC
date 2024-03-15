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
        /*
         let a = A() // ARC -> a -> +1
         let b = B() // ARC -> b -> +1
         
         //        b.retain() -> MRC (Manual Reference Counter)
         a.b = b     // ARC -> b -> +1
         //        b.release() -> MRC
         b.a = a     // ARC -> a -> +1
         
         debugPrint("-> did execute")
         
         a.fillArray()
         b.fillArray()
         
         debugPrint("-> did execute")
         */
        let secondVC = SecondViewController()
        secondVC.view.backgroundColor = .green
        
        present(secondVC, animated: true)
        
        debugPrint("-> did execute")
    }
}

class SecondViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        debugPrint("SecondViewController -> viewDidAppear")
        doSomeLogic()
    }
    
    deinit {
        debugPrint("SecondViewController -> deinit")
    }
        
    func doSomeLogic() {
        let a = A()
        let b = B()
        
        a.b = b
        b.a = a
        
        a.fillArray()
        b.fillArray()
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
            let imageData = UIImage(named: "motherboard_pic1")?.pngData() ?? Data()
            imagesData.append(imageData)
        }
    }
    
}

class B {
    
    //var a: A! - віджерає памʼять (RAM)
    //weak var a: A! // - не віджирає
    
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
