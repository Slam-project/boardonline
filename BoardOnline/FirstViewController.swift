//
//  FirstViewController.swift
//  BoardOnline
//
//  Created by Alexandre on 17/06/2015.
//  Copyright (c) 2015 Les_Smileyz. All rights reserved.
//

import UIKit
import Socket_IO_Client_Swift

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var listCvView: UITableView!

    private var arrayOfCv: [CV] = []
    static var socket = SocketIOClient(socketURL: "192.168.1.8:8080")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadCV()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfCv.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("CellList", forIndexPath: indexPath) as! CustomViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("cellList", forIndexPath: indexPath) as! CustomViewCell
        if indexPath.row % 2 == 0
        {
            cell.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        }
        else
        {
            cell.backgroundColor = UIColor.whiteColor()
        }
        
        let cv = arrayOfCv[indexPath.row]
        cell.setCellContent(cv)
        
        return cell;
    }
    
    
    // load cv from socket.io
    func loadCV() {
        /*var cv1 = CV(nom: "Lepretre", prenom: "Alexandre", titre: "Ingé R&D", lastFormation: "Symfony", experience: "17 mois")
        var cv2 = CV(nom: "Buirette", prenom: "Quentin", titre: "Ingé réseau", lastFormation: "Node js", experience: "2 ans")*/
        
        FirstViewController.socket.on("connected") {data, ack in
            let jsonError: NSError
            FirstViewController.socket.emit("loadCV", -1)
        }
        
        FirstViewController.socket.on("newCV") {data, ack in
            
            if let id = data?[0] as? Int
                , let name = data?[1] as? String
                , let prenom = data?[2] as? String
                , let titre = data?[3] as? String
                , let lastFormation = data?[4] as? String
                , let experience = data?[5] as? String
            {
                let cv = CV(id: id, nom: name, prenom: prenom, titre: titre, lastFormation: lastFormation, experience: experience)
                self.arrayOfCv.append(cv)
                self.listCvView.reloadData()
            }
        }
        
        FirstViewController.socket.on("newXP") {data, ack in
            
        }
        
        FirstViewController.socket.connect()
        
        /*self.arrayOfCv.append(cv1)
        self.arrayOfCv.append(cv2)*/
    }
    
    // Segue is used to share datas between 2 controllers
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cvInfo = segue.destinationViewController as! CVInfoController
            
        if let indexPath  = self.listCvView.indexPathForCell(sender as! UITableViewCell) {
            let test = self.arrayOfCv[indexPath.row]
            cvInfo.cv = test
        }
    }
    
}

