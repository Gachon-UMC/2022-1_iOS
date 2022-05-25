//
//  VideoPlayerView.swift
//  CatStaGram
//
//  Created by 송재민 on 2022/05/21.
//

import UIKit
import AVKit

class VideoPlayerView: UIView{
    var playerLayer: AVPlayerLayer?
    var playerLooper: AVPlayerLooper?
    var queuePlayer: AVQueuePlayer?
    var urlStr: String
    
    init(frame: CGRect, urlStr: String){
        self.urlStr = urlStr
        super.init(frame: frame)
        
        let videoFileURL = Bundle.main.url(forResource: urlStr, withExtension: "mp4")!
        let playItem = AVPlayerItem(url: videoFileURL)
        
        self.queuePlayer = AVQueuePlayer(playerItem: playItem)
        playerLayer = AVPlayerLayer()
        
        playerLayer!.player = queuePlayer
        playerLayer!.videoGravity = .resizeAspectFill
        
        self.layer.addSublayer(playerLayer!)
        
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playItem)
        queuePlayer!.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func cleanup(){
        queuePlayer?.pause()
        queuePlayer?.removeAllItems()
        queuePlayer = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer!.frame = bounds
    }
}
