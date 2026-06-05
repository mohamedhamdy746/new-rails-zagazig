class BooksController < ApplicationController
  def index
    @books = [
      { title: "I love rails", author: "Mohamed Hamdy" },
    ]
  end
end
