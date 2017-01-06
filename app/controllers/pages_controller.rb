class PagesController < ApplicationController
  def home
    split_test
    render :layout => 'home_application'
  end

  def thank_you

  end

  def contacts_thank_you

  end

  private
  
    def split_test
      @apply_buttons_test = ab_test("Apply Buttons Test", ["Orange-Blue", "Aqua-Orange"])
    end
end
