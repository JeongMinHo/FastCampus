import UIKit

//// URL : 웹 리소스의 주소
//
//let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
//let url = URL(string: urlString)
//
//
//// 주소
//url?.absoluteString
//
//// scheme : 어떤 방식으로 네트워킹을 하고 있는지에 대한 정보
//url?.scheme
//
//url?.host
//url?.path
//url?.query
//url?.baseURL
//
//let baseURL = URL(string: "https://itunes.apple.com")
//let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL)
//
//relativeURL?.absoluteString
//relativeURL?.scheme
//relativeURL?.host
//relativeURL?.path
//relativeURL?.query
//relativeURL?.baseURL
//
//
//// URLComponents : url을 한단계 더 추상화시켜서 url에 대한 정보를 접근할때 다루기 쉬워짐
//
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!

// QueryItem을 만들어주면 자동으로 인코딩을 해줘서 한글 사용이 가능해진다.
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")

urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)

urlComponents.url
urlComponents.string
urlComponents.queryItems

let requestURL = urlComponents.url!



// URLSession : iOS에서 네트워킹을 할 때 사용

// 1. URLSessionConfiguration
// 2. URLSession
// 3. URLSessionTask를 이용해서 서버와 네트워킹 하기

// URLSessionTask

// - dataTask
// - uploadTask
// - downloadTask


let urlConfig = URLSessionConfiguration.default
let urlSession = URLSession(configuration: urlConfig)



let dataTask = urlSession.dataTask(with: requestURL) { (data, response, error) in
    guard error == nil else { return }
    
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        // handle response error
        return
    }
    
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    
    print("---> : \(resultString)")
}

dataTask.resume()
