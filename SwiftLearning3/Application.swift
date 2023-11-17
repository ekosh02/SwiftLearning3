class Application {
    private let calculatorKey: String = "c"
    private let tictacKey: String = "t"
    private let exitKey: String = "q"
    
    private lazy var SubAppList: [String: SubAppProtocol] = {
           return [
               calculatorKey: Calculator(),
               tictacKey: TicTac()
           ]
    }()
    
    func run() {
        getInstruction()
        runSubApp(key: getSubAppKey())
    }
    
    private func getInstruction() {
        print("Добры пожаловать в мою подпрограмму\nЧтобы использовать калькулятор нажмите на букву \"\(calculatorKey)\"\nЧтобы использовать крестики нолики нажмите на букву \"\(tictacKey)\"\nЧтобы выйти нажмите на \"\(exitKey)\"")
    }
    
    private func getSubAppKey() -> String {
        while true {
            let input = readLine() ?? ""
            let parseInput = String(input)
            if calculatorKey == parseInput || exitKey == parseInput || tictacKey == parseInput{
                return parseInput
            } else {
                print("Некорректные данные")
            }
        }
    }
    
    private func runSubApp(key: String) {
       
        if let subApp = SubAppList[key] {
            print("key", key)
            if key == calculatorKey {
                print("Загрузка калькулятора...")
            } else if key == tictacKey {
                print("Загрузка крестики нолики...")
            }
            subApp.run()
        } else if key == exitKey {
            print("Выход из подпрограммы")
        } else {
            print("Ошибка программы", key)
        }
    }
    
}
