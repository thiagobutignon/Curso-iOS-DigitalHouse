//
//  ViewController.swift
//  ReactiveStudy
//
//  Created by Thiago B Claramunt on 24/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
}

extension ViewController {
    @IBAction func reactData(_ sender: Any) {
        
        //
        //        example(of: "subscribe") {
        //            let observable = Observable.of(episodeIV, episodeV, episodeVI)
        //
        
        
        //            observable.subscribe(onNext: { element in
        //                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        //                label.center = CGPoint(x: 160, y: 0 + (10 * element.count ))
        //                label.textAlignment = .center
        //                label.text = element
        //                self.view.addSubview(label)
        //                self.textLabel.text = element
        //
        //            })
//
//        example(of: "empty") {
//            let observable = Observable<Void>.empty()
//
//            observable.subscribe(onNext: { element in
//                print(element)
//            },
//                                 onCompleted:{
//                                    print("Completed")
//            })
//        }
        
        example(of: "never") {
            let observable = Observable<Any>.never()
            dump(observable)
            
            let disposeBag = DisposeBag()
            
            observable
                .do(
                    onSubscribe: {
                        print("About to subscribe")
                },
                    onDispose: {
                        print("Disposed")
                })
                .subscribe(
                    onNext: { element in
                        print(element)
                },
                    onCompleted: {
                        print("Completed")
                },
                    onDisposed: {
                        print("Disposed")
                })
                .disposed(by: disposeBag)
            
        }
        

    }
    
}

