require 'gmail'
require 'dotenv'
Dotenv.load('.env')

username = ENV['USERNAME']
password = ENV['PASSWORD']
def connect(username,password)
    gmail = Gmail.connect(username,password)
    if gmail.logged_in?
    return gmail
    else
        return false
    end
end

def delete_unready()
    if connect() != :null
        gmail = connect()
        unread_email = gmail.inbox.find(:unread)
        i = 0
        puts "========== unread email : #{unread_email.count} ============="
        unread_email.each do |email|
            puts "==== delete email number #{i} #{email} ==="
            email.delete!
            i.next
        end
        puts "=== end delete"
        
    end

end