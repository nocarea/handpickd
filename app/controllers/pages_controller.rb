class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    add_token if current_user
  end

  #use up token and redirect to chosen content
  def science
    deduct_token("science")
    if current_user.choice == "science" && current_user.ticket.today?
      @science = "https://www.youtube.com/watch?v=8Kh9HoCsmrw"
    else
      denied
    end
  end

  def fun
    deduct_token("fun")
    if current_user.choice == "fun" && current_user.ticket.today?
      @fun = "https://www.youtube.com/watch?v=8Kh9HoCsmrw"
    else
      denied
    end
  end

  def art
    deduct_token("art")
    if current_user.choice == "art" && current_user.ticket.today?
      @art = "https://www.youtube.com/watch?v=8Kh9HoCsmrw"
    else
      denied
    end
  end

  def porn
    deduct_token("porn")
    if current_user.choice == "porn" && current_user.ticket.today?
      @porn = "https://www.youtube.com/watch?v=8Kh9HoCsmrw"
    else
      denied
    end
  end

  private
  
  #if ticket is 1 day or more ago, add token and reset choice
  def add_token
    if (Time.now.to_date - current_user.ticket).to_i > 0
      current_user.token = true
      current_user.choice = nil
      current_user.save
    end
  end

  #if user has a token, remove it and add a ticket for today's choice
  def deduct_token(page)
    if current_user.token
      current_user.token = false
      current_user.ticket = Time.now.to_date
      current_user.choice = page
      current_user.save
    end
  end
  #if user has no token, redirect to home and display notice
  def denied
    if current_user.choice == nil
      redirect_to root_path, notice: "Make your choice"
    else
      redirect_to root_path, notice: "You chose #{current_user.choice} today. One a day you greedy cunt. "
    end
  end  
end
