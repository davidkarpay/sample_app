# Even though this method is defined in 
#     app/helpers/application_helper.rb, 
# in order to use methods in int. tests,
# (and if those methods are not defined
# in the test itself) the methods must be
# defined in this file.

#   def full_title(page_title)
#   	base_title = "Ruby on Rails Tutorial Sample App"
#   	if page_title.empty?
#  	 	base_title
#  	 else
#  	 	"#{base_title} | #{page_title}"
#  	 end
#   end

include ApplicationHelper