//
//  File.swift
//  
//
//  Created by Ivan Dudarev on 6/23/21.
//

import SwiftUI

public struct NavigationControllerView<Content: View & NavigationTitle>: View {
   
   @ObservedObject var viewModel: NavigationControllerViewModel
   
   private let content: Content
   private let transitions: (push: AnyTransition, pop: AnyTransition)
   
   public init(@ViewBuilder content: @escaping () -> Content, transition: NavigationTransition, easing: Animation = .easeInOut(duration: 0.33)) {
      self.content = content()
      self.viewModel = .init(easing: easing)
      
      switch transition {
         case .custom(let tr):
            self.transitions = (tr, tr)
         default:
            self.transitions = (.identity, .identity)
      }
   }
   
   public var body: some View {
      let isRootView = viewModel.currentScreen == nil
      return ZStack {
         VStack(spacing: 0) {
            NavigationBar(title: isRootView ? content.title : viewModel.currentScreen!.title, isRoot: isRootView)
               .padding(.horizontal, 15)
               .padding(.bottom)
               .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
               .background(Color("mainColor"))
               .environmentObject(viewModel)
            if isRootView {
               content
                  .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop)
                  .environmentObject(viewModel)
            } else {
               viewModel.currentScreen!.nextScreen
                  .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop)
                  .environmentObject(viewModel)
            }
         }
      }
      .ignoresSafeArea(.all, edges: .top)
      .background(Color.white)
   }
}
