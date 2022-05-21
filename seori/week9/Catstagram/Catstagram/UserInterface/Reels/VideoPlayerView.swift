//
//  VideoPlayerView.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/22.
//

import UIKit
import AVKit

// 셀 안에 들어갈 뷰. 비디오를 보여준다.
class VideoPlayerView: UIView {
    
    // 비디오(Reels)에 관련된 객체를 생성.
    var playerLayer: AVPlayerLayer? // player의 layer를 잡아주는 객체. 크기 담당.
    var playerLooper: AVPlayerLooper? // 반복재생에 관련된 객체 담당.
    var queuePlayer: AVQueuePlayer? // 재생 순서 담당. 먼저 들어온 것 먼저 재생.
    var urlStr: String
    
    // Custom 할 거면 init 앞의 override 키워드를 제거한다.
    init(frame: CGRect, urlStr: String) {
        self.urlStr = urlStr
        super.init(frame: frame)
        
        // 값 넣어주기.
        let videoFileURL = Bundle.main.url(forResource: urlStr, withExtension: "mp4")!
        // item화.
        let playerItem = AVPlayerItem(url: videoFileURL)
        
        self.queuePlayer = AVQueuePlayer(playerItem: playerItem)
        self.playerLayer = AVPlayerLayer()
        
        // player 지정.
        playerLayer?.player = queuePlayer
        // layer 사이즈 설정. -> 꽉 채우는 걸로.
        playerLayer?.videoGravity = .resizeAspectFill
        
        // 현재 view(= VideoPlayerView)에 playerLayer를 서브 레이어로 추가.
        self.layer.addSublayer(playerLayer!)
        
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playerItem)
        queuePlayer?.play() // 재생.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    
    /// - 영상 객체를 다룰 때에는 메모리 관리에 유의해야 한다!!
    /// queuePlayer를 메모리에서 해제해 준다.
    public func cleanup() {
        queuePlayer?.pause()
        queuePlayer?.removeAllItems()
        queuePlayer = nil
    }
    
    // layout이 업데이트 될 때마다 실행되는 메서드.
    override func layoutSubviews() {
        super.layoutSubviews()
        // layout이 업데이트 될 때마다 playerLayer의 frame을 현재 view의 bounds와 맞추도록 설정하는 것. -> 객체가 좀 흔들릴 수도 있어서!
        playerLayer?.frame = bounds
    }
}
