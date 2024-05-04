//
//  HomeViewModelTests.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 4/30/24.
//

import XCTest

final class HomeViewModelTests: XCTestCase {
 
    // MARK: - Category
    
    func test_viewDidLoad가_input되면_카테고리_리스트를_output() throws { }
    
    func test_addCategory가_input될_때_카테고리_추가에_성공하면_output은_true() throws { }
    
    func test_addCategory가_input될_때_카테고리_추가에_실패하면_output은_false() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_성공하면_output은_true() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_성공하면_현재_카테고리는_전체_카테고리가_된다() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_성공하면_삭제된_카테고리의_게시글은_미설정_카테고리가_된다() throws { }
    
    func test_deleteCategory가_input될_때_카테고리_삭제에_실패하면_output은_false() throws { }
    
    
    // MARK: - Achievement
    
    func test_viewDidLoad가_input되면_사진_리스트를_output() throws { }
    
    func test_refresh가_input되면_사진_리스트를_output() throws { }
    
    func test_deletePhoto가_input될_때_성공하면_output은_true() throws { }
    
    func test_deletePhoto가_input될_때_실패하면_output은_false() throws { }
    
    func test_selectCategory가_input되면_해당_카테고리의_사진_리스트를_output() throws { }
}
