//
//  PlayerView.swift
//  Example
//
//  Created by Moayad Al kouz on 8/13/18.
//  Copyright © 2018 Moayad Al kouz. All rights reserved.
//

import UIKit
import youtube_ios_player_helper_swift


class PlayerView: UIView {
    var videoId: String = ""{
        didSet{
            if !videoId.isEmpty{
                loadVideo()
            }
            
        }
    }
    
    
    @IBOutlet weak var ytPlayerView: YTPlayerView!
    
    private var isFullScreen = false
    
    private func loadVideo(){
        let playerVars:[String: Any] = [
            "controls" : "0",
            "showinfo" : "0",
            "autoplay": "0",
            "rel": "0",
            "modestbranding": "0",
            "iv_load_policy" : "3",
            "fs": "0",
            "playsinline" : "1"
        ]
        ytPlayerView.delegate = self
        _ = ytPlayerView.load(videoId: videoId, playerVars: playerVars)
        ytPlayerView.isUserInteractionEnabled = false
    }
    
    func secondsToHoursMinutesSeconds (_ seconds : Int) -> (hours : Int, minutes : Int, seconds : Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func paddedNumber(_ number : Int) -> String{
        if(number < 0){
            return "00"
        }else if(number < 10){
            return "0\(number)"
        }else{
            return String(number)
        }
    }
    
    func ytk_secondsToCounter(_ seconds : Int) -> String {
        
        let time = self.secondsToHoursMinutesSeconds(seconds)
        
        let minutesSeconds = "\(self.paddedNumber(time.minutes)):\(self.paddedNumber(time.seconds))"
        
        if(time.hours == 0){
            return minutesSeconds
        }else{
            return "\(self.paddedNumber(time.hours)):\(minutesSeconds)"
        }
        
    }
    
}

class LandscapeViewController: UIViewController {
    
    override var shouldAutorotate: Bool{
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscape
    }
}


extension PlayerView: YTPlayerViewDelegate{
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
//        btnPlayPause.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo quality: YTPlaybackQuality) {
        print("Quality :: ", quality)
    }
    
    //    func playerViewPreferredInitialLoadingView(_ playerView: YTPlayerView) -> UIView? {
    //        let loader = UIView(frame: CGRect(x: 10, y: 10, width: 200, height: 200))
    //        loader.backgroundColor = UIColor.brown
    //        return loader
    //    }
}
