//
//  SegmentedPicker.swift
//  QuranSwiftUI
//
//  Created by Dorra Ben Abdelwahed on 27/6/2022.
//

import Foundation
import SwiftUI

struct SegmentedPickerView: View {
    let titles: [String]
    @Binding var selectedIndex: Int

    var body: some View {
        SegmentedPicker(
            titles,
            selectedIndex: Binding(
                get: { selectedIndex },
                set: { selectedIndex = $0 ?? 0 }),
            content: { item, isSelected in
                Text(item)
                    .foregroundColor(isSelected ? Color.white : Color.gray )
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            },
            selection: {
                Capsule()
                    .fill(Color.gray)
            })
            .animation(.easeInOut(duration: 0.3))
    }
}
