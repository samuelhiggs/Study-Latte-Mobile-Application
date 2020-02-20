//
//  DetailsPageViewController.swift
//  studylattefinal
//
//  Created by Shayan Khan on 5/3/18.
//  Copyright © 2018 Samuel Higgs. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

// Creates array for Favorites list
var favList:[MKMapItem] = []


class DetailsPageViewController: UIViewController {
    var shop:MKMapItem?
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var isOpenLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var isFav: UILabel!
    @IBAction func toggleOpen(_ sender: Any) {
        if (shop?.phoneNumber!.contains("1"))! {
            shop?.phoneNumber = "0"
            openTable(isOpen:false)
        }
        else {
            shop?.phoneNumber = "1"
            openTable(isOpen:true)
        }
    }
    
        @IBAction func removeFromFav(_ sender: Any) {
            if (favList.contains(shop!)) {
                favList.remove(at: favList.index(of: shop!)!)
                removeBtn.isHidden = true
                addBtn.isHidden = false
                isFav.isHidden = true
            }
        }
    
    @IBAction func appendToFavArray(_ sender: Any) {
        // append the current label and location to favorites list
        if (!favList.contains(shop!)) {
            favList.append(shop!)
            isFav.isHidden = false
            addBtn.isHidden = true
            removeBtn.isHidden = false
            print(favList)
            print("BREAK")
        }
    }
    
    override func viewDidLoad() {
        
        removeBtn.isHidden = true
        isFav.isHidden = true
        populateUI()
        
        if (favList.contains(shop!)) {
            isFav.isHidden = false
            addBtn.isHidden = true
            removeBtn.isHidden = false
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
        func populateUI() {
            if let shop = shop {
                shopName.text = shop.name
                addressLabel.text = parseAddress(selectedItem: shop.placemark)
                self.title = shop.name
                if shop.phoneNumber!.contains("1") {
                    openTable(isOpen:true)
                } else{
                    print(shop.phoneNumber!)
                    openTable(isOpen:false)
                }
            }
    }
    
    func openTable(isOpen:Bool){
        if isOpen == true{
            let image = UIImage(named: "green100") as UIImage?
            imageView.image = image
            isOpenLabel.text = "Seats available!"
            
        } else{
            let image = UIImage(named: "red100") as UIImage?
            imageView.image = image
            isOpenLabel.text = "No seats available"
        }
        
    }
    
    func parseAddress(selectedItem:MKPlacemark) -> String {
        // put a space between "4" and "Melrose Place"
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
        // put a comma between street and city/state
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
        // put a space between "Washington" and "DC"
        let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
        let addressLine = String(
            format:"%@%@%@%@%@%@%@",
            // street number
            selectedItem.subThoroughfare ?? "",
            firstSpace,
            // street name
            selectedItem.thoroughfare ?? "",
            comma,
            // city
            selectedItem.locality ?? "",
            secondSpace,
            // state
            selectedItem.administrativeArea ?? ""
        )
        return addressLine
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
