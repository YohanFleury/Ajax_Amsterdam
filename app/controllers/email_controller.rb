class EmailController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def index
    @emails = Email.all
    @i = 0
  end
  def create
    
    @email = Email.create(object: Faker::Lorem.word, body: Faker::Lorem.paragraph(sentence_count: 9))
    respond_to do |format|
      format.html { redirect_to email_index_path }
      format.js { }
    end
  end

  def show
    @email = Email.find_by(:id => params[:id]) 
    respond_to do |format|
      format.html { redirect_to email_index_path }
      format.js { }
    end
  end
  def destroy
    puts "ok#####################"
    @email = Email.find_by(id:params[:id])
    Email.destroy
    respond_to do |format|
      format.html { redirect_to email_index_path }
      format.js { }
    end
  end

 
end
