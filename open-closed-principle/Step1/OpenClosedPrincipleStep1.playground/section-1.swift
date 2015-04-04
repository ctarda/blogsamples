/*
    The backend provides a Program object in the services response. Also, it provides a "type" that identifies the type of program.
*/
enum ProgramType {
    case Movie
    case Episode
    case LiveProgram
}

// Simplified Program, for the shake of the example.
class Program {
    private(set) var title: String
    private(set) var type: ProgramType
    
    init(title: String, type: ProgramType) {
        self.title = title
        self.type = type
    }
}

/*
    Function to be called when the user taps a program. This shall launch the a different view controller according to the content that needs to be displayed.
*/
func navigateToDetails(program: Program) {
    switch program.type {
    case .Movie:
        println("It is a movie, navigate to Movie Details")
    case .Episode:
        println("It is an Episode, navigate to Episode Details")
    case .LiveProgram:
        println("It is a LiveProgram, navigate to Live Program Details")
    }
}

let sampleMovie = Program(title: "The Quiet Man", type: .Movie)
let sampleEpisode = Program(title: "CSI: S47E03", type: .Episode)

navigateToDetails(sampleMovie)
//navigateToDetails(sampleEpisode)