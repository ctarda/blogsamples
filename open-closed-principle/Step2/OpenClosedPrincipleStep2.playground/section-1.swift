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

// Protocol that abstract the behaviour: navigating to the view that contains the Program's extended info.
protocol Router {
    func canHandleProgram(program: Program)->Bool
    func navigateTo(program: Program)
}

// Implementation of the Router protocol that navigates to the Movie extended info
final class MovieRouter: Router {
    func canHandleProgram(program: Program)->Bool {
        return program.type == .Movie
    }
    
    func navigateTo(program: Program) {
        println("It is a movie, navigate to Movie Details")
    }
}

// Implementation of the Router protocol that navigates to the Episode extended info
final class EpisodeRouter: Router {
    func canHandleProgram(program: Program)->Bool {
        return program.type == .Episode
    }
    
    func navigateTo(program: Program) {
        println("It is an Episode, navigate to Episode Details")
    }
}

// Implementation of the Router protocol that navigates to the LiveProgram extended info
final class LiveProgramRouter: Router {
    func canHandleProgram(program: Program)->Bool {
        return program.type == .LiveProgram
    }
    
    func navigateTo(program: Program) {
        println("It is a LiveProgram, navigate to Live Program Details")
    }
}

/*
    Function to be called when the user taps a program. All logic related to navigation has been removed from this function. A naive implementation of this method would loop the routers array, and when it finds one that responds true to canHandleProgram, it would call navigateTo on it.

    Here, we use the first element returned by filter. If we add more routers, we do not need to touch this method. If the implementation of Program changes we do not need to touch this method either.
*/
func navigateToDetails(program: Program, routers:[Router]) {
    let matchingRouters = routers.filter({$0.canHandleProgram(program)})
    if let router = matchingRouters.first {
        router.navigateTo(program)
    }
}

let routers:[Router] = [MovieRouter(), EpisodeRouter(), LiveProgramRouter()]
let sampleMovie = Program(title: "The Quiet Man", type: .Movie)
let sampleEpisode = Program(title: "CSI: S43E02", type: .Episode)

navigateToDetails(sampleMovie, routers)
//navigateToDetails(sampleEpisode, routers)

