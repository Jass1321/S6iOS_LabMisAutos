//
//  TableViewControllerAutos.swift
//  S6_MisAutos
//
//  Created by MAC06 on 3/11/21.
//

/**NO SE USAAA*/
import UIKit

class TableViewControllerAutos: UITableViewController {

    var arregloAutos: [String] = ["Cabriolet", "CompactCar", "Pickup", "Minivan", "Coupe", "Familiar","Sedan","Camion","Safari","Bus"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
            self.navigationItem.rightBarButtonItem = self.editButtonItem
                setEditing(true, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arregloAutos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = arregloAutos[indexPath.row]
                switch cell.textLabel?.text {
                case "Cabriolet":
                    cell.imageView?.image = UIImage(named: "autos/1_Cabriolet.jpg")
                    cell.detailTextLabel?.text = "Sin techo"
                case "CompactCar":
                    cell.imageView?.image = UIImage(named: "autos/2_CompactCar.jpg")
                    cell.detailTextLabel?.text = "Son electronicos "
                case "Pickup":
                    cell.imageView?.image = UIImage(named: "autos/3_Pickup.jpg")
                    cell.detailTextLabel?.text = "Con caja trasera"
                case "Minivan":
                    cell.imageView?.image = UIImage(named: "autos/4_Minivan.png")
                    cell.detailTextLabel?.text = "Con puertas corredizas"
                case "Coupe":
                    cell.imageView?.image = UIImage(named: "autos/5_Coupe.jpeg")
                    cell.detailTextLabel?.text = "Solo con dos puertas"
                case "Familiar":
                    cell.imageView?.image = UIImage(named: "autos/6_Familiar.jpg")
                    cell.detailTextLabel?.text = "Para toda la familia"
                case "Sedan":
                    cell.imageView?.image = UIImage(named: "autos/7_Sedan.jpg")
                    cell.detailTextLabel?.text = "Los mas comunes"
                case "Camion":
                    cell.imageView?.image = UIImage(named: "autos/8_Camion.png")
                    cell.detailTextLabel?.text = "Para llevar mercancia"
                case "Safari":
                    cell.imageView?.image = UIImage(named: "autos/9_Safari.jpg")
                    cell.detailTextLabel?.text = "Los todo terrenos"
                case "Bus":
                    cell.imageView?.image = UIImage(named: "autos/10_Bus.png")
                    cell.detailTextLabel?.text = "Medio de transporte como el chino p"
                default:
                    print("No hay mas elementos para llenar imagen")
                    cell.detailTextLabel?.text = "Celda fuera de rango"
                }
                return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        /*
        if editingStyle == .delete {
            arregloAutos.remove(at: indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .insert {
            
        }*/
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let objetoMovido = self.arregloAutos[fromIndexPath.row]
        arregloAutos.insert(objetoMovido, at: to.row)
               NSLog("%@", "\(fromIndexPath.row) => \(to.row) \(arregloAutos)")    }
  
       override func setEditing(_ editing: Bool, animated: Bool) {
           super.setEditing(editing, animated: animated)
           if (self.isEditing){
               self.editButtonItem.title = "Opciones"
           }
           else {
               self.editButtonItem.title = "Home"
           }
       }
    
    
       override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
                      indexPath:IndexPath) -> UISwipeActionsConfiguration? {
          
           let contextItemDelete = UIContextualAction(style: .destructive, title: "Eliminar"){
               (contextualAction, view, boolValue) in
               self.arregloAutos.remove(at: indexPath.row)
               tableView.reloadData()
           }
          let swipeActions = UISwipeActionsConfiguration(actions: [contextItemDelete])
           
           return swipeActions
       }
    

}

