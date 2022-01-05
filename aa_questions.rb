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
        data = PlayDBConnection.instance.execute("SELECT * FROM plays")
        data.map { |datum| Play.new(datum) }
    end 
end

class Questions
    def find_by_id
end 