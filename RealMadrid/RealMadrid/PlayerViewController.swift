//
//  PlayerViewController.swift
//  RealMadrid
//
//  Created by CIS Student on 11/3/17.
//  Copyright © 2017 Freed Hardeman University. All rights reserved.
//

import UIKit



class PlayerViewController: UIViewController {

    var player: Players?
    
    
    
    
    
    
    
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImageView: UIImageView!
    
    @IBOutlet weak var hometown: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var height: UILabel!
    
    @IBOutlet weak var nationalTeam: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
                
        playerName.text = player?.name
        hometown.text = player?.hometown
        dob.text = player?.dob
        height.text = player?.height
        nationalTeam.text = player?.nationalTeam
        
        if let imageName = player?.imageName {
            playerImageView.image = UIImage(named: imageName)
            // Do any additional setup after loading the view.
        } else if let imageURL = player?.imageURL {
            let session = URLSession(configuration: .default)
            if let url = URL(string: imageURL) {
                let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                    if let d = data {
                        DispatchQueue.main.async {
                            self.playerImageView.image = UIImage(data: d)
                        }
                    }
                })
                task.resume()
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
