shared_context "shared_authenticated_job_recruiter_user" do
  let(:user) { FactoryBot.create(:user, role: "job_recruiter") }
  
  before do
    sign_in user
  end
end