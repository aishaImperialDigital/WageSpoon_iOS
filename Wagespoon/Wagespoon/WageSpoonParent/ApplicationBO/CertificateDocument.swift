//
//  CertificateDocument.swift
//  Wagespoon
//
//  Created by gqgnju on 9/08/17.
//  Copyright © 2017 Developer. All rights reserved.
//


class CertificateDocument: NSObject {
    // MARK: Properties
    public var document_id: String?
    public var document_name: String?
    public var document_pic: String?
    override init() {
        document_id = ""
        document_name = ""
        document_pic = ""
    }
    func setCertificateDocument(certificateDocument: CertificateDocument) {
        document_id = certificateDocument.document_id
        document_name = certificateDocument.document_name
        document_pic = certificateDocument.document_pic
    }
}
