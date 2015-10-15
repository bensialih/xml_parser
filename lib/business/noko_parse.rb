

run_ok = system('explorer .')

puts "well script should be working" + RUBY_PLATFORM + " ran ok:#{run_ok}"


=begin
tmp_ele.map {|node|
        if(children = node.children>0)
            children.map{|children1|
            if(children1.name=="string")
            string_var_array<< [children1['name']=> children1.text]
            else if(children1.name=="string-array")
            puts "hello"
            puts
            if(nodeChildren = children1.children>0)
                nodeChildren.each {|node| string_array_array << [node.name=> node.text]}
            end
            else
                puts "goodbye: " + children1.name
                #plurals values here
            end
            end
            }
        end
    }
=end
