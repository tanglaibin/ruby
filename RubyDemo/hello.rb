#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-

print <<EOF
    这是第一种方式创建here document 。
    多行字符串。
EOF

print <<"EOF";                # 与上面相同
    这是第二种方式创建here document 。
    多行字符串。
EOF

print <<`EOC`                 # 执行命令
  echo hi there
  echo lo there
EOC

print <<"foo", <<"bar"        # 您可以把它们进行堆叠
  I said foo.
foo
  I said bar.
bar


puts "这是主 Ruby 程序"
 

=begin
这是注释。
这也是注释。
这也是注释。
这还是注释。
=end


BEGIN {
  puts "初始化 Ruby 程序"
}

  END {
    # ddssss
    puts "停止 Ruby 程序" #uuuu
  }



a1=0 
 
#带千分符的整型 
a2=1_000_000 
 
#其它进制的表示 
a3=0xa 
puts a1,a2 
puts a3 
 
#puts print 都是向控制台打印字符，其中puts带回车换行符 
=begin 
这是注释，称作：嵌入式文档注释 
类似C#中的/**/ 
=end

#浮点型 
f3=1000000.1 
puts f3


puts 2**(1/4)
puts 16**(1/4.0)


ary = [ "fred", 10, 3.14, "This is a string", "last element", ]
ary.each do |i|
    puts i
end




















