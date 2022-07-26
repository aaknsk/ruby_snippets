require 'csv'

users = <<~EOS
  id,first name,last name,age
  1,taro,tanaka,20
  2,jiro,suzuki,18
  3,ami,sato,19
  4,yumi,adachi,21
EOS

File.write('test.csv', users)

File.open('test.csv', 'r') do |f|
  csv = CSV.new(f, headers: true)
  csv.class # => CSV
  csv.first # => #<CSV::Row "id":"1" "first name":"taro" "last name":"tanaka" "age":"20">
end
