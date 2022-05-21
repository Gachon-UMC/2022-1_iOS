//
//  ReelsCell.swift
//  Catstagram
//
//  Created by 서은수 on 2022/05/21.
//

import UIKit
import AVKit
import SnapKit

class ReelsCell: UICollectionViewCell {

    // MARK: - Properties
    
    static let identifier = "ReelsCell"
    
    var videoView: VideoPlayerView?
    
    // MARK: - Subviews
    
    // 릴스 글자
    let reelsLabel = UILabel()
    // 카메라
    let cameraImageView = UIImageView()
    // 댓글
    let commentImageView = UIImageView()
    // 좋아요
    let heartImageView = UIImageView()
    // 공유하기
    let shareImageView = UIImageView()
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func setupURL(_ urlStr: String) {
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr)
        
        setupAttribute()
        setupLayout()
    }
    
    func setupAttribute() {
        /* reelsLabel */
        reelsLabel.text = "릴스"
        reelsLabel.textColor = .white
        reelsLabel.font = .boldSystemFont(ofSize: 25)
        
        [
            cameraImageView,
            heartImageView,
            commentImageView,
            shareImageView
        ].forEach {
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .white
        }
        
        /* cameraImageView */
        cameraImageView.image = UIImage(systemName: "camera")
        /* heartImageView */
        heartImageView.image = UIImage(systemName: "heart")
        /* commentImageView */
        commentImageView.image = UIImage(systemName: "message")
        /* shareImageView */
        shareImageView.image = UIImage(systemName: "paperplane")
    }
    
    func setupLayout() {
        // videoView에 값이 들어있다면 else로 안 들어가고 통과. -> Optional 해제.
        guard let videoView = videoView else {
            return
        }

        // 서브뷰로 추가.
        [
            videoView,
            reelsLabel, cameraImageView,
            heartImageView,
            commentImageView,
            shareImageView
        ].forEach {
            contentView.addSubview($0)
        }
        
        // 비디오뷰
        videoView.snp.makeConstraints { make in // make가 videoView를 뜻함.
            make.edges.equalToSuperview()   // superView인 contentView와 같게.
        }
        
        let space = 25
        let size = 35
        
        // 릴스 글자
        reelsLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(space)
        }
        
        // 카메라
        cameraImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(space)
            make.right.equalToSuperview().offset(-space)
            make.width.height.equalTo(size)
        }
        
        // 좋아요
        heartImageView.snp.makeConstraints { make in
            make.bottom.equalTo(commentImageView.snp.top).offset(-space)
            make.right.equalToSuperview().inset(space)
            make.width.height.equalTo(size)
        }
        // 댓글
        commentImageView.snp.makeConstraints { make in
            make.bottom.equalTo(shareImageView.snp.top).offset(-space)
            make.right.equalToSuperview().inset(space)
            make.width.height.equalTo(size)
        }
        // 공유하기
        shareImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(space * 2)
            make.right.equalToSuperview().inset(space)
            make.width.height.equalTo(size)
        }
    }
}
