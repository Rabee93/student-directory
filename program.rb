filename = __FILE__
File.open(filename, "r") do |f|
    f.readlines.each do |r| 
        puts r
    end 
end 