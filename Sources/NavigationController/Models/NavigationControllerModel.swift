//
//  File.swift
//  
//
//  Created by Ivan Dudarev on 6/23/21.
//

import SwiftUI

struct Screen: Identifiable , Equatable {
   
   let title: String
   let id: String
   let nextScreen: AnyView
   
   static func ==(lhs: Screen, rhs: Screen) -> Bool {
      lhs.id == rhs.id
   }
}


public struct ScreenStack {
   
   private var screens: [Screen] = .init()
   
   func topScreen() -> Screen? {
      screens.last
   }
   
   mutating func push(_ screen: Screen) {
      screens.append(screen)
   }
   
   mutating func popToRootScreen() {
      screens.removeAll()
   }
   
   mutating func popToPreviousScreen() {
      _ = screens.popLast()
   }
   
}
