//
//  SongsWithImageViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SongsWithImageViewController: UIViewController {

    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    var songsVariable: Song? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let songsVariable = songsVariable else {
            return
        }
        songImage.image? = #imageLiteral(resourceName: "loveSongs")
        //Why image no work?
        songNameLabel.text? = songsVariable.name
        artistNameLabel.text? = songsVariable.artist
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
