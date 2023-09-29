import SwiftUI

struct ContentView: View {
    @State private var tasks: [String] = []
    @State private var newTask = ""

    var body: some View {
        VStack {
            Text("Lista de Tarefas")
                .font(.largeTitle)
                .padding()

            HStack {
                TextField("Nova Tarefa", text: $newTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    if !newTask.isEmpty {
                        tasks.append(newTask)
                        newTask = ""
                    }
                }) {
                    Text("Adicionar")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }

            List {
                ForEach(0..<tasks.count, id: \.self) { index in
                    Text(tasks[index])
                }
                .onDelete(perform: deleteTask)
            }
            .listStyle(PlainListStyle())
        }
        .padding()
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

