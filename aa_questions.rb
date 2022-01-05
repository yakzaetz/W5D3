require 'singleton'
require 'sqlite3'


class QuestionsDatabase < SQLite3::Database

    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users
    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless user.length > 0

        Users.new(user.first) # user is stored in an array!
    end

    def self.find_by_name(fname, lname)
        
    end

end

class Questions
    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless question.length > 0

        Questions.new(question.first) # question is stored in an array!
    end
end 

class QuestionFollows
    def self.find_by_id(id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        return nil unless question_follow.length > 0

        QuestionFollows.new(question_follow.first) # question_follow is stored in an array!
    end

end


class Replies
    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replys
            WHERE
                id = ?
        SQL
        return nil unless reply.length > 0

        Replies.new(reply.first) # reply is stored in an array!
    end

end

class QuestionLikes
    def self.find_by_id(id)
        question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                id = ?
        SQL
        return nil unless question_like.length > 0

        QuestionLikes.new(question_like.first) # question_like is stored in an array!
    end

end