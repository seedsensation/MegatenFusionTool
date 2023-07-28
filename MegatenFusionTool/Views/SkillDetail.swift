//
//  SkillDetail.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 28/07/2023.
//

import SwiftUI

struct SkillDetail: View {
    var skill: Skill
    var body: some View {
        ScrollView {
            VStack{
                VStack(alignment: .leading) {
                    Text("\(skill.name)")
                        .font(.title)
                    
                    HStack {
                        Text("\(skill.elem)")
                        Spacer()
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About This Skill")
                        .font(.title2)
                    
                    if skill.cost != nil {
                        Text("Cost: \(skill.cost!-1000) MP")
                    }
                    
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct SkillDetail_Previews: PreviewProvider {
    static var previews: some View {
        SkillDetail(skill: compendium.skill_data[0])
    }
}
