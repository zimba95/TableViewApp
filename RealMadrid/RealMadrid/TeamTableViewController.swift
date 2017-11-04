//
//  TeamTableViewController.swift
//  RealMadrid
//
//  Created by CIS Student on 11/3/17.
//  Copyright © 2017 Freed Hardeman University. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController {
    var data: [Players]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = PlayersData.sampleData
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playersCell", for: indexPath)
        
        // Configure the cell...
        
        if let playersCell = cell as? TeamTableViewCell {
            if let therealdata = data {
                let player = therealdata[indexPath.row]
                
                playersCell.titleLabel?.text = player.name
                playersCell.positionLabel?.text = player.position
                
                if let imageName = player.imageName {
                    playersCell.playerImageView?.image = UIImage(named: imageName)

                }
                else {
                    playersCell.playerImageView.image = nil
                }
                
                if let imageURL = player.imageURL {
                    loadImageViewAsyc(imageURL: imageURL, imageView: playersCell.playerImageView)
                    
                    
                    /*let session = URLSession(configuration: .default)
                     if let url = URL(string: imageURL) {
                     let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                     if let d = data {
                     DispatchQueue.main.async {
                     stacheCell.stacheImageView.image = UIImage(data: d)
                     }
                     }
                     })
                     task.resume()
                     }*/
                }
            }
        }
        
        return cell
    }
    
    func loadImageViewAsyc( imageURL: String , imageView: UIImageView) {
        if let url = URL(string: imageURL) {
            let dataTask = URLSession(configuration: .default).dataTask(with: url){ (data, response, error) in
                if let error = error {
                    print("ERROR: \(error.localizedDescription)")
                } else if let data = data {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data)
                        
                    }
                }
            }
            dataTask.resume()
        }
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier {
            if identifier == "playerSegue" {
                if let svc = segue.destination as? PlayerViewController,
                    let cell = sender as? UITableViewCell,
                    let data = data {
                    if let indexPath = tableView.indexPath(for: cell) {
                        svc.player = data[indexPath.row]
                    }
                }
                
            }
        }
        
    }
    

}
