class User < ActiveRecord::Base
    def self.create_user! ses
        #ses={[:user][:session_token]=>nil}
        print "-------------session22 #{ses}-----------------------------------"
        ses[:session_token] = SecureRandom.base64
        print "-------------#{ses[:session_token]}-----------------------------------"
       
        return User.create!(ses)
    end
end