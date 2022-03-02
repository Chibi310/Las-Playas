//
//  MainMenu.swift
//  Las Playas
//
//  Created by Christopher Medina on 3/2/22.
//

import UIKit

class MainMenu: UIViewController {

    private var subMenu : SubMenu!;
    private var subMenuRevealWidth : CGFloat = 260;
    private let paddingForRotation : CGFloat = 150;
    private var isExpanded: Bool = false;
    
    private var subMenuTrailingConstraint: NSLayoutConstraint!;
    private var revealSubMenuOnTop : Bool = true;
    
    override public func viewDidLoad()
    {
        super.viewDidLoad();
        self.view.backgroundColor = #colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1);
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main);
        self.subMenu = storyboard.instantiateViewController(withIdentifier: "SubMenuID") as? SubMenu;
        self.subMenu.defaultHighlightedCell = 0;
        self.subMenu.delegate = self;
        view.insertSubview(self.subMenu!.view, at: self.revealSubMenuOnTop ? 2 : 0);
        addChild(self.subMenu!);
        self.subMenu!.didMove(toParent: self);
        
        self.subMenu.view.translatesAutoresizingMaskIntoConstraints = false;
        
        if self.revealSubMenuOnTop
        {
            self.subMenuTrailingConstraint = self.subMenu.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -self.subMenuRevealWidth - self.paddingForRotation);
            
            self.subMenuTrailingConstraint.isActive = true;
        }
        
        NSLayoutConstraint.activate([
            self.subMenu.view.widthAnchor.constraint(equalToConstant: self.subMenuRevealWidth),
            self.subMenu.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.subMenu.view.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        
        showViewController(viewController: UINavigationController.self, storyboardID: "MainMenuID");
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

extension MainMenu: SubMenuDelegate
{
    func selectedCell(_ row: Int)
    {
        switch(row)
        {
        case 0:
            self.showViewController(viewController: UINavigationController.self, storyboardId: "SubNav");
        case 1:
            self.showViewController(viewController: UINavigationController.self, storyboardId: "Room");
        case 2:
            self.showViewController(viewController: UINavigationController.self, storyboardId: "Gym");
        case 3:
            self.showViewController(viewController: UINavigationController.self, storyboardId: "Food");
        case 4:
            self.showViewController(viewController: UINavigationController.self, storyboardId: "Game");
        case 5:
            self.showViewController(viewController: UINavigationController.self, storyboardId: "Settings");
        default:
            break;
        }
        
        DispatchQueue.main.async {self.subMenuState(expanded: false) }
    }
    
    func showViewController<T: UIViewController>(vewController: T.Type, storyboardId: String) -> ()
    {
        for subview in view.subviews
        {
            if(99 == subview.tag) { subview.removeFromSuperview() }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T;
        vc.view.tag = 99;
        view.insertSubview(vc.view, at: self.revealSubMenuOnTop ? 0 : 1);
        addChild(vc);
        if(!self.revealSubMenuOnTop)
        {
            if(isExpanded) { vc.view.frame.origin.x = self.subMenuRevealWidth; }
            if(nil != self.subMenuShadowView) { vc.view.addSubview(self.subMenuShadowView); }
        }
        vc.didMove(toParent: self);
    }
    
    func subMenuState(expanded: Bool)
    {
        if(expanded)
        {
            self.animateSideMenu(targetPosition: self.revealSubMenuOnTop ? 0 : self.subMenuRevealWidth) { _ in self.isExpanded = true; }
            UIView.animate(withDuration: 0.5) { self.subMenuShadowView.alpha = 0.6 }
        }
        else
        {
            self.animateDubMenu(targetPosition: self.revealSubMenuOnTop ? (-self.subMenuRevealWidth - self.paddingForRotation) : 0) { _ in self.isExpanded = false }
        }
        UIView.animate(withDuration: 0.5) { self.subMenuShadowView.alpha = 0.0 }
    }
    
    func animateSubMenu(targetPosition: CGFloat, completion: @escaping(Bool) -> ())
    {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .layoutSubviews, animations:
                        {
            if (self.revealSubMenuOnTop)
            {
                self.subMenuTrailingConstraint.constant = targetPosition;
                self.view.layoutIfNeeded();
            }
            else
            {
                self.view.layoutIfNeeded();
            }
        }, completion: completion)
    }
}

extension UIViewController
{
    func revealViewController() -> MainMenu?
    {
        var viewController: UIViewController? = self;
        
        if(nil != viewController && viewController is MainMenu) { return viewController! as? MainMenu; }
        
        while(!(viewController is MainMenu) && nil != viewController?.parent)
        {
            viewController = viewController?.parent;
        }
        if(viewController is MainMenu) { return viewController as? MainMenu; }
        
        return nil;
    }
}

@IBAction open func revealSubMenu() { self.subMenuState(expanded: self.isExpanded ? false : true); }
