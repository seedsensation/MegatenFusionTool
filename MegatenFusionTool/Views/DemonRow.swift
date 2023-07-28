//
//  DemonRow.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 27/07/2023.
//

import SwiftUI

struct DemonRow: View {
    var demon: Binding<Demon>
    
    public init(demon: Binding<Demon>) {
        self.demon = demon
    }
    
    public var body: some View {
        HStack {
            Text("\(demon.wrappedValue.name) (\(demon.wrappedValue.lvl))")
        }
    }
}

struct DemonRow_Previews: PreviewProvider {
    static var previews: some View {
        @State var selected_demon = compendium.demon_data[0]

        Group {
            var x = $selected_demon
            DemonRow(demon: x)
            DemonRow(demon: x)
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
