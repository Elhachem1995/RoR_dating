require 'data_mapper'

class User
  include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :description, String
    property :age, Integer
    property :interests, String
    property :photo, String
    property :availability, String
    property :location, String
    property :username, String, :unique => true
    property :password, BCryptHash

    def self.authenticate(username, password)
        user = first(username: username)
        return nil unless user

        if user.password == password
          user
        else
          nil
        end
      end

  end
