
describe Hyrax::My::WorksController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }

  context "with multiple pages of works" do
    before { 3.times { create(:work, user: user) } }
    it "paginates" do
      get :index, params: { per_page: 2 }
      expect(assigns[:document_list].length).to eq 2
      get :index, params: { per_page: 2, page: 2 }
      expect(assigns[:document_list].length).to be >= 1
    end
  end

  context 'with different types of records' do
    let(:someone_else) { create(:user) }

    let!(:my_collection)    { create(:public_collection, user: user) }
    let!(:other_collection) { create(:public_collection) }
    let!(:my_work)          { create(:work, user: user) }
    let!(:shared_work)      { create(:work, edit_users: [user.user_key], user: someone_else) }
    let!(:unrelated_work)   { create(:public_work, user: someone_else) }
    let!(:my_file)          { create(:file_set, user: user) }
    let!(:wrong_type)       { ActiveFedora::Base.create! }

    it 'shows only the correct records' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template :index
      expect(assigns[:document_list].map(&:id)).to contain_exactly(my_work.id)
      expect(assigns[:user_collections].map(&:id)).to contain_exactly(my_collection.id)
    end
  end

  context "when add_files_to_collection is provided" do
    it "sets add_files_to_collection ivar" do
      get :index, params: { add_files_to_collection: '12345' }
      expect(assigns(:add_files_to_collection)).to eql('12345')
    end
  end

  describe "#search_facet_path" do
    subject { controller.send(:search_facet_path, id: 'keyword_sim') }
    it { is_expected.to eq "/dashboard/works/facet/keyword_sim?locale=en" }
  end
end
