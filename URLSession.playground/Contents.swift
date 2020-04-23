import UIKit

// URL : 웹 리소스의 주소

let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)


// 주소
url?.absoluteString

// scheme : 어떤 방식으로 네트워킹을 하고 있는지에 대한 정보
url?.scheme

url?.host
url?.path
url?.query
url?.baseURL

let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL)

relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL


// URLComponents : url을 한단계 더 추상화시켜서 url에 대한 정보를 접근할때 다루기 쉬워짐

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


// 목표 : 트랙리스트 객체로 가져오기

// 하고 싶은 목록
// - Data -> Track 목록으로 가져오고 싶다 [Track]
// - Track 객체를 만든다
// - Data에서 struct로 parsing하고 싶다. (Codable 이용)
//  - JSon 파일, 데이터 -> 객체로 만들때(Codable 이용)
//  - Response 구조안에 Track이 여러개 있는 구조 -> Response, Track 이렇게 두 개를 만든다

// 해야할일
// - Response, Track  -> Struct로 만들기
// - struct의 프로퍼티 이름과 실제 데이터와 키 맞추기 (이래야지만 Codable에서 디코딩이 가능함)
// - 파싱하기 (Decoding)
// - 트랙리스트 가져오기

struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case tracks = "results"
    }
}

struct Track: Codable {
    
    let title: String
    let artistName: String
    let thumbnailPath: String
    
    // trackName
    // artistName
    // artworkUrl30
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl30"
    }
    
}

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
    
   
    // - 파싱, 및 트랙 가져오기
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks

        print("---> tracks: \(tracks.count)")
    } catch let error {
        print("---> error: \(error.localizedDescription)")
    }

//    print("---> : \(resultString)")
}

dataTask.resume()
