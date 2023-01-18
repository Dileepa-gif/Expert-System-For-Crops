(reset)
(defrule read-zone
	(initial-fact)
	=>
	(printout t crlf crlf "		Welcome! Crop Recommending Expert System." crlf)
	(printout t "	******************************************************" crlf)
	(printout t "	This system recommends the most suitable crop for your cultivation." crlf)
	(printout t "	This system provides some advice for recommended cultivation." crlf)
	(printout t "	*******************************************************" crlf crlf)
	(printout t "Below are 5 climatic zones in Sri Lanka." crlf)
	(printout t "	1 - Up country wet zone" crlf)
	(printout t "	2 - Up country dry zone" crlf)
	(printout t "	3 - Low country wet zone" crlf)
	(printout t "	4 - Low country dry zone" crlf)
	(printout t "	5 - Semi-dry zone" crlf)
	(printout t "Please enter your zone number from the above-mentioned zones" crlf)
	(assert (zone_number (read))))



(defrule nature-of-the-land
	(zone_number ?)
	=>
	(printout t "What is the nature of the land ? (plain/slope) *case-sensitive* : ")
	(assert (land_nature (read))))

(defrule soil-type-of-the-land
	(land_nature ?)
	=>
	(printout t "What is the type of the soil ? (sand/loam/clay) *case-sensitive* : ")
	(assert (soil_type (read))))


(defrule soil-water
	(soil_type clay)
	=>
	(printout t "Is there too much soil water ? (yes/no) *case-sensitive* : ")
	(assert (soil_water (read))))


(defrule water-supply
	(soil_type ?)
	=>
	(printout t "Is there already a water flow for cultivation ? (yes/no) *case-sensitive* : ")
	(assert (water_supply (read))))

(defrule size-of-land
	(water_supply ?)
	=>
	(printout t "What is the size of land in perches ? *enter the numbers* *minimum number is 1.* :")
	(assert (land_size (read))))


(defrule extent-of-land
	(land_size ?s)
	=>
	(if(> ?s 20)
	then
	(assert (land_extent bigger))
	else	
	(assert (land_extent smaller))))


(defrule sort-by-time
	(land_extent ?)
	(not(or(soil_water yes)(and(soil_water no)(water_supply yes))))
	=>
	(printout t "Please enter a number from the below-mentioned." crlf)
	(printout t "	1 - Short-term crops" crlf)
	(printout t "	2 - Long-term crops" crlf)
	(assert (sort_by_time (read))))


(defrule short-term-crops
	(sort_by_time 1)
	(or (not(soil_water ?)) (soil_water no))
	=>
	(printout t "Please enter a number from the below-mentioned." crlf)
	(printout t "	1 - Vegetables" crlf)
	(printout t "	2 - Fruits" crlf)
	(printout t "	3 - Spices" crlf)
	(printout t "	4 - Other" crlf)
	(assert (short_term_crops_type (read))))





///////////////////////////
(defrule result-for-TEA
	(or(zone_number 1) (zone_number 2) (zone_number 3))
	(land_nature slope)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent bigger)
	(sort_by_time 2)
	=>
	(printout t crlf "The system recommends TEA cultivation." crlf )
	(printout t "	* The expected number of tea plants per perch is 16." crlf )
	(printout t "	* The expected total number of tea plants is approximately " (* ?ls 16) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the tea cultivation is approximately Rs." (* ?ls 16 50) "." crlf )
	(printout t "	* The expected annual income from the tea cultivation is approximately Rs." (* ?ls 15000) "." crlf )
	(assert (fertilizer_statement yes)))

(defrule result-for-NUTMEG
	(zone_number 1)
	(land_nature plain)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent bigger)
	(sort_by_time 2)
	=>
	(printout t crlf "The system recommends NUTMEG cultivation." crlf )
	(printout t "	* The expected number of nutmeg plants per perch is 1." crlf )
	(printout t "	* The expected total number of nutmeg plants is approximately " (* ?ls 1) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the nutmeg cultivation is approximately Rs." (* ?ls 1 150) "." crlf )
	(printout t "	* The expected annual income from the nutmeg cultivation is approximately Rs." (* ?ls 12000) "." crlf )
	(assert (fertilizer_statement yes)))

(defrule result-for-RUBBER
	(zone_number 2)
	(land_nature plain)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent bigger)
	(sort_by_time 2)
	=>
	(printout t crlf "The system recommends RUBBER cultivation." crlf )
	(printout t "	* The expected number of rubber plants per perch is 1." crlf )
	(printout t "	* The expected total number of rubber plants is approximately " (* ?ls 1) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the rubber cultivation is approximately Rs." (* ?ls 1 170) "." crlf )
	(printout t "	* The expected annual income from the rubber cultivation is approximately Rs." (* ?ls 13000) "." crlf )
	(assert (fertilizer_statement yes)))

(defrule result-for-COCONUT
	(zone_number 3)
	(land_nature plain)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent bigger)
	(sort_by_time 2)
	=>
	(printout t crlf "The system recommends COCONUT cultivation." crlf )
	(printout t "	* The expected number of coconut plants per perch is 1." crlf )
	(printout t "	* The expected total number of coconut plants is approximately " (* ?ls 1) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the coconut cultivation is approximately Rs." (* ?ls 1 350) "." crlf )
	(printout t "	* The expected annual income from the coconut cultivation is approximately Rs." (* ?ls 15000) "." crlf )
	(assert (fertilizer_statement yes)))


(defrule result-for-ARECANUT
	(or(zone_number 1) (zone_number 2) (zone_number 3))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent smaller)
	(sort_by_time 2)
	=>
	(printout t crlf "The system recommends ARECANUT cultivation." crlf )
	(printout t "	* The expected number of arecanut plants per perch is 2." crlf )
	(printout t "	* The expected total number of arecanut plants is approximately " (* ?ls 2) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the arecanut cultivation is approximately Rs." (* ?ls 2 70) "." crlf )
	(printout t "	* The expected annual income from the arecanut cultivation is approximately Rs." (* ?ls 7000) "." crlf )
	(assert (fertilizer_statement yes)))



(defrule result-for-LEEKS
	(zone_number 1)
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent ?)
	(sort_by_time 1)
	(short_term_crops_type 1)
	=>
	(printout t crlf "The system recommends LEEKS cultivation." crlf )
	(printout t "	* The expected number of leeks plants per perch is 350." crlf )
	(printout t "	* The mass of leeks seeds expected for cultivation is approximately " (* ?ls 150) " g." crlf )
	(printout t "	* The expected cost for the planting material of the leeks cultivation is approximately Rs." (* ?ls 450)"." crlf )
	(printout t "	* Leeks can be grown in the field 2 times a year." crlf )
	(printout t "	* The expected annual income from the leeks cultivation is approximately Rs." (* ?ls 2 3000)"." crlf )
	(assert (fertilizer_statement yes)))



(defrule result-for-BEANS
	(or(zone_number 2) (zone_number 3))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent ?)
	(sort_by_time 1)
	(short_term_crops_type 1)
	=>
	(printout t crlf "The system recommends BEANS cultivation." crlf )
	(printout t "	* The expected number of beans plants per perch is 50." crlf )
	(printout t "	* The mass of beans seeds expected for cultivation is approximately " (* ?ls 250) " g." crlf )
	(printout t "	* The expected cost for the planting material of the beans cultivation is approximately Rs." (* ?ls 300)"." crlf )
	(printout t "	* Beans can be grown in the field 2 times a year." crlf )
	(printout t "	* The expected annual income from the beans cultivation is approximately Rs." (* ?ls 2 3500)"." crlf )
	(assert (fertilizer_statement yes)))



(defrule result-for-STRAWBERRY
	(zone_number 1)
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent ?)
	(sort_by_time 1)
	(short_term_crops_type 2)
	=>
	(printout t crlf "The system recommends STRAWBERRY cultivation." crlf )
	(printout t "	* The expected number of strawberry plants per perch is 250." crlf )
	(printout t "	* The expected total number of strawberry plants is approximately " (* ?ls 250) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the strawberry cultivation is approximately Rs." (* ?ls 250 5)"." crlf )
	(printout t "	* The expected annual income from the strawberry cultivation is approximately Rs." (* ?ls 45000)"." crlf )
	(assert (fertilizer_statement yes)))



(defrule result-for-PASSION-FRUIT
	(or(zone_number 2) (zone_number 3))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent ?)
	(sort_by_time 1)
	(short_term_crops_type 2)
	=>
	(printout t crlf "The system recommends PASSION FRUIT cultivation." crlf )
	(printout t "	* The expected number of passion fruit plants per perch is 4." crlf )
	(printout t "	* The expected total number of passion fruit is approximately " (* ?ls 4) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the passion fruit cultivation is approximately Rs." (* ?ls 4 40)"." crlf )
	(printout t "	* The expected annual income from the passion fruit cultivation is approximately Rs." (* ?ls 5000)"." crlf )
	(assert (fertilizer_statement yes)))


(defrule result-for-GINGER 
	(or (zone_number 1)(zone_number 2) (zone_number 3))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent ?)
	(sort_by_time 1)
	(short_term_crops_type 3)
	=>
	(printout t crlf "The system recommends GINGER cultivation." crlf )
	(printout t "	* The expected number of ginger plants per perch is 90." crlf )
	(printout t "	* The expected total number of ginger is approximately " (* ?ls 90) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the ginger cultivation is approximately Rs." (* ?ls 90 40)"." crlf )
	(printout t "	* The expected annual income from the ginger cultivation is approximately Rs." (* ?ls 17000)"." crlf )
	(assert (fertilizer_statement yes)))



(defrule result-for-ORCHID
	(or (zone_number 1)(zone_number 2) (zone_number 3))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent smaller)
	(sort_by_time 1)
	(short_term_crops_type 4)
	=>
	(printout t crlf "The system recommends ORCHID cultivation." crlf )
	(printout t "	* The expected number of orchid plants per perch is 200." crlf )
	(printout t "	* The expected total number of orchid is approximately " (* ?ls 200) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the orchid cultivation is approximately Rs." (* ?ls 200 50)"." crlf )
	(printout t "	* The expected annual income from the orchid cultivation is approximately Rs." (* ?ls 75000)"." crlf )
	(assert (water_supply_statement yes)))

(defrule result-for-PEANUTS
	(or (zone_number 1)(zone_number 2) (zone_number 3))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent bigger)
	(sort_by_time 1)
	(short_term_crops_type 4)
	=>
	(printout t crlf "The system recommends PEANUTS cultivation." crlf )
	(printout t "	* The expected number of peanut plants per perch is 700." crlf )
	(printout t "	* The mass of peanuts seeds expected for cultivation is approximately " (* ?ls 600) " g." crlf )
	(printout t "	* The expected cost for the planting material of the peanuts cultivation is approximately Rs." (* ?ls 600)"." crlf )
	(printout t "	* The expected annual income from the peanuts cultivation is approximately Rs." (* ?ls 12000)"." crlf )
	(assert (fertilizer_statement yes)))



(defrule result-for-BANANA
	(or (zone_number 4)(zone_number 5))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent bigger)
	(sort_by_time 2)
	=>
	(printout t crlf "The system recommends BANANA cultivation." crlf )
	(printout t "	* The expected number of banana plants per perch is 2." crlf )
	(printout t "	* The expected total number of banana plants is approximately " (* ?ls 2) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the banana cultivation is approximately Rs." (* ?ls 2 100) "." crlf )
	(printout t "	* The expected annual income from the banana cultivation is approximately Rs." (* ?ls 5000) "." crlf )
	(assert (fertilizer_statement yes)))


(defrule result-for-DRAGON-FRUIT
	(or (zone_number 4)(zone_number 5))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent smaller)
	(sort_by_time 2)
	=>
	(printout t crlf "The system recommends DRAGON FRUIT cultivation." crlf )
	(printout t "	* The expected number of dragon fruit plants per perch is 3." crlf )
	(printout t "	* The expected total number of dragon fruit plants is approximately " (* ?ls 3) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the dragon fruit cultivation is approximately Rs." (* ?ls 3 300) "." crlf )
	(printout t "	* The expected annual income from the dragon fruit cultivation is approximately Rs." (* ?ls 16000) "." crlf )
	(assert (fertilizer_statement yes)))


(defrule result-for-PUMPKIN
	(or (zone_number 4)(zone_number 5))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent ?)
	(sort_by_time 1)
	(short_term_crops_type 1)
	=>
	(printout t crlf "The system recommends pumpkin cultivation." crlf )
	(printout t "	* The expected number of pumpkin plants per perch is 6." crlf )
	(printout t "	* The mass of peanuts seeds expected for cultivation is approximately " (* ?ls 20) " g." crlf )
	(printout t "	* The expected cost for the planting material of the pumpkin cultivation is approximately Rs." (* ?ls 40)"." crlf )
	(printout t "	* Pumpkin can be grown in the field 2 times a year." crlf )
	(printout t "	* The expected annual income from the pumpkin cultivation is approximately Rs." (* ?ls 2 800)"." crlf )
	(assert (fertilizer_statement yes)))




(defrule result-for-WATERMELON
	(or (zone_number 4)(zone_number 5))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent ?)
	(sort_by_time 1)
	(short_term_crops_type 2)
	=>
	(printout t crlf "The system recommends watermelon cultivation." crlf )
	(printout t "	* The expected number of watermelon plants per perch is 6." crlf )
	(printout t "	* The mass of peanuts seeds expected for cultivation is approximately " (* ?ls 18) " g." crlf )
	(printout t "	* The expected cost for the planting material of the watermelon cultivation is approximately Rs." (* ?ls 40)"." crlf )
	(printout t "	* Watermelon can be grown in the field 2 times a year." crlf )
	(printout t "	* The expected annual income from the watermelon cultivation is approximately Rs." (* ?ls 2 1300)"." crlf )
	(assert (fertilizer_statement yes)))


(defrule result-for-MUSTARD
	(or (zone_number 4)(zone_number 5))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent ?)
	(sort_by_time 1)
	(short_term_crops_type 3)
	=>
	(printout t crlf "The system recommends MUSTARD cultivation." crlf )
	(printout t "	* The expected number of mustard plants per perch is 900." crlf )
	(printout t "	* The mass of mustard seeds expected for cultivation is approximately " (* ?ls 300) " g." crlf )
	(printout t "	* The expected cost for the planting material of the mustard cultivation is approximately Rs." (* ?ls 1300)"." crlf )
	(printout t "	* Mustard can be grown in the field 2 times a year." crlf )
	(printout t "	* The expected annual income from the mustard cultivation is approximately Rs." (* ?ls 2 7000)"." crlf )
	(assert (fertilizer_statement yes)))



(defrule result-for-ANTHURIUM
	(or (zone_number 4)(zone_number 5))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent smaller)
	(sort_by_time 1)
	(short_term_crops_type 4)
	=>
	(printout t crlf "The system recommends ANTHURIUM cultivation." crlf )
	(printout t "	* The expected number of anthurium plants per perch is 200." crlf )
	(printout t "	* The expected total number of anthurium is approximately " (* ?ls 200) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the anthurium cultivation is approximately Rs." (* ?ls 200 50)"." crlf )
	(printout t "	* The expected annual income from the anthurium cultivation is approximately Rs." (* ?ls 65000)"." crlf )
	(assert (water_supply_statement yes)))



(defrule result-for-ALOE-VERA
	(or (zone_number 4)(zone_number 5))
	(land_nature ?)
	(soil_type ?)
	(water_supply ?)
	(land_size ?ls)
	(land_extent bigger)
	(sort_by_time 1)
	(short_term_crops_type 4)
	=>
	(printout t crlf "The system recommends ALOE VERA cultivation." crlf )
	(printout t "	* The expected number of aloe vera plants per perch is 180." crlf )
	(printout t "	* The expected total number of aloe vera plants is approximately " (* ?ls 180) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the aloe vera cultivation is approximately Rs." (* ?ls 180 20)"." crlf )
	(printout t "	* The expected annual income from the aloe vera cultivation is approximately Rs." (* ?ls 2 15000)"." crlf )
	(assert (fertilizer_statement yes)))




(defrule result-PADDY
	(zone_number ?)
	(land_nature ?)
	(soil_type clay)
	(or(soil_water yes)(and(soil_water no)(water_supply yes)))
	(land_size ?ls)
	(land_extent bigger)
	=>
	(printout t crlf "The system recommends PADDY cultivation." crlf )
	(printout t "	* The expected number of paddy plants per perch is 1000." crlf )
	(printout t "	* The mass of paddy seeds expected for cultivation is approximately " (* ?ls 900) " g." crlf )
	(printout t "	* The expected cost for the planting material of the paddy cultivation is approximately Rs." (* ?ls 100)"." crlf )
	(printout t "	* Paddy can be grown in the field 2 times a year." crlf )
	(printout t "	* The expected annual income from the paddy cultivation is approximately Rs." (* ?ls 2 3500)"." crlf )
	(assert (fertilizer_statement yes)))




(defrule result-for-ORNAMENTAL-AQUATIC-PLANTS
	(zone_number ?)
	(land_nature ?)
	(soil_type clay)
	(or(soil_water yes)(and(soil_water no)(water_supply yes)))
	(land_size ?ls)
	(land_extent smaller)
	=>
	(printout t crlf "The system recommends ORNAMENTAL AQUATIC PLANTS cultivation." crlf )
	(printout t "	* The expected number of Ornamental aquatic plants plants per perch is 200." crlf )
	(printout t "	* The expected total number of Ornamental aquatic plants is approximately " (* ?ls 200) " in cultivation." crlf )
	(printout t "	* The expected cost for the planting material of the Ornamental aquatic plants cultivation is approximately Rs." (* ?ls 200 5)"." crlf )
	(printout t "	* Mustard can be grown in the field 3 times a year." crlf )
	(printout t "	* The expected annual income from the Ornamental aquatic plants cultivation is approximately Rs." (* ?ls 3 8000)"." crlf )
	(assert (water_supply_statement yes)))

///////////////////////////
(defrule fertilizer-for-sand
	(fertilizer_statement yes)
	(soil_type sand)
	=>	
	(printout t "	* As there are no nutrients in the soil at present, a lot of fertilizer should be applied before starting the cultivation." crlf)
	(printout t "	- Fertilizer should be applied from time to time after the commencement of cultivation." crlf)
	(assert (water_supply_statement yes)))


(defrule fertilizer-for-loam
	(fertilizer_statement yes)
	(soil_type loam)
	=>	
	(printout t "	* Fertilizing is not necessary in the beginning. Fertilizer should be applied from time to time after the commencement of cultivation." crlf)
	(assert (water_supply_statement yes)))


(defrule fertilizer-for-clay
	(fertilizer_statement yes)
	(soil_type clay)
	=>	
	(printout t "	* As there are few nutrients in the soil at present, a small amount of fertilizer should be applied before starting the cultivation. " crlf)
	(printout t "	- Fertilizer should be applied from time to time after the commencement of cultivation." crlf)
	(assert (water_supply_statement yes)))


///////////////////////////
(defrule water-supply-no-statement
	(land_size ?s)
	(water_supply no)
	(water_supply_statement yes)
	=>
	(if(> ?s 5)
	then
	(printout t "	* To supply water for cultivation, construction of a cultivation well, collection of rainwater, or piped water supply is required." crlf)
	else	
	(printout t "	* Rainwater harvesting or piped water supply is required to provide water for cultivation." crlf)))

(defrule water-supply-yes-statement
	(water_supply yes)
	(water_supply_statement yes)
	=>
	(printout t "	* Use the existing water supply to suit the cultivation." crlf))
	(assert (landslides_statement yes)))

///////////////////////////
(defrule landslides-statement
	(or (zone_number 1)(zone_number 2) (zone_number 3))
	(land_nature slope)
	(landslides_statement yes)
	=>
	(printout t "	* Landslide mitigation measures will have to be followed." crlf))





	