require 'csv'
puts "welcome to Ruby"
puts "Here are two options provided"
print "Add the coloumns to csv press 1 "
print "view csv data press 2"
print "\n"
choice = STDIN.gets.to_i
while choice <= 9 
	if choice == 1
		col_val = Array.new
		begin
			puts "enter your email address: "
			$email = gets.chomp
			valid_email = /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
			if $email =~ valid_email
				puts "valid email"
				col_val.push($email)
			else
				puts "invalid email"
			end
		end until $email =~ valid_email 
		
		begin
			puts "enter http url: "
			$url = gets.chomp
			url_regex = Regexp.new("((https?|ftp|file):((//)|(\\\\))+[\w\d:\#@%/;$()~_?\+-=\\\\.&]*)")	
			if $url =~ url_regex then
				puts "valid"
				col_val.push($url)
		    else
		        puts "not a valid"	
			end
		end	until $url =~ url_regex
		
		begin
			puts "enter ip address"
			$ip_addr = gets.chomp
			ip_regex = /^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/
			if $ip_addr =~ ip_regex
				puts "valid address"
				col_val.push($ip_addr)
		    else
		        puts "not a valid address"	 	
			end
		end until $ip_addr =~ ip_regex
			 
		begin
			puts "enter your mobile number"
			$num = gets.chomp
			num_regex = /^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$/
			if $num =~ num_regex
				puts "valid number"
				col_val.push($num)
			else
				puts "invalid"
			end
		end until $num =~ num_regex
		
		CSV.open("csv_example.csv", "a+") do |flds|
			flds << col_val
		end
		puts "you wish continue press 1 or 2 or exit press 0"
		choice = STDIN.gets.to_i
	end
	if choice == 2
	
		csv_text = File.read('csv_example.csv')
		csv = CSV.parse(csv_text, :headers => true)
		col_email = Array.new
		col_url = Array.new
		col_ip_a = Array.new
		col_num = Array.new
		i = 0
		csv.each_with_index do |row,j|

				row.each_with_index do |col,i|
					if i == 0
						col_email.push(col[1])
					elsif i == 1
						col_url.push(col[1])
					elsif i == 2
						col_ip_a.push(col[1])
					elsif i == 3
						col_num.push(col[1])
					end
				end	
		end
			print "#{col_email}"+','+"#{col_url}"+','+"#{col_ip_a}"+','+"#{col_num}"
			print "\n"

			puts "you wish continue press 1 or 2 or exit press 0"
			choice = STDIN.gets.to_i	
	end

	if choice == 3..9
		puts "you wish continue press 1 or 2 or exit press 0"
		choice = STDIN.gets.to_i
	end
	if choice == 0
		puts "Thank you"
		exit
	end
end 