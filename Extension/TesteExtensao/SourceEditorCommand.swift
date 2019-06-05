//
//  SourceEditorCommand.swift
//  TesteExtensao
//
//  Created by Thiago B Claramunt on 05/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
        
        completionHandler(nil)
    }
    
}
