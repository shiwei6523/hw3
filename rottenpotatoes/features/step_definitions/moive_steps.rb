Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |movie|
      Movie.create!(movie)
  end
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  Movie.find_by_title(arg1).director == arg2
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  first_position = page.body.index(e1)
  second_position = page.body.index(e2)
  first_position.should < second_position
end

# Given /the following movies exist/ do |movies_table|
#   movies_table.hashes.each do |movie|
#     m = Movie.new(movie)
#     m.save()
#   end
# end

# # Then /^the director of "(.*)" should be "(.*)"$/ do |title_value, director_value|
# #   movie = Movie.find_by_title(title_value)
# #   expect(movie.director).to eq director_value
# # end

# Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
#   assert page.body.match(/#{e1}.*#{e2}/m), "#{e1} should come before #{e2}"
# end

# Then /the movies should be sorted by "(.*)"/ do |field|
#   prev=""
#   Movie.find(:all, :order => field).each do |movie|
#     curr = movie.send(field)
#     step "I should see \"#{prev}\" before \"#{curr}\"" if prev != ""
#     prev = curr 
#   end
# end

# When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
#   rating_list.split(/\s*,\s*/).each do |rating|
#     step "I #{uncheck}check \"ratings_#{rating}\""
#   end 
# end

# Then /^(?:|I )should see \/([^\/]*)\/ inside of (.*)$/ do |regexp,element|
#   regexp = Regexp.new(regexp)

#   if page.respond_to? :should
#     page.should have_xpath("//*/#{element}", :text => regexp)
#   else
#     assert page.has_xpath?("//*/#{element}", :text => regexp)
#   end
# end

# Then /^(?:|I )should not see \/([^\/]*)\/ inside of (.*)$/ do |regexp,element|
#   regexp = Regexp.new(regexp)

#   if page.respond_to? :should
#     page.should have_no_xpath("//*/#{element}", :text => regexp)
#   else
#     assert page.has_no_xpath?("//*/#{element}", :text => regexp)
#   end
# end

# Then /^(?:|I )should see all of the movies$/ do 
#   Movie.find(:all).each do |movie|
#     step "I should see \"#{movie.title}\""    
#   end 
# end

# Then /^(?:|I )should see none of the movies$/ do 
#   Movie.find(:all).each do |movie|
#     step "I should not see \"#{movie.title}\""    
#   end 
# end

# Then /^the director of "(.*)" should be "(.*)"$/ do |title, director|
#   movie = Movie.find_by_title(title)
#   assert movie.director == director, "#{title} director is #{movie.director} and it should be #{director}"
# end

# # Given /the following movies exist/ do |movies_table|
# #   movies_table.hashes.each do |movie|
# #     Movie.create movie
# #   end
# # end

# # Then /^the director of "(.*)" should be "(.*)"$/ do |title_value,director_value|
# #   movie = Movie.find_by_title(title_value)
# #   expect(movie.director).to eq director_value
# # end

# # # Make sure that one string (regexp) occurs before or after another one
# # #   on the same page

# # Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
# #   assert page.body =~ /#{e1}.*#{e2}/m, "#{e1} was not before #{e2}"
# # end

# # # Make it easier to express checking or unchecking several boxes at once
# # #  "When I uncheck the following ratings: PG, G, R"
# # #  "When I check the following ratings: G"

# # When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
# #   rating_list.split(',').each do |rating|
# #     if uncheck
# #       uncheck "ratings_#{rating}"
# #     else
# #       check "ratings_#{rating}"
# #     end
# #   end
# # end

# # Then /I should see all of the movies/ do
# #   movies = Movie.all
  
# #   if movies.size == 10
# #     movies.each do |movie|
# #       assert page.body =~ /#{movie.title}/m, "#{movie.title} did not appear"
# #     end
# #   else
# #     false
# #   end
# # end

# # Then /I should not see any movies/ do
# #   movies = Movie.all
# #   movies.each do |movie|
# #     assert true unless page.body =~ /#{movie.title}/m
# #   end
# # end

# # Then /^the director of "(.*?)" should be "(.*?)"$/ do |movie_title, new_director|
# #   movie = Movie.find_by_title movie_title
# #   movie.director.should == new_director
# # end
