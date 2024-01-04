shared_context "shared_authenticated_job_seeker_user" do
  let(:user) { FactoryBot.create(:user, role: "job_seeker") }
  before do
    sign_in user
  end
end