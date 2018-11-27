require "rails_helper"

describe User, type: :model do
  context 'associations' do
    it {is_expected.to have_many :palettes }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:ip_address) }
  end  

  describe ".get_record_along_with_fav_color" do
    let!(:user) do
      user = create(:user, ip_address: "192.168.1.1") 
      create(:palette, user: user, color: '#ccc')
      create(:palette, user: user, row: 1, col: 1, color: '#ccc')
      user
    end

    let!(:user1) do
      user = create(:user, ip_address: "192.168.1.2") 
      create(:palette, user: user, color: '#1846db')
      user
    end
 
    let!(:user_without_palette) { create(:user) }
    
    it "should return all user with their fav color" do
      expect(User.get_record_along_with_fav_color).to include(user)
    end

    it "should return all user with their fav color in descending order of palettes count" do
      expect(User.get_record_along_with_fav_color).to eq([user, user1])
    end

    it "should not return the users who do not have any palette" do
      expect(User.get_record_along_with_fav_color).to_not include(user_without_palette)
    end  
  end
end
