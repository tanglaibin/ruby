class Demo2
end

puts 'escape using "\\"';
puts 'That\'s right';
puts "escape using '\\'";

puts "相乘 : #{24*60*60}";

name="Ruby" 
puts name 
puts "#{name+",ok"}"
puts name+",ok";


nums = Array.new(10) { |e| e = e * 2 }
puts "#{nums}"


hsh = colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
hsh.each do |key, value|
    print key, " is ", value, "\n"
end


(10..15).each do |n|
    print n, ' '
end



class Sample
   def hello
      puts "Hello Ruby!"
   end
end
 
# 使用上面的类来创建对象
object = Sample. new
object.hello












