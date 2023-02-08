require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database 
    #our QuestionsDBConnection.instance will connect us to the DB. :)

    include Singleton

    def initialize
        super("questions.db")

        self.type_translation = true
        self.results_as_hash = true

    end
end

# ::Find_by_id --- and should contain object#new somewhere
# object#initialize will take a hash structure of info to contrust the object. 
# attr_accessor for all classes~
class User

    def initialize

    end


end


class Question

    def find_by_id
        
        data = QuestionsDBConnection.instance.execute(
            SELECT 
                *
            FROM
                questions
        )


    end


end

