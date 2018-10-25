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
$ ./njuskalo.rb -r 5 -l 5000 -c iphone-5s
Ad #1: 
	iPhone 5s, 16 GB
	850 kn
Ad #2: 
	Apple iphone 5s
	500 kn
Ad #3: 
	iPhone 5s
	899 kn
Ad #4: 
	Iphone 5 s kutija
	900 kn
Ad #5: 
	iPhone 5S 16GB ** TIP TOP STANJE ** SVA OPREMA ** SVE MREŽE **
	1.100 kn
```


### TODO
 - [ ] Extract the link for an Ad
 - [ ] Add the argument for sorting by the price
 - [ ] Add show types