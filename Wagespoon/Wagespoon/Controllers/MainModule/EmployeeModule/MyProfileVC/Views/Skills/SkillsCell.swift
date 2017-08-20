//
//  CommonCell
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit
class SkillsCell: MyProfileParentCell{
   

    @IBOutlet var holderView: UIView!
    var tagListView:TagListView!
    var skillsModel: [WageSpoonSkillsList]?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialization code
        Bundle.main.loadNibNamed("SkillsCell", owner: self, options: nil)
        holderView.backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        contentView.addSubview(holderView)
        
        
        skillsModel = [WageSpoonSkillsList.init(data:"")]
       
    }
    
    func tap(_ sender: Any?) {
        
    }
    func longPress(_ sender: Any?) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setProfileData(){
        tagListView = TagListView(frame: CGRect(x: 0, y: self.holderView.frame.height - 100, width: self.holderView.frame.width, height: 100))
        holderView.addSubview(tagListView)
        tagListView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        //  tagListView.layer.borderColor = UIColor.black.cgColor
        tagListView.layer.borderWidth = 0.2
        for (_,i) in (skillsModel?.enumerated())!
        {
            tagListView.addTag(("#"+i.skillsName!), target: self, tapAction: #selector(SkillsCell.tap(_:)), longPressAction: #selector(SkillsCell.longPress(_:)),backgroundColor: UIColor.white, textColor: UIColor.black)

        }

    }
}
