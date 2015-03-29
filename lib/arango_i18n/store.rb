require 'ashikawa-core'
module ArangoI18n

  class Store

    attr_accessor :collection

    def initialize collection
      @collection = collection
    end

    def []= key, value
      @collection.create_document(key: key, value: value)
      value
    end

    def [] key
      @collection.query.execute("FOR i IN @@collection FILTER i.key == @key RETURN i.value", bind_vars: {"@collection": @collection.name, key: key}).to_a.first
    end

    def keys
      @collection.query.execute("FOR i IN @@collection COLLECT keys = i.key RETURN keys", bind_vars: {"@collection": @collection.name}).to_a
    end

    def del key
      @collection.query.execute("FOR i IN @@collection FILTER i.key == @key REMOVE i IN @@collection", bind_vars: {"@collection": @collection.name, key: key}).to_a
    end

    def available_locales
      @collection.query.execute("LET all_locales = (FOR i IN @@collection RETURN SPLIT(i.key, '.')[0]) RETURN UNIQUE(all_locales)", bind_vars: {"@collection": @collection.name}).to_a.first
    end

  end

end
