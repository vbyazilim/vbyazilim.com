# vbyazilim.com

Brand new version of our website!

## Requirements

- `ruby 3.1.2` ( `ruby 3.1.2p20`)
- `arm64-darwin-21`

Check yours via `bundle platform`

## Installation

```bash
$ git clone https://github.com/vbyazilim/vbyazilim.com.git
$ cd vbyazilim.com/
$ bundle config set --local path 'vendor/bundle'
$ bundle config set --local bin 'bin'
$ bundle

# run server
$ rake

# tasks
$ rake -T

rake build                    # Build site
rake deploy                   # Deploy
rake new:article[title,date]  # Post new Article
rake runserver                # Run development server
```
