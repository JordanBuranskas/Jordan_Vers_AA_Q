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
    attr_accessor :fname, :lname, :id

    def initialize(user_hash)

        @fname = user_hash['fname']
        @lname = user_hash['lname']
        @id = user_hash['id']

    end

    def self.find_by_id(user_id)

        user_data = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?;

        SQL

        return User.new(user_data[0])

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


class Question_follows

    attr_accessor :id, :question_id, :question_follower_id

    def initialize(q_follows_hash)

        @id = q_follows_hash["id"]
        @question_id = q_follows_hash["question_id"]
        @question_follower_id = q_follows_hash["question_follower_id"]

    end

    def self.find_by_id(q_follows_id)

        q_follows_data = QuestionsDBConnection.instance.execute

    end


end
