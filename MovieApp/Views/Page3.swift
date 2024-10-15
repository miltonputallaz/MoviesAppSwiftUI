//
//  Page3.swift
//  Prueba SwiftUI
//
//  Created by Milton Putallaz on 04/10/2024.
//

import Foundation

import Foundation
import SwiftUI

struct Page3: View {
    var body: some View {
        Text((Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String))
    }
}

#Preview {
    Page3()
}
