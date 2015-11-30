require 'rails_helper'
include RandomData
RSpec.describe AdvertisementsController, type: :controller do
  let (:new_ad) do
      Advertisement.create(
        id: 1,
        title: RandomData.random_sentence,
        copy: RandomData.random_paragraph,
        price: 50
      )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [new_ad] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([new_ad])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: new_ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: new_ad.id}
      expect(response).to render_template :show
    end

    it "assigns new_ad to @advertisement" do
      get :show, {id: new_ad.id}
      expect(assigns(:advertisement)).to eq(new_ad)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    it "instantiates the #new view" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of advertisements by 1" do
      expect{post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 50}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new advertisement to @advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 50}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 50}
      expect(response).to redirect_to Advertisement.last
    end
  end
end
