require "rails_helper"

describe HomeController do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET leaderboard" do
    let!(:user) do
      user = create(:user) 
      create(:palette, user: user, color: '#1846db')
      user
    end
 
    it "should assigns @users" do
      get :leaderboard
      expect(assigns(:users)).to eq([user])
    end

    it "renders the leaderboard template" do
      get :leaderboard
      expect(response).to render_template("leaderboard")
    end
  end

  describe "POST create" do
    let(:palette_params) { { row: 0, col: 0, color: '#ccc' } }
    
    it "should increment palette count by one" do
      expect{ post :create_palette, xhr: true, params: { palette: palette_params } }.to change{Palette.count}.by(1)
    end
  end
end
