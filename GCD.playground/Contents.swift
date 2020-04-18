import UIKit

// Queue - Main, Global, Custom

// - Main
DispatchQueue.main.async {
    // UI Update
    let view = UIView()
    view.backgroundColor = UIColor.white
}

// - Global
DispatchQueue.global(qos: .userInteractive).async {
    // 지금 당장 수행해야 하는 부분
}

DispatchQueue.global(qos: .userInitiated).async {
    // 거의 바로 해줘야 할 것, 사용자가 결과를 기다린다
}

DispatchQueue.global(qos: .utility).async {
    // 시간이 좀 걸리는 일들, 사용자가 당장 기다리지 않는것, 네트워킹, 큰파일 불러오는 경우등
}

DispatchQueue.global(qos: .background).async {
    // 우선순위 제일 낮음, 사용자한테 당장 인식될 필요가 없는것들, 뉴스데이터 미리 받기등
}

// - Custom
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)

// 복합적인 상황
func downloadImageFromServer() -> UIImage {
    // Heavy Task
    
    return UIImage()
}

DispatchQueue.global(qos: .background).async {
    
    let image = downloadImageFromServer()
    
    DispatchQueue.main.async {
        // Update UI
    }
}

// Sync, Async

// Async
DispatchQueue.global(qos: .background).async {
    for i in 0...5 {
        print("🟦 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("🟡 \(i)")
    }
}

// Sync
DispatchQueue.global(qos: .background).sync {
    for i in 0...5 {
        print("🟦 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).sync {
    for i in 0...5 {
        print("🟡 \(i)")
    }
}





