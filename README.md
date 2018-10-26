# njuskalo.rb
Ruby script for getting ads from https://www.njuskalo.hr/ by given parameters.

### Prerequisites

 - ruby
 - curl ( binary ) - for now used to download the html of a HTTPS web-page
 - nokogiri - https://github.com/sparklemotion/nokogiri

### Installing

Download and run the script.

```
Usage: njuskalo.rb [options]
    -p, --page PAGE_NUMBER           Select a page (default = 1)
    -r, --result RESULT_NUMBER       Number of results to show
    -l, --limit LIMIT                Cash limit
    -s, --show SHOW_TYPE             Number (0-2)
    -c, --category CATEGORY          Category to look in (example: apple-iphone => https://www.njuskalo.hr/apple-iphone )
```

### Example

```
$ ./njuskalo.rb -r 5 -l 1800 -c dell-prijenosnici  
1: [ **Dell N0573** 1000kn niza cijena ==> 1.650 kn ]
	 ==> https://www.njuskalo.hr/dell-prijenosnici/dell-n0573-1000kn-niza-cijena-oglas-26787645

2: [ DELL Vostro 3560 ==> 1.000 kn ]
	 ==> https://www.njuskalo.hr/dell-prijenosnici/dell-vostro-3560-oglas-26681084

3: [ Dell Inspirion 3551,intel Quad core,4gb,500HDD-a,intel HD grap. 1500kn ==> 1.500 kn ]
	 ==> https://www.njuskalo.hr/dell-prijenosnici/dell-inspirion-3551-intel-quad-core-4gb-500hdd-a-intel-hd-grap-1700kn-oglas-25571723

4: [ Dell Latitude D430 Core 2 Duo 1.2GHz 80GB 2GB Laptop ==> 999 kn ]
	 ==> https://www.njuskalo.hr/dell-prijenosnici/dell-latitude-d430-core-2-duo-1.2ghz-80gb-2gb-laptop-oglas-4118182

5: [ Dell Inspiron N5030 sa novom baterijom, torba ==> 1.100 kn ]
	 ==> https://www.njuskalo.hr/dell-prijenosnici/dell-inspiron-n5030-p07f-oglas-26432568
```


### TODO
 - [x] Extract the link for an Ad
 - [ ] Add the argument for sorting by the price
 - [ ] Add show types