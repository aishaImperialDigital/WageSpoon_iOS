//
//  Qualification
//  
//
//  Created by gqgnju on 8/08/17.
//
//


class Qualification: NSObject {
    // MARK: Properties
    public var qualification_from: String?
    public var qualification_id: String?
    public var qualification_name: String?
    public var qualification_to: String?
    
    override init() {
        
        qualification_from = ""
        qualification_id = ""
        qualification_name = ""
        qualification_to = ""
    }
    
    func setQualification(qualification: Qualification)  {
        
        qualification_from = qualification.qualification_from
        qualification_id = qualification.qualification_id
        qualification_name = qualification.qualification_name
        qualification_to = qualification.qualification_to
    }
}
