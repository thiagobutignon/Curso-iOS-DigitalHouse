//: Please build the scheme 'RxSwiftPlayground' first
import RxSwift
import RxCocoa

example(of: "PublishSubject") {
    let quotes = PublishSubject<String>()
    
    quotes.onNext(itsNotMyFault)
    
    let subscriptionOne = quotes
        .subscribe {
            print(label: "1)", event: $0)
    }
    
    quotes.on(.next(doOrDoNot))
    
    let subscriptionTwo = quotes
        .subscribe{
            print(label: "2)", event: $0)
    }
    
    quotes.onNext(lackOfFaith)
    
    subscriptionOne.dispose()
    
    quotes.onNext(eyesCanDeceive)
    
    quotes.onCompleted()
    
    let subscriptionThree = quotes
        .subscribe {
            print("3)", $0)
    }
    
    quotes.onNext(stayOnTarget)
    
    subscriptionTwo.dispose()
    subscriptionThree.dispose()
}


example(of: "BehaviourSubject") {
    let disposeBag = DisposeBag()
    
    let quotes = BehaviorSubject<String>(value: iAmYourFather)
    
    let subscriptionOne = quotes
        .subscribe {
            print(label: "1)", event: $0)
    }
    
    //    quotes.onError(Quote.neverSaidThat)
    
    quotes.onNext(stayOnTarget)
    
    
    quotes
        .subscribe {
            print(label: "2)", event: $0)
        }
        .disposed(by: disposeBag)
    
    quotes.onNext(eyesCanDeceive)
    quotes.subscribe { print(label: "3)", event: $0)}
    
    quotes.onNext(stayOnTarget)
}

example(of: "ReplaySubject") {
    let disposeBag = DisposeBag()
    
    let subject = ReplaySubject<String>.create(bufferSize: 2)
    
    subject.onNext(useTheForce)
    
    subject.subscribe{
        print(label: "1)", event: $0)
        }
        .disposed(by: disposeBag)
    
    
    
    subject.onNext(theForceIsStrong)
    
    subject.subscribe {
        print(label: "2)" , event: $0)
        }.disposed(by: disposeBag)
}

example(of: "Variable") {
    let disposeBag = DisposeBag()
    
    let variable = BehaviorRelay<String>(value: mayTheForceBeWithYou)
    print(variable.value)
    
    variable.asObservable()
        .subscribe {
            print(label:"1)", event: $0)
    }
    .disposed(by: disposeBag)
    

    variable.accept(mayThe4thBeWithYou)
    variable.accept(theForceIsStrong)
    

}

