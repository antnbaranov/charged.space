require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  it "can create shortlink " do
    request.env["HTTP_ACCEPT"] = "text/javascript"

    url = "https://online.sochisirius.ru"
    post :create, params: { link: { og_url: url } }
    link = assigns(:link)
    expect(link.og_url).to eq(url)
    expect(link.valid?).to be(true)
    expect(link.lookup_code.size).to eq(2)
    expect(link.persisted?).to be(true)
    expect(response).to render_template('create')
  end

end
