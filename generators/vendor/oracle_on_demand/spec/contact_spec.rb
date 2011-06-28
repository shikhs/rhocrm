require File.join(File.dirname(__FILE__),'..','spec_helper')

describe "Contact" do
  it_should_behave_like "SpecHelper" do
  
    before(:each) do
      settings_file = File.join('settings', 'settings.yml')
      settings = YAML.load_file(settings_file) if settings_file and File.exist?(settings_file)
      sample_data_file = File.join('spec','sample_data.yml')
      @sample_data = YAML.load_file(sample_data_file)['Contact'] if sample_data_file and File.exist?(sample_data_file)
      setup_test_for Contact,settings[:test][:username]
      Application.authenticate(settings[:test][:username],settings[:test][:password],"")
    end

    before(:each) do
      @ss.adapter.login
    end
  
    after(:each) do
      @ss.adapter.logoff
    end

    it "should process Contact query" do
      result = test_query
      puts result.length.inspect
      query_errors.should == {}
    end
  
    it "should process Contact create" do
      create_hash = @sample_data
      result = test_create(create_hash)
      puts result.inspect
      create_hash['Id'] = result
      @@created_records = { result => create_hash }
      create_errors.should == {}
    end
  
    it "should process Contact update" do
      @@created_records.each do |key,value|
        value["ContactFirstName"] = "Changed Name #{key.to_s}"
      end
      result = test_update(@@created_records)
      puts result.inspect
      update_errors.should == {}
    end
  
    it "should process Contact delete" do
      result = test_delete(@@created_records)
      puts result.inspect
      delete_errors.should == {}
    end
  end
end
