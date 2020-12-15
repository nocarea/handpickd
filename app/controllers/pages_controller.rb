class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    add_token if current_user
  end

  #use up token and redirect to chosen content
  def science
    deduct_token("science")
    if current_user.category == "science" && current_user.ticket.today?
      set_content("science")
      set_comments(@content.id)
    else
      denied
    end
  end

  def fun
    deduct_token("fun")
    if current_user.category == "fun" && current_user.ticket.today?
      set_content("fun")
      set_comments(@content.id)
    else
      denied
    end
  end

  def art
    deduct_token("art")
    if current_user.category == "art" && current_user.ticket.today?
      set_content("art")
      set_comments(@content.id)
    else
      denied
    end
  end

  def porn
    deduct_token("porn")
    if current_user.category == "porn" && current_user.ticket.today?
      set_content("porn")
      set_comments(@content.id)
    else
      denied
    end
  end

  def spirit
    deduct_token("spirit")
    if current_user.category == "spirit" && current_user.ticket.today?
      set_content("spirit")
      set_comments(@content.id)
    else
      denied
    end
  end

  def wtf
    deduct_token("wtf")
    if current_user.category == "wtf" && current_user.ticket.today?
      set_content("wtf")
      set_comments(@content.id)
    else
      denied
    end
  end

  private
  
  #if ticket is 1 day or more ago, add token and reset category
  def add_token
    if (Time.now.to_date - current_user.ticket).to_i > 0
      current_user.token = true
      current_user.category = nil
      current_user.save
    end
  end

  #if user has a token, remove it and add a ticket for today's category
  def deduct_token(page)
    if current_user.token
      current_user.token = false
      current_user.ticket = Time.now.to_date
      current_user.category = page
      current_user.save
    end
  end
  #if user has no token, redirect to home and display notice
  def denied
    if current_user.category == nil
      redirect_to root_path, notice: "Make your choice"
    elsif current_user.category && !current_user.ticket.today?
      redirect_to root_path, notice: "Make your choice"
    else
      redirect_to root_path, notice: "You chose #{current_user.choice} today. One a day you greedy cunt. "
    end
  end

  def set_content(category)
    #do the following only once a day
    #select the content container of that category
    category_content = Content.where(category: category)
    #returns hash/array? of Content instances
    #remove content the user has already seen from the array
    category_content.each do |content|
      content.user_id 

reject(:user_id == current_user.id)
    seen.each do |id|
      category_content = category_content.reject!(|content| content.id == id)
    end
    #select a new random content from the container
    @content = seen.sample
    #add user id to content
  end

  def set_comments(id)
    @comments = Comment.where(content_id: id)
  end
end
