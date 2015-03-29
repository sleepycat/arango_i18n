require 'spec_helper'
require 'pry'

module ArangoI18n
  RSpec.describe Store do

    let :db do
      Ashikawa::Core::Database.new do |config|
        config.url = "http://localhost:8529"
        config.database_name = 'i18n_test'
        config.username = ""
        config.password = ""
      end
    end

    let :collection do
      db["i18n"]
    end

    let :store do
      Store.new collection
    end

    before :example do
      collection.truncate
    end


    it "holds a collection" do
      expect(store.collection).to eq collection
    end

    it "stores value for a given key" do
      store["foo"]="bar"
      expect(store["foo"]).to eq "bar"
    end

    it "can handle dots in the key" do
      store["en.foo"]="bar"
      expect(store["en.foo"]).to eq "bar"
    end

    it "returns all the keys" do
      store["en.foo"]="bar"
      expect(store.keys).to eq ["en.foo"]
    end

    it "deletes a key" do
      store["en.foo"]="bar"
      store.del("en.foo")
      expect(store["en.foo"]).to be_nil
    end

    it "returns the list of available locales" do
      store["en.foo"]="bar"
      store["fr.foo"]="le bar"
      expect(store.available_locales).to match_array ["en", "fr"]
    end

  end
end
