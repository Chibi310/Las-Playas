//
//  SubMenu.swift
//  Las Playas
//
//  Created by Christopher Medina on 3/2/22.
//

import UIKit

protocol SubMenuDelegate { func selectedCell(_ row: Int); }


class SubMenu: UIViewController
{
    @IBOutlet var headerImageView: UIImageView!;
    @IBOutlet var subMenuTableView: UITableView!;
    @IBOutlet var footerLabel : UILabel!;
    
    var defaultHighlightedCell: Int = 0;
    
    var delegate: SubMenuDelegate?;
    
    var menu: [SubMenuModel] =
    [
        SubMenuModel(Icon: UIImage(systemName: "house.fill")!, Title: "Home"),
        SubMenuModel(Icon: UIImage(systemName: "music.note")!, Title: "Room"),
        SubMenuModel(Icon: UIImage(systemName: "film.fill")!, Title: "Gym"),
        SubMenuModel(Icon: UIImage(systemName: "book.fill")!, Title: "Food"),
        SubMenuModel(Icon: UIImage(systemName: "person.fill")!, Title: "Game"),
        SubMenuModel(Icon: UIImage(systemName: "slider.horizontal.3")!, Title: "Settings")
    ]

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.subMenuTableView.delegate = self;
        self.subMenuTableView.dataSource = self;
        self.subMenuTableView.backgroundColor = #colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1) ;
        self.subMenuTableView.separatorStyle = .none;
        
        DispatchQueue.main.async
        {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0);
            self.subMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none);
        }
        
        self.footerLabel.textColor = UIColor.white;
        self.footerLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold);
        self.footerLabel.text = "Programmed by Bravo Team";
        
        self.subMenuTableView.register(SubMenuCell.Nib, forCellReuseIdentifier: SubMenuCell.Identifier);
        
        self.subMenuTableView.reloadData();
        // Do any additional setup after loading the view.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SubMenu: UITableViewDelegate {  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 44; } }

extension SubMenu: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    { return self.menu.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SubMenuCell.Identifier, for: indexPath) as? SubMenuCell else { fatalError("xib is missing") }
        
        cell.iconImageView.image = self.menu[indexPath.row].Icon;
        cell.titleLabel.text = self.menu[indexPath.row].Title;
        
        let myCustomSelectionColorView = UIView();
        myCustomSelectionColorView.backgroundColor = #colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1);
        cell.selectedBackgroundView = myCustomSelectionColorView;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.delegate?.selectedCell(indexPath.row);
        
        if (4 == indexPath.row || 6 == indexPath.row) { tableView.deselectRow(at: indexPath, animated: true) }
    }
    
}

struct SubMenuModel
{
    var Icon : UIImage;
    var Title : String;
}

class SubMenuCell : UITableViewCell
{
    class var Identifier : String { return String(describing: self); }
    class var Nib : UINib { return UINib(nibName: Identifier, bundle: nil); }
    
    @IBOutlet var iconImageView: UIImageView!;
    @IBOutlet var titleLabel: UILabel!;
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.backgroundColor = .clear;
        self.iconImageView.tintColor = .white;
        self.titleLabel.textColor = .white;
    }
    
}
