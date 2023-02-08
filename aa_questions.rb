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


    def self.find_by_id(question_id)
        
        question_data = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
            SELECT 
                *
            FROM 
                questions
            WHERE 
                id = ?;
        
        SQL

        return Question.new(question_data[0])


    end

    attr_accessor :id, :title, :body, :author_id 

    def initialize(info_hash)

        @id = info_hash['id']
        @title = info_hash['title']
        @body = info_hash['body']
        @author_id = info_hash['author_id']

    end 

end

