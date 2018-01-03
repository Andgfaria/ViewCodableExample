/*
 Copyright 2017 André Gimenez Faria
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


import UIKit

//MARK: - Protocol
/*
 This is a protocol I use to easily organize UI handling code.
 Simply adopt this protocol, customize the methods which suit you best and call the main setup function.
 */

protocol ViewCodable {
    
    /*
     This function calls all other functions in the correct order.
     You can use it in an UIViewController viewDidLoad method or in a view initializer, for example.
     */
    func setup(with views : [UIView])
    
    //  This function should be used to add your custom views to the views hierarchy
    func addToHierarchy(_ views : [UIView])
    
    // This function should be used to add constraints to your customs views
    func setupConstraints()
    
    /*
     This function should be used to apply styles to your customs views.
     You could change colors, fonts, alignments or other properties here.
     */
    func setupStyles()
    
    /*
     This function should be used to link actions to your customs views.
     For example, you could add a selector to a button or use reactive bindings here.
     */
    func bindComponents()
    
    /*
     This function should be used to assign accessibility idientifiers to your custom views.
     It might come in handy if you are writing UI tests.
     */
    func setupAcessibilityIdentifiers()
}


//MARK: - Default implementations
extension ViewCodable {
    
    func setup(with views : [UIView]) {
        addToHierarchy(views)
        setupConstraints()
        setupStyles()
        bindComponents()
        setupAcessibilityIdentifiers()
    }
    
    // Making some of the functions optional, since they might not apply to every context
    
    func setupConstraints() { }
    
    func setupStyles() { }
    
    func bindComponents() { }
    
    func setupAcessibilityIdentifiers() { }
    
}

//MARK: - UI extensions
extension ViewCodable where Self : UIView {
    
    func addToHierarchy(_ views : [UIView]) {
        add(views, to: self)
    }
    
}

extension ViewCodable where Self : UIViewController {
    
    func addToHierarchy(_ views : [UIView]) {
        add(views, to: view)
    }
    
}

extension ViewCodable where Self : UITableViewCell {
    
    func addToHierarchy(_ views : [UIView]) {
        add(views, to: contentView)
    }
    
}

//MARK: - Helpers
private func add(_ views : [UIView], to parentView : UIView) {
    views.forEach {
        $0.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview($0)
    }
}
