require 'gdbm'

is_running = true
db_hash = {}
gdbm = GDBM.new("database.db")
gdbm.each_pair do |key, value|
  db_hash[key] = value
end
puts "Welcome to our simple db program, input your command."
puts "Here is the list of commands."
puts 'set: saves data to the memory. Example: set 1 "test data".'
puts "commit: saves data to the database."
puts "get: loads data from database. Example: get 1."
puts "getall: prints all the elements in the database."
puts "clear: Clears the database and the hash."
puts "exit: exits the program. Example: exit."
puts "help: prints the commands again."
while(is_running) do
	command = gets
	data = command.split('"')[1]
	command = command.split(' ')
	case command[0]
	when "get"
		if command[1].to_i.to_s == command[1] then
	  	puts "The value is: " + db_hash[command[1]]
	  else
	  	puts "You didn't specify a number."
	  end
	when "set"
		unless command[1].to_i.to_s == command[1] then
	  	puts "The key should be a Integer."
	  else
			unless data then
				puts "No data to set, please specify data. Maybe you forgot to add quotation marks."
			else
		  	db_hash[command[1]] = data
		  	puts "The value " + data + " was added to the database."
			end
		end
	when "getall"
		puts "Here is a list of all the key value pairs in the hash."
		puts "-------------------------------------------------------"
		db_hash.each do |key, value|
  		puts "#{key}: #{value}"
		end
		puts "-------------------------------------------------------"
	when "commit"
		db_hash.each do |k, v|
			gdbm[k] = v
		end
		puts "Data in hash is saved to the database."
	when "clear"
		gdbm.clear()
		db_hash = {}
		puts "The database and the hash is cleared."
	when "exit"
		is_running = false
	when "help"
		puts "-----------------------------------------------------------"
	  puts "Here is the list of commands."
		puts 'set: saves data to the memory. Example: set 1 "test data".'
		puts "commit: saves data to the database."
		puts "get: loads data from database. Example: get 1."
		puts "getall: prints all the elements in the database."
		puts "clear: Clears the database and the hash."
		puts "exit: exits the program. Example: exit."
		puts "help: prints the commands again."
		puts "-----------------------------------------------------------"
	else
	  puts "You have given a wrong command."
	end
end
puts "Exiting program, goodbye."
gdbm.close