//
//  VideoPlayerView.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/05/17.
//

import UIKit
import AVKit

class VideoPlayerView: UIView {
  var playerLayer: AVPlayerLayer? // 영상의 Layer(크기)를 제어
  var playerLooper: AVPlayerLooper? // 영상의 반복재생을 제어
  var queuePlayer: AVQueuePlayer? // 영상의 순서를 제어
  var urlStr: String // 비디오의 url
  
  init(frame: CGRect, urlStr: String) {
    self.urlStr = urlStr
    super.init(frame: frame)
    
    // file load
    let videoFileURL = Bundle.main.url(forResource: urlStr, withExtension: "mp4")! // ==== Error ====
    let playItem = AVPlayerItem(url: videoFileURL)
    
    // player config
    self.queuePlayer = AVQueuePlayer(playerItem: playItem)
    playerLayer = AVPlayerLayer()
    
    playerLayer!.player = queuePlayer
    playerLayer!.videoGravity = .resizeAspectFill
    
    self.layer.addSublayer(playerLayer!) // 현재 있는 View에 영상 Layer 추가
    
    playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playItem)
    queuePlayer!.play()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // 메모리 해제 메서드
  public func cleanup() {
    queuePlayer?.pause()
    queuePlayer?.removeAllItems()
    queuePlayer = nil
  }
  
  // Layout이 업데이트 될 때마다 호출
  override func layoutSubviews() {
    super.layoutSubviews()
    playerLayer!.frame = bounds
  }
}
