//
//  ModalView.swift
//  Kadai14
//
//  Created by nobu0621 on 2024/11/22.
//

import SwiftUI

struct ModalView: View {
    @Binding var isModal: Bool
    @State var newFruitText = ""
    @Binding var fruitArray: [Fruit]

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isModal = false
                }, label: {
                    Text("Cancel")
                })
                .padding()

                Spacer()

                Button(action: {
                    // スペースのみの場合は項目を追加しない
                    let inputText = newFruitText.trimmingCharacters(in: .whitespaces)

                    if !inputText.isEmpty {
                        let newFruit = Fruit.init(name: String(newFruitText), isChecked: false)
                        fruitArray.append(newFruit)
                    }
                    isModal = false
                }, label: {
                    Text("Save")
                })
                .padding()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(.gray.opacity(0.2))

            HStack {
                Text("名前")
                TextField("", text: $newFruitText)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            }
            .frame(height: 100)
            Spacer()
        }
    }
}

#Preview {
    ModalView(isModal: .constant(false), fruitArray: .constant([Fruit(name: "abc", isChecked: true)]))
}