//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var songList = [Song]()
    var searchText: String? = nil {
        didSet {
            self.tableView.reloadData()
        }
    }
    var filteredSongs: [Song] {
        guard let searchText = searchText, searchText != "" else {
            return songList
        }
        //        return songList.filter{$0.name.lowercased().contains(searchText!.lowercased())}
        guard let scopeTitles = self.searchBar.scopeButtonTitles else {
            return songList
        }
        
        let selectedIndex = self.searchBar.selectedScopeButtonIndex
        let filteredSongs = scopeTitles[selectedIndex]
        switch filteredSongs {
        case "Name":
            return songList.filter{(song) in song.name.lowercased().contains(searchText.lowercased())}
        case "Artist":
            return songList.filter{(song) in song.artist.lowercased().contains(searchText.lowercased())}
        default:
            return songList
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        songList = Song.loveSongs
    }
    
    //Mark: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return filteredSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Songs Displayed", for: indexPath)
        let song = filteredSongs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchText = searchBar.text
        searchBar.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SongsWithImageViewController {
            destination.songsVariable = songList[tableView.indexPathForSelectedRow!.row]
        }
        
    }
}

