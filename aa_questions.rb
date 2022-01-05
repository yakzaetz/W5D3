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
        id = QuestionsDatabase.instance.execute("SELECT id FROM users")
    end 
end

class Questions
    def find_by_id
end 