enum ProgramType {
    case Movie
    case Episode
    case LiveProgram
}

class Program {
    private(set) var title: String
    private(set) var type: ProgramType
    
    init(title: String, type: ProgramType) {
        self.title = title
        self.type = type
    }
}
/*
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
*/
///

protocol Router {
    func canHandleProgram(program: Program)->Bool
    func navigateTo(program: Program)
}

final class MovieRouter: Router {
    func canHandleProgram(program: Program)->Bool {
        return program.type == .Movie
    }
    
    func navigateTo(program: Program) {
        println("It is a movie, navigate to Movie Details")
    }
}

final class EpisodeRouter: Router {
    func canHandleProgram(program: Program)->Bool {
        return program.type == .Episode
    }
    
    func navigateTo(program: Program) {
        println("It is an Episode, navigate to Episode Details")
    }
}

final class LiveProgramRouter: Router {
    func canHandleProgram(program: Program)->Bool {
        return program.type == .LiveProgram
    }
    
    func navigateTo(program: Program) {
        println("It is a LiveProgram, navigate to Live Program Details")
    }
}

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
navigateToDetails(sampleEpisode, routers)

