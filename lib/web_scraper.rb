require 'nokogiri'
require 'mechanize'
require 'csv'
require 'open-uri'
require 'pp'


# Mechanize exercise
#==============================================
# agent = Mechanize.new

# page = agent.get("http://google.com")

# # puts agent.class
# # puts page.class

# # # pp page

# page_2 = agent.page.link_with(:text => "Gmail").click
# # pp page_2


# # Nokogiri exercise
# #==============================================
# doc = Nokogiri::HTML(open("http://www.rottentomatoes.com/m/lincoln_2011/"))

# puts doc.class
# puts doc
# Pulling h1 elements
# h1 = doc.css("h1")
# puts h1.first
# puts h1.first.text
# puts h1.first.attr("class")

# # Going inside span
# span = doc.css("h1 span")
# puts span.attr("itemprop")

# Pulling p elements
# p = doc.css("p")

# puts p.class  # => Nokogiri::XML::NodeSet

# p_text = []
# p.each do |p_in|
  
#   p_text << p.text.gsub(/[\n\t]/,"").strip
#   p_text << "\n"

# end
# puts p_text

# Challenge: getting all the reviews
# content_body_div = doc.css("div.content_body")
# reviews = doc.css("div#reviews p")
# or
# review_div = doc.css("div#reviews") 
# reviews = review_div.css("p")

# puts reviews


#==================================================
# Challenge: getting all the critics
 # critics = []
 # doc.css("div.review_source.media_block div.bold a").each do | critic_note_set |
 # 	if critic_note_set.attr("href")[0..6] == "/critic"
 #      critics << critic_note_set.text
 #    end
 # end

 # puts critics

#==================================================
# Challenge: getting the critic name along with their rotten/fresh decision

 # critics_reviews = []
 
 # i = 0

 # # First find the highest level that is common to both critic name and rotten/fresh decision
 # # In this case, "div#reviews div.quote_bubble"
 # doc.css("div#reviews div.quote_bubble").each do | critic_bubble |
 
 #    tmp_hash = {}

 # 	critic_name_link = critic_bubble.css("div.review_source.media_block div.media_block_content div.bold a")
    
 #    # puts critic_name_link
 #    critic_name_link_string = critic_name_link.attr("href").to_s

 # 	if critic_name_link_string[0..6] == "/critic"

 #      tmp_hash[:critic_name] = critic_name_link.text
 #      tmp_hash[:tomato] = critic_bubble.css("div.quote_contents.media_block div").attr("class").to_s.split(" ").last
 #      # Note 
 #      # critic_bubble.css("div.quote_contents.media_block div").attr("class")
 #      # returns an object with class Nokogiri::XML::Attr - NOT a string

 #      critics_reviews[i] = test_hash

 #      i += 1

 #    end

 # end

 # puts critics_reviews


agent = Mechanize.new
movies_index = agent.get("http://www.rottentomatoes.com/movies/in-theaters/")

#================================================
# .search in Mechanize returns a Nokogiri object
# For examples
# h1_link = movies_index.search("h1")
# puts h1_link.inspect => NodeSet

# Going thru the first page of movies
movie_links = movies_index.search("div.heading.clearfix a")

movie_links.each do |movie_link|

  movie_link = movie_link.attr("href").to_s
  movie_page = movies_index.link_with(:href => movie_link).click

  movie_name = movie_page.search("h1.movie_title span").text
 
  puts "Movie: #{movie_name}"
  puts "==================================="

  critics = []
   
  movie_page.search("div.review_source.media_block div.bold a").each do | critic_notes |
    if critic_notes.attr("href")[0..6] == "/critic"
      critics << critic_notes.text
    end
  end

  puts critics

end	

# first_link = movie_links.first.attr("href").to_s
# first_movie_page = movies_index.link_with(:href => first_link).click