class PagesController < ApplicationController
  def home
    split_test
    render :layout => 'home_application'
    p"-----------Phone Test Pages-----------------------"
    p @phone_test
    p"----------------------------------"
  end

  def thank_you

  end

  def contacts_thank_you

  end

  private

  def split_test
    @phone_test = ab_test("phone_no_phone", ["phone", "no_phone"])
  end
end
