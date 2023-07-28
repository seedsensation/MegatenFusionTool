//
//  StatsTable.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 28/07/2023.
//

import SwiftUI

struct StatsTable: View {
    var demon: Demon
    var body: some View {
        VStack {
            Spacer()
            LazyHStack {
                ForEach(compendium.stat_line.indices, id: \.self) {stat in
                    VStack {
                        Text(compendium.stat_line[stat])
                        Divider()
                        Text(String(demon.stats[stat]))
                    }
                    if stat != compendium.stat_line.count-1 {
                        Divider()
                    }
                }
            }
            Spacer()
        }
    }
}

struct StatsTable_Previews: PreviewProvider {
    static var previews: some View {
        StatsTable(demon: compendium.demon_data[0])
    }
}
