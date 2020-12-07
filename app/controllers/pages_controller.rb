class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

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

  def deduct_token(page)
    if current_user.token
      current_user.token = false
      current_user.ticket = Time.now.to_date
      current_user.choice = page
      current_user.save
    end
  end

  def denied
    redirect_to root_path, notice: "You have no Token left. Today you chose #{current_user.choice}."
  end  
end
