module Rabl
  # Rabl.host
  class Configuration
    attr_accessor :include_json_root
    attr_accessor :include_xml_root
    attr_accessor :enable_json_callbacks
    attr_writer   :xml_options

    DEFAULT_XML_OPTIONS = { :dasherize  => true,
                            :skip_types => false }

    def initialize
      @include_json_root     = true
      @include_xml_root      = false
      @enable_json_callbacks = false
      @xml_options           = {}
    end

    # Allows config options to be read like a hash
    #
    # @param [Symbol] option Key for a given attribute
    def [](option)
      send(option)
    end

    # Returns merged default and inputted xml options
    def default_xml_options
      return @default_xml_options if @default_xml_options
      @default_xml_options = if @xml_options.is_a?(Hash)
        DEFAULT_XML_OPTIONS.merge(@xml_options.reject {|k,v| !DEFAULT_XML_OPTIONS.keys.include?(k)})
      else
        DEFAULT_XML_OPTIONS
      end
    end
  end
end
