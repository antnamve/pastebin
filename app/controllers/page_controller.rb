class PageController < ApplicationController
	def about
		@paste = Paste.new
	end

	def show
		@paste = Paste.first
	end
end
