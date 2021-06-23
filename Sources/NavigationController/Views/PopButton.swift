//
//  File.swift
//  
//
//  Created by Ivan Dudarev on 6/23/21.
//

import SwiftUI

struct NavigationPopButton<Label>: View where Label: View {
   
   @EnvironmentObject var viewModel: NavigationControllerViewModel
   
   private let label: () -> Label
   private let destination: PopDestination
   
   public init(destination: PopDestination = .previous, @ViewBuilder label: @escaping () -> Label) {
      self.label = label
      self.destination = destination
   }
   
   public var body: some View {
      label()
         .onTapGesture {
            viewModel.pop(to: destination)
         }
   }
}
