//
//  SafeAreaHelper.swift
//  Touchdown
//
//  Created by Aaron Sutton on 1/26/22.
//

import SwiftUI

func getSafeAreaTop() -> CGFloat{
  let keyWindow = UIApplication.shared.connectedScenes
    .filter({$0.activationState == .foregroundActive})
    .map({$0 as? UIWindowScene})
    .compactMap({$0})
    .first?.windows
    .filter({$0.isKeyWindow}).first
  return (keyWindow?.safeAreaInsets.top) ?? 0
}
