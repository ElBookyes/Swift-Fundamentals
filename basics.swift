
let movie = """
A day in 
the life of an
Apple engineer
""";

print(movie.count);
print(movie.hasPrefix("A day"));
print(movie.hasSuffix("engineer"));
print(movie.contains("Apple"));
print(movie.isEmpty);
print(movie.lowercased());
print(movie.uppercased());
print(movie.replacingOccurrences(of: "Apple", with: "Google"));
print(movie.split(separator: " "));
print(movie.split(separator: "\n"));
print(movie.split(separator: " ", maxSplits: 1));
print(movie.split(separator: " ", omittingEmptySubsequences: true));
print(movie.split(separator: " ", omittingEmptySubsequences: false));
print(movie.split(separator: " ", maxSplits: 1, omittingEmptySubsequences: true));
print(movie.split(separator: " ", maxSplits: 1, omittingEmptySubsequences: false));
print(movie.split(separator: " ", maxSplits: 2, omittingEmptySubsequences: true));
print(movie.split(separator: " ", maxSplits: 2, omittingEmptySubsequences: false));
print(movie.split(separator: " ", maxSplits: 3, omittingEmptySubsequences: true));

let score = 10;
let higherScore = score.advanced(by: 5);
let lowerScore = score.advanced(by: -5);
let halvedScore = score / 2;

let number = 120;
print(number.isMultiple(of: 3));

let id = Int.random(in: 1...1000);

let double = 3.0;

let isSaved = false;
isSaved.toggle();
print(isSaved);

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I am \(age) years old."
print(message);

var colors = ["red", "green", "blue"];
colors.append("yellow"); // can only append strings
colors.remove(at: 1);
colors.insert("orange", at: 1);
print(colors.count);
print(colors.isEmpty);
print(colors.contains("red"));


