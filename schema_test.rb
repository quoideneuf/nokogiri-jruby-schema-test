require 'net/http'
require 'nokogiri'

xsd_path  = File.join(File.dirname(__FILE__), 'ead.xsd')
xsd = Nokogiri::XML::Schema(File.read(xsd_path))

doc_path  = File.join(File.dirname(__FILE__), 'afcu.xml')
order_doc = Nokogiri::XML(File.read(doc_path)) 

puts xsd.valid?(order_doc)

xsd.validate(order_doc).each do |error|
  puts error.message
end

# jruby 1.6.7.2 (ruby-1.9.2-p312) (2012-05-01 26e08ba) (Java HotSpot(TM) Client VM 1.6.0_35) [darwin-i386-java]
# jruby - nokogiri-1.5.5-java

# ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-darwin11.4.0]
# mri - nokogiri-1.5.5

