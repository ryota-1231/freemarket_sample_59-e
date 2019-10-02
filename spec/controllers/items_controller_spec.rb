require 'rails_helper'


describe ItemsController, type: :controller do
  describe "GET #index" do
    describe 'GET #index' do
      it "indexアクションが動いた時にindex.html.hamlにページが移動したか" do
        get :index
        expect(response).to render_template :index
      end
    end
  end
end  

