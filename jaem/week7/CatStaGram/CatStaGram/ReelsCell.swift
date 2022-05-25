//
//  ReelsCell.swift
//  CatStaGram
//
//  Created by 송재민 on 2022/05/21.
//

import UIKit
import SnapKit
import AVKit

class ReelsCell: UICollectionViewCell{
    static let identifier = "ReelsCell"
    
    var videoView: VideoPlayerView?
    
    let cellTitleLabel = UILabel()
    
    let cameraImageView = UIImageView()
    
    let commentImageView = UIImageView()
    
    let likeImageView = UIImageView()
    
    let shareImageView = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupURL(_ urlStr: String){
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr)
        setupAttribute()
        setupLayout()
    }
    
    private func setupAttribute(){
        cellTitleLabel.text = "릴스"
        cellTitleLabel.font = .boldSystemFont(ofSize: 25)
        cellTitleLabel.textAlignment = .left
        cellTitleLabel.textColor = .white
        
        [cameraImageView, shareImageView, likeImageView, commentImageView]
            .forEach{
                $0.contentMode = .scaleAspectFit
                $0.tintColor = .white
            }
        
        cameraImageView.image = UIImage(systemName: "camera")
        shareImageView.image = UIImage(systemName: "paperplane")
        likeImageView.image = UIImage(systemName: "suit.heart")
        commentImageView.image = UIImage(systemName: "message")
    }
    
    private func setupLayout(){
        guard let videoView = videoView else {return}
        contentView.addSubview(videoView)
        
        videoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        [cellTitleLabel, cameraImageView,
        likeImageView,
        commentImageView,
        shareImageView]
            .forEach{contentView.addSubview($0)}
        
        cellTitleLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        cameraImageView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        shareImageView.snp.makeConstraints{make in
            make.bottom.equalToSuperview().offset(-50)
            make.trailing.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(35)
        }
        
        commentImageView.snp.makeConstraints{make in
            make.bottom.equalTo(shareImageView.snp.top).offset(-10)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(35)
        }
        
        likeImageView.snp.makeConstraints{make in
            make.bottom.equalTo(commentImageView.snp.top).offset(-10)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(35)
        }
        
    }
    
}
