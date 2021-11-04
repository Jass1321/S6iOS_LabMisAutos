//
//  ViewControllerHome.swift
//  S6_MisAutos
//
//  Created by MAC06 on 4/11/21.
//

import UIKit

class ViewControllerHome: UIViewController {

    var listData = [
        Data(name: "Cabriolet", details:"Sin techo",image:"autos/1_Cabriolet.jpg"),
        Data(name: "CompactCar", details:"Son electronicos", image:"autos/2_CompactCar.jpg"),
        Data(name: "Pickup", details:"Sin techo", image:"autos/3_Pickup.jpg"),
        Data(name: "Minivan", details:"Con puertas corredizas", image:"autos/4_Minivan.png"),
        Data(name: "Coupe", details:"Solo con dos puertas", image:"autos/5_Coupe.jpeg"),
        Data(name: "Familiar", details:"Para toda la familia", image:"autos/6_Familiar.jpg"),
        Data(name: "Sedan", details:"Los mas comunes", image:"autos/7_Sedan.jpg"),
        Data(name: "Camion", details:"Para llevar mercancia", image:"autos/8_Camion.png"),
        Data(name: "Safari", details:"Los todo terreno", image:"autos/9_Safari.jpg"),
        Data(name: "Bus", details:"Como el chosicano p", image:"autos/10_Bus.png")
    ]

    @IBOutlet weak var myPageMain: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ACCIONES
        setUpTable()
    }
    
    func setUpTable() {
        myPageMain.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cellInfo")
        myPageMain.dataSource = self
        myPageMain.delegate = self
        self.myPageMain.isEditing = true
    }
 
}

extension ViewControllerHome : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = listData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellInfo", for: indexPath) as! TableViewCell
        cell.onBind(image: data.image, name: data.name)
        
        return cell
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = listData[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let cv = storyboard.instantiateViewController(withIdentifier: "DetailsView") as! DetailViewController
        cv.data = data
        present(cv, animated: true, completion: nil)
    }
    // reemplazo de editing
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        /*
        if editingStyle == .delete {
            listData.remove(at: indexPath.row)
            myPageMain.reloadData()
        }*/
    }
    // reemplazo de moveRowAt
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to : IndexPath) {
        print("movimiento")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
                       indexPath:IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .normal, title: "Ver màs"){ [self]
                (contextualAction, view, boolValue) in
            let data = self.listData[indexPath.row]
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                let cv = storyboard.instantiateViewController(withIdentifier: "DetailsView") as! DetailViewController
                cv.data = data
                present(cv, animated: true, completion: nil)
                tableView.reloadData()
            }
            let contextItemDelete = UIContextualAction(style: .destructive, title: "Eliminar"){
                (contextualAction, view, boolValue) in
                self.listData.remove(at: indexPath.row)
                self.myPageMain.reloadData()
            }
            
            let swipeActions = UISwipeActionsConfiguration(actions: [contextItem, contextItemDelete])
            
            return swipeActions
        }
    
    
}

struct Data{
    var name:String
    var details: String
    var image: String
}

