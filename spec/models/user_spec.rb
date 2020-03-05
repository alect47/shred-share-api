require 'rails_helper'

describe User, type: :model do
  describe "relationships" do
    it {should have_many :user_events}
    it {should have_many :events}
  end

end
