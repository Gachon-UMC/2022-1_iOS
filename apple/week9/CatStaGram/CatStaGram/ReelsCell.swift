//
//  ReelsCell.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/05/17.
//

import UIKit
import SnapKit
import AVKit

class ReelsCell: UICollectionViewCell {
  static let identifier = "ReelsCell"
  
  var videoView: VideoPlayerView?
  
  let cellTitleLabel = UILabel()
  let cameraImageView = UIImageView()
  let commentImageView = UIImageView()
  let likeImageView = UIImageView()
  let shareImageView = UIImageView()

  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func setupURL(_ urlStr: String) {
    self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr)
    setupAttribute()
    setupLayout()
  }
  
  private func setupAttribute() {
    cellTitleLabel.text = "릴스"
    cellTitleLabel.font = .boldSystemFont(ofSize: 25)
    cellTitleLabel.textAlignment = .left
    cellTitleLabel.textColor = .white
    
    [cameraImageView, shareImageView, commentImageView, likeImageView]
      .forEach {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .white
      }
    
    cameraImageView.image = UIImage(systemName: "camera")
    shareImageView.image = UIImage(systemName: "paperplane")
    commentImageView.image = UIImage(systemName: "message")
    likeImageView.image = UIImage(systemName: "suit.heart")
    
  }
  
  private func setupLayout() {
    guard let videoView = videoView else { return }
    contentView.addSubview(videoView) // 현재 View에 videoView 추가
    
    // SnapKit으로 Layout 설정
    videoView.snp.makeConstraints { make in
      make.edges.equalToSuperview() // 모든 Edges를 SuperView인 contentView(cell)에 맞춤
    } // constraint 설정 (make == videoView)
    
    [cellTitleLabel, cameraImageView,
    likeImageView,
    commentImageView,
    shareImageView]
      .forEach { contentView.addSubview($0) }
    
    cellTitleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(20) // top을 Superview와 맞추고 20만큼 떨어지게
      make.leading.equalToSuperview().offset(20)
    }
    
    cameraImageView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(20)
      make.trailing.equalToSuperview().offset(-20)
      make.width.height.equalTo(35)
    }
    
    shareImageView.snp.makeConstraints { make in
      make.bottom.equalToSuperview().offset(-50)
      make.trailing.equalToSuperview().offset(-20)
      make.width.height.equalTo(35)
    }
    
    let space = CGFloat(20)
    
    commentImageView.snp.makeConstraints { make in
      make.bottom.equalTo(shareImageView.snp.top).offset(-space)
      make.centerX.equalTo(shareImageView)
      make.width.height.equalTo(35)
    }
    
    likeImageView.snp.makeConstraints { make in
      make.bottom.equalTo(commentImageView.snp.top).offset(-space)
      make.centerX.equalTo(commentImageView)
      make.width.height.equalTo(35)
    }
  }
}
