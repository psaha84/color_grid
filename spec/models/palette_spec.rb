require "rails_helper"

describe Palette, type: :model do
  context 'associations' do
    it {is_expected.to belong_to :user }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:row) }
    it { is_expected.to validate_presence_of(:col) }
    it { is_expected.to validate_presence_of(:color) }
  end 

  context "scope" do
    describe ".latest" do
      let(:user)            { create(:user) }
      let!(:palette)        { create(:palette, user: user, color: '#ccc') }
      let!(:latest_palette) { create(:palette, user: user, color: '#1846db') }

      it "should return the latest palette" do
        expect(Palette.latest).to include(latest_palette)
      end

      it "should not return the old palette" do
        expect(Palette.latest).to_not include(palette)
      end          
    end
  end
end
