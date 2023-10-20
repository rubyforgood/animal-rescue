require "rails_helper"

RSpec.describe ChecklistTemplateItemsController, type: :controller do
  let(:checklist_template) { create(:checklist_template) }
  let!(:checklist_template_item) { create(:checklist_template_item) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new checklist_template_item" do
      expect {
        post :create, params: { checklist_template_item: attributes_for(:checklist_template_item, checklist_template_id: checklist_template.id) }
      }.to change(ChecklistTemplateItem, :count).by(1)
    end

    it "redirects to the new checklist_template_item" do
      post :create, params: { checklist_template_item: attributes_for(:checklist_template_item, checklist_template_id: checklist_template.id) }
      expect(response).to redirect_to(ChecklistTemplateItem.last)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: checklist_template_item.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: checklist_template_item.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "updates the checklist_template_item" do
      patch :update, params: { id: checklist_template_item.id, checklist_template_item: { name: "New Name" } }
      checklist_template_item.reload
      expect(checklist_template_item.name).to eq("New Name")
    end

    it "redirects to the updated checklist_template_item" do
      patch :update, params: { id: checklist_template_item.id, checklist_template_item: { name: "New Name" } }
      expect(response).to redirect_to(checklist_template_item)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the checklist_template_item" do
      expect {
        delete :destroy, params: { id: checklist_template_item.id }
      }.to change(ChecklistTemplateItem, :count).by(-1)
    end

    it "redirects to the checklist_template_items index" do
      delete :destroy, params: { id: checklist_template_item.id }
      expect(response).to redirect_to(checklist_template_items_url)
    end
  end
end
