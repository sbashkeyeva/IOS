//
//  ProblemGenerator.swift
//  QuizApp
//
//  Created by Symbat Bashkeyeva on 2/25/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

class ProblemGenerator {
    static func getQuizProblem() ->[Problem]{
        var problems=[Problem]()
        problems.append(Problem.init(image:"turtle",problemText: "What is Symbat's favorite song?", variantA: "Thank u, next", variantB: "All of me", variantC: "Rise Up", variantD: "River", answer: .C))
        problems.append(Problem.init(image:"jamesbrown",problemText: "Who sings SexyBack?", variantA: "Justin Timberlake", variantB: "Justin Bieber", variantC: "Usher", variantD: "Enrique Iglesias", answer: .A))
        problems.append(Problem.init(image:"sheeran",problemText: "Which mathematical symbol is not the name of an Ed Sheeran album?", variantA: "Plus", variantB: "Divide", variantC: "Multiply", variantD: "Subtract", answer: .D))
        problems.append(Problem.init(image:"brunomars",problemText: "Complete the Mark Ronson song title: Uptown...", variantA: "Beat", variantB: "Funk", variantC: "Girl", variantD: "Tunes", answer: .B))
        problems.append(Problem.init(image:"justin-bieber-3",problemText: "What is the song that launched Justin Bieber to superstardom?", variantA: "What Do You Mean?", variantB: "Sorry", variantC: "Baby", variantD: "Love Yourself", answer: .C))
        problems.append(Problem.init(image:"Taylor-Swift2",problemText: "Which Taylor Swift album is Shake It Off on?", variantA: "Speak Now", variantB: "Red", variantC: "Taylor Swift", variantD: "1989", answer: .D))
        problems.append(Problem.init(image:"beatles",problemText: "Which Beatle performed a James Bond theme song?", variantA: "John Lennon", variantB: "George Harrison", variantC: "Paul McCartney", variantD: "Ringo Starr", answer: .C))
        problems.append(Problem.init(image:"callmemaybe",problemText: "Who sings Call Me Maybe?",variantA: "Taylor Swift", variantB: "Lana Del Rey", variantC: "Carly Rae Jepsen", variantD: "Rihanna", answer: .C))
        problems.append(Problem.init(image:"rihanna",problemText: "Complete the Rihanna lyric: “We found love in a...”", variantA: "Dangerous place", variantB: "Deadly place", variantC: "Hopeless place", variantD: "Ravaged place", answer:  .C))
        problems.append(Problem.init(image:"katyperry",problemText: "What are you gonna hear Katy Perry do?", variantA: "Roar", variantB: "Scream", variantC: "Shout", variantD: "Howl", answer: .A))
        problems.append(Problem.init(image:"thriller",problemText: "In which video does Michael Jackson play a zombie?", variantA: "Bad", variantB: "Speed Demon", variantC: "Beat it", variantD: "Thriller", answer: .D))
        problems.append(Problem.init(image:"timberlake",problemText: "Which movie is Can't Stop the Feeling from?", variantA: "Suicide Squad", variantB: "Trolls", variantC: "Pitch Perfect", variantD: "Zootopia", answer: .B))
        problems.append(Problem.init(image:"miley",problemText: "Which Dolly Parton song did Miley Cyrus cover?", variantA: "Islands in the Stream", variantB: "Here you come again", variantC: "Coat of many colors", variantD: "Jolene", answer: .D))
        problems.append(Problem.init(image:"arianagrande",problemText: "Which pop star contributed a verse to Problem?", variantA: "Iggy Azalea", variantB: "Justin Bieber", variantC: "Selena Gomez", variantD: "Miley Cyrus", answer: .A))
        problems.append(Problem.init(image:"nickiminaj",problemText: "What does Nicki Minaj’s kind of man never do, according to Super Bass?", variantA: "Never sits in first class", variantB: "Never joins the Mile High Club", variantC: "Never flies coach", variantD: "Never drinks champagne", answer: .C))
        problems.append(Problem.init(image:"gangnamstyle",problemText: "Which country is Gangnam Style from?", variantA: "North Korea", variantB: "Japan", variantC: "China", variantD: "South Korea", answer: .D))
        problems.append(Problem.init(image:"whitneyhouston",problemText: "Which of these is NOT a Whitney Houston song?", variantA: "I Wanna Dance With Somebody", variantB: "Time After Time", variantC: "Greatest Love of All", variantD: "I Will Always Love you", answer: .B))
        
        return problems
    }
}
