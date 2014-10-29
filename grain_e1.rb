require 'nokogiri'

f = File.open("grain-elevators.csv", "a") 

Dir['data/N02982*/*.xml'].sort.each do |item| 
	puts "working on: #{item}"
	
	doc   = Nokogiri::XML(File.read(item))
	xslt  = Nokogiri::XSLT(File.read('grainelevators0.xsl'))
	
	$place = xslt.apply_to(doc)
	
	if $place != ''	
	$location = $place.split(',')
	$province = $location[0].split(' ').map {|w| w.capitalize }.join(' ')
	$railway = $location[1].split(' ').map {|w| w.capitalize }.join(' ')
	end	

	xslt  = Nokogiri::XSLT(File.read('grainelevators1.xsl'))

	doc = xslt.transform(doc, )

	xslt  = Nokogiri::XSLT(File.read('grainelevators2.xsl'))
	
	doc = xslt.transform(doc)

	i = 0
	while i < 10 
	xslt  = Nokogiri::XSLT(File.read('grainelevators3.xsl'))
	doc = xslt.transform(doc)
	i += 1
	end

	xslt  = Nokogiri::XSLT(File.read('grainelevators4.xsl'))
	doc = xslt.apply_to(doc, Nokogiri::XSLT.quote_params('item'=> item, 'province'=> $province, 'railway'=> $railway))		
	
	f.puts doc
 

end
