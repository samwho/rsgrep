# Rsgrep

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'rsgrep'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rsgrep

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## A note on the specs...

Because writing specs for this required having a very large file to scan, I had
to choose a very large file that was freely available. For obvious reasons, I
cannot put the file into this repository but you can download it from
[here](http://books.google.com/ngrams/datasets). It's the 0th file of the 3grams
dataset in English.

Direct link:
[http://commondatastorage.googleapis.com/books/ngrams/books/googlebooks-eng-all-3gram-20090715-0.csv.zip](http://commondatastorage.googleapis.com/books/ngrams/books/googlebooks-eng-all-3gram-20090715-0.csv.zip)

It's about 440mb compressed, 3gb uncompressed. You will need to uncompress it
into the `spec/data` directory in order to run the specs successfully.
