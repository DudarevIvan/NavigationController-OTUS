//
//  File.swift
//  
//
//  Created by Ivan Dudarev on 6/23/21.
//

import SwiftUI

public protocol NavigationTitle: View {
   var title: String { get }
}

public struct NavigationBar: View {
   
   @EnvironmentObject var viewModel: NavigationControllerViewModel
   
   var title: String
   var isRoot: Bool
   
   public var body: some View {
      VStack(alignment: .leading) {
         HStack(alignment: .center) {
            if !isRoot {
               NavigationPopButton() {
                  Image(systemName: "chevron.backward")
                     .font(Font.headline.weight(.heavy))
               }
            }
            Spacer()
            Text(title)
               .foregroundColor(.white)
               //.fontWeight(.heavy)
               .offset(x: (isRoot ?  0 : -10))
            Spacer()
         }
         .animation(.none)
      }
      .padding(.top, 10)
      .frame(maxWidth: .infinity)
   }
}
