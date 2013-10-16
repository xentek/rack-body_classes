# encoding: utf-8
require 'spec_helper'



describe Rack::BodyClasses do
  it "returns body classes" do
    get '/'
    last_response.body.must_match(/<body class="desktop other other0"><\/body>/)
  end
end
