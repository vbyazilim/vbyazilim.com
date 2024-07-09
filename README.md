![Version](https://img.shields.io/badge/version-0.0.5-orange.svg)
[![pages-build-deployment](https://github.com/vbyazilim/vbyazilim.com/actions/workflows/pages/pages-build-deployment/badge.svg?branch=gh-pages)](https://github.com/vbyazilim/vbyazilim.com/actions/workflows/pages/pages-build-deployment)


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
rake deploy[bump]             # Deploy to gh-pages with bump
rake new:article[title,date]  # Post new Article
rake runserver                # Run development server
```
