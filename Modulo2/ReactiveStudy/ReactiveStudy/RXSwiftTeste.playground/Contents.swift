import UIKit
import RxSwift

example(of: "subscribe") {
    let observable = Observable.of(episodeIV, episodeV, episodeVI)
    
    //    observable.subscribe{ event in
    //        print(event.element ?? event)
    //    }
    
    observable.subscribe(onNext: { element in
        print(element)
    })
}

example(of: "empty") {
    let observable = Observable<Void>.empty()
    
    observable.subscribe(onNext: { element in
        print(element)
    },
    onCompleted:{
        print("Completed")
    })
}


example(of: "never") {
    let observable = Observable<Any>.never()
    
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

example(of: "dispose") {
    let mostPopular = Observable.of(episodeV, episodeIV, episodeVI)
    
    let subsription = mostPopular.subscribe { event in
        print(event)
    }
    subsription.dispose()
}

example(of: "DisposeBag") {
    let disposeBag = DisposeBag()
    
    Observable.of(episodeVII, episodeI, rogueOne)
        .subscribe {
            print($0)
    }
    .disposed(by: disposeBag)
}

example(of: "create") {
    enum Droid: Error {
        case OU182
    }
    
    let disposeBag = DisposeBag()
    
    Observable<String>.create { observer in
        
        observer.onNext("R2-D2")
        observer.onError(Droid.OU182)
        observer.onNext("C-3PO")
        observer.onNext("K-2SO")
        observer.onCompleted()
        
        return Disposables.create()
    }
        .subscribe(
            onNext: { print($0) },
            onError: { print("Error:", $0)},
            onCompleted: { print("Completed")},
            onDisposed: {print("Disposed")}
    )
    .disposed(by: disposeBag)
}


example(of: "Single") {
    let disposeBag = DisposeBag()
    
    enum FileReadError: Error {
        case fileNotFound, unreadable, encodingFailed
    }
    
    func loadText(from filename: String) -> Single<String>{
        return Single.create {
            single in
            let disposable = Disposables.create()
            
            guard let path = Bundle.main.path(forResource: filename, ofType: "txt") else {
                single(.error(FileReadError.fileNotFound))
                return disposable
            }
            
            guard let data = FileManager.default.contents(atPath: path) else {
                single(.error(FileReadError.unreadable))
                return disposable
            }
            
            guard let contents = String(data: data, encoding: .utf8) else {
                single(.error(FileReadError.encodingFailed))
                return disposable
            }
            
            single(.success(contents))
            return disposable
        }
    }
    
    loadText(from: "ANewHope")
        .subscribe {
            switch $0 {
            case .success(let string):
                print(string)
            case .error(let error):
                print(error)
            }
    }
        .disposed(by: disposeBag)
}
