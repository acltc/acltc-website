class FaqsController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :create, :update, :delete]

  def index
    record_return_to_website_event
    @faq_categories = ["General", "Tuition & Payment", "Application & Acceptance", "Actualize Program", "Etc."]
    @faqs = Faq.all.order(:priority)
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)
    if @faq.save
      flash[:success] = "FAQ has been added"
      redirect_to faqs_path
    else
      render :new
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])
    @faq.update(faq_params)
    if @faq.save
      flash[:success] = "FAQ has been updated"
      redirect_to faqs_path
    else
      render :update
    end
  end

  def destroy
    Faq.find(params[:id]).destroy
    flash[:warning] = "FAQ has been deleted"
    redirect_to faqs_path
  end

  private

  def faq_params
    params.require(:faq).permit(:question, :answer, :priority, :category)
  end

end
