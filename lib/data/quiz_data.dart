
import '../models/quiz_question.dart';

class QuizData {
  static Map<String, List<QuizQuestion>> getAllQuestions() {
    return {
      'General Knowledge': [
        QuizQuestion(
          question: 'Which chemical element has the symbol “W”?',
          options: ['Wolframium', 'Tungsten', 'Wardium', 'Wernium'],
          correctAnswer: 1,
        ),
        QuizQuestion(
          question: 'Which country has the longest coastline in the world?',
          options: ['Australia', 'Canada', 'Indonesia', 'Russia'],
          correctAnswer: 1,
        ),
        QuizQuestion(
          question: 'What landmark is this?',
          options: ['Eiffel Tower', 'Big Ben', 'The Kremlin', 'Sydney Tower'],
          correctAnswer: 1,
          imageUrl: 'assets/images/bigben.png',
        ),
        QuizQuestion(
          question: 'The word “robot” originated from which language, and what does it mean?',
          options: ['Latin – Machine', 'Russian – Metal', 'Czech – Worker / Forced labor', 'German – Automaton'],
          correctAnswer: 2,
        ),
        QuizQuestion(
          question: 'Which scientist developed the theory of relativity but won the Nobel Prize for something else?',
          options: ['Isaac Newton', 'Albert Einstein', 'Niels Bohr', 'Max Planck'],
          correctAnswer: 1,
        ),
        QuizQuestion(
          question: 'What bird is it?',
          options: ['Javan Hawk-Eagle', 'Bald Eagle', 'Pelican', 'Asian Golden Eagle'],
          correctAnswer: 1,
          imageUrl: 'assets/images/baldeagle.png',
        ),
        QuizQuestion(
          question: 'Which of the following is not a planet in our solar system?',
          options: ['Uranus', 'Pluto', 'Ceres', 'Neptune'],
          correctAnswer: 2,
        ),
        QuizQuestion(
          question: 'Which country was the first to use paper money?',
          options: ['Egypt', 'China', 'India', 'Persia'],
          correctAnswer: 1,
        ),
        QuizQuestion(
          question: 'Which famous painter cut off part of his own ear?',
          options: ['Pablo Picasso', 'Claude Monet', 'Vincent van Gogh', 'Leonardo da Vinci'],
          correctAnswer: 2,
        ),
        QuizQuestion(
          question: 'Which of the following numbers is the only even prime number?',
          options: ['1', '2', '3', '5'],
          correctAnswer: 1,
        ),
      ],
      'Greek History': [
        QuizQuestion(
          question: 'Who is in this picture',
          options: ['Poseidon', 'Zeus', 'Hades', 'Apollo'],
          correctAnswer: 1,
          imageUrl: 'assets/images/zeus.png',
        ),
        QuizQuestion(
          question: 'Which ancient Greek city was famous for its philosophers like Socrates and Plato?',
          options: ['Sparta', 'Athens', 'Corinth', 'Thebes'],
          correctAnswer: 1,
        ),
        QuizQuestion(
          question: 'Who led the Greek army and created one of the largest empires in history?',
          options: ['Achilles', 'Hector', 'Alexander the Great', 'Odysseus'],
          correctAnswer: 2,
        ),
        QuizQuestion(
          question: 'Where were the first Olympic Games held in ancient Greece?',
          options: ['Athens', 'Sparta', 'Olympia', 'Delphi'],
          correctAnswer: 2,
        ),
        QuizQuestion(
          question: 'How many years did the Trojan War last according to legend?',
          options: ['5', '10', '15', '20'],
          correctAnswer: 1,
        ),
        QuizQuestion(
          question: 'Who is the author of the famous Greek epics “The Iliad” and “The Odyssey”?',
          options: ['Homer', 'Sophocles', 'Plato', 'Aristotle'],
          correctAnswer: 0,
        ),
        QuizQuestion(
          question: 'What was the name of the huge statue that once stood in the harbor of Rhodes?',
          options: ['Parthenon', 'Colossus of Rhodes', 'Statue of Athena', 'Temple of Zeus'],
          correctAnswer: 1,
        ),
        QuizQuestion(
          question: 'Who was the teacher of Alexander the Great?',
          options: ['Socrates', 'Plato', 'Aristotle', 'Pythagoras'],
          correctAnswer: 2,
        ),
        QuizQuestion(
          question: 'Who was the Greek god of war?',
          options: ['Ares', 'Apollo', 'Hermes', 'Hephaestus'],
          correctAnswer: 0,
        ),
        QuizQuestion(
          question: 'The word “Marathon” comes from the legend of a messenger running from Marathon to which city?',
          options: ['Sparta', 'Athens', 'Corinth', 'Thebes'],
          correctAnswer: 1,
        ),
      ],
      'Guess the Song': [
        QuizQuestion(
          question: '“Cause baby you’re a firework, come on, show ’em what you’re worth!”',
          options: [
            'Firework - Katy Perry',
            'Halo - Beyoncé',
            'Born This Way - Lady Gaga',
            'Roar - Katy Perry'
          ],
          correctAnswer: 0,
        ),
        QuizQuestion(
          question: 'Which song is sung by Taylor Swift?',
          options: [
            'Viva La Vida',
            'Anti-Hero',
            'Blinding Lights',
            'Perfect'
          ],
          correctAnswer: 1,
        ),
        QuizQuestion(
          question: '“When I see your face, there’s not a thing that I would change, ’cause you’re amazing just the way you are.”',
          options: [
            'Perfect - Ed Sheeran',
            'All of Me - John Legend',
            'Just the Way You Are - Bruno Mars',
            'Love Yourself - Justin Bieber'
          ],
          correctAnswer: 2,
        ),
        QuizQuestion(
          question: '“I got my driver’s license last week, just like we always talked about.”',
          options: [
            'Drivers License - Olivia Rodrigo',
            'Happier Than Ever - Billie Eilish',
            'Traitor - Olivia Rodrigo',
            'Before He Cheats - Carrie Underwood'
          ],
          correctAnswer: 0,
        ),
        QuizQuestion(
          question: 'Which song is sung by Ed Sheeran?',
          options: [
            'Shape of You',
            'As It Was',
            'Uptown Funk',
            'Stay'
          ],
          correctAnswer: 0,
        ),
        QuizQuestion(
          question: '“Hello from the other side, I must have called a thousand times.”',
          options: [
            'Someone Like You - Adele',
            'Hello - Adele',
            'Rolling in the Deep - Adele',
            'Easy on Me - Adele'
          ],
          correctAnswer: 1,
        ),
        QuizQuestion(
          question: '“Just gonna stand there and watch me burn, but that’s alright because I like the way it hurts.”',
          options: [
            'Love the Way You Lie - Eminem ft. Rihanna',
            'Umbrella - Rihanna',
            'The Monster - Eminem ft. Rihanna',
            'Diamonds - Rihanna'
          ],
          correctAnswer: 0,
        ),
        QuizQuestion(
          question: '“I’m off the deep end, watch as I dive in, I’ll never meet the ground.”',
          options: [
            'Shallow - Lady Gaga & Bradley Cooper',
            'Perfect - Ed Sheeran',
            'Let It Go - Idina Menzel',
            'Halo - Beyoncé'
          ],
          correctAnswer: 0,
        ),
        QuizQuestion(
          question: 'Which song is sung by BTS?',
          options: [
            'Dynamite',
            'Boy With Luv',
            'Butter',
            'All of the above'
          ],
          correctAnswer: 3,
          imageUrl: 'assets/images/bts.png',
        ),
        QuizQuestion(
          question: '“I’m in love with the shape of you, we push and pull like a magnet do.”',
          options: [
            'Shape of You - Ed Sheeran',
            'Thinking Out Loud - Ed Sheeran',
            'Perfect - Ed Sheeran',
            'Photograph - Ed Sheeran'
          ],
          correctAnswer: 0,
        ),
      ],
      'Guess the Singer': [
        QuizQuestion(
          question: 'Who is the singer in this picture?',
          options: ['Adele', 'Taylor Swift', 'Ariana Grande', 'Billie Eilish'],
          correctAnswer: 1,
          imageUrl: 'assets/images/taylorswift.png',
        ),
        QuizQuestion(
          question: 'Who is this pop star known for the song “Shape of You”?',
          options: ['Ed Sheeran', 'Justin Bieber', 'Shawn Mendes', 'Charlie Puth'],
          correctAnswer: 0,
          imageUrl: 'assets/images/edsheeran.png',
        ),
        QuizQuestion(
          question: '“Cause baby you’re a firework, come on, show ’em what you’re worth!” — Who sang this?',
          options: ['Katy Perry', 'Rihanna', 'Lady Gaga', 'Miley Cyrus'],
          correctAnswer: 0,
        ),
        QuizQuestion(
          question: 'Who is this iconic pop legend known as the “King of Pop”?',
          options: ['Prince', 'Michael Jackson', 'Stevie Wonder', 'Bruno Mars'],
          correctAnswer: 1,
          imageUrl: 'assets/images/michaeljackson.png',
        ),
        QuizQuestion(
          question: '“Just gonna stand there and watch me burn, but that’s alright because I like the way it hurts.” — Who sang this?',
          options: ['Eminem', 'Rihanna', 'Adele', 'Beyoncé'],
          correctAnswer: 1,
        ),
        QuizQuestion(
          question: 'Who is this member of BTS?',
          options: ['V', 'Jimin', 'Jungkook', 'RM'],
          correctAnswer: 2,
          imageUrl: 'assets/images/jungkook.png',
        ),
        QuizQuestion(
          question: '“When I see your face, there’s not a thing that I would change, ’cause you’re amazing just the way you are.” — Who sang this?',
          options: ['Bruno Mars', 'John Legend', 'Justin Bieber', 'Charlie Puth'],
          correctAnswer: 0,
        ),
        QuizQuestion(
          question: 'Who is this famous female singer known for her ponytail hairstyle?',
          options: ['Selena Gomez', 'Ariana Grande', 'Dua Lipa', 'Doja Cat'],
          correctAnswer: 1,
          imageUrl: 'assets/images/arianagrande.png',
        ),
        QuizQuestion(
          question: '“Hello from the other side, I must have called a thousand times.” — Who sang this?',
          options: ['Adele', 'Rihanna', 'Celine Dion', 'Sia'],
          correctAnswer: 0,
        ),
        QuizQuestion(
          question: '“I got my driver’s license last week, just like we always talked about.” — Who sang this?',
          options: ['Olivia Rodrigo', 'Billie Eilish', 'Sabrina Carpenter', 'Tate McRae'],
          correctAnswer: 0,
        ),
      ],
    };
  }
}