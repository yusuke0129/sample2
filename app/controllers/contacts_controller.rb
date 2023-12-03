# frozen_string_literal: true

# ContactsController
class ContactsController < ApplicationController
  def index
    @contacts = if params[:date].present?
                  Contact.where(created_at: params[:date].to_date.in_time_zone.all_day).all
                else
                  Contact.all
                end

    render json: success(data: @contacts)
  end

  def create
    @contact = Contact.new(name: params[:name], email: params[:email], context: params[:context])
    SampleJob.perform_later(params[:name], params[:email], params[:context]) if @contact.save
    
    @error_message = @contact.error_message
    if @error_message.empty?
      render json: success
    else
      render json: fail(errors: @error_message)
    end
  end
end
