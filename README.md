# Rsgrep

This is a pure Ruby implementation with the same goal as the small but amazing
[sorted grep](http://sourceforge.net/projects/sgrep/) program written by
Stephen C. Losen.

It is designed for use on large, lexicographically sorted files. It allows you
to search for lines that *begin* with a certain pattern (searching for anything
at a position anywhere other than the start of a line isn't possible using a
binary search).

## Installation

Add this line to your application's Gemfile:

    gem 'rsgrep'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rsgrep

## Usage

The gem monkey patches into the File class. It can be used in the following two
ways:

``` ruby
require 'rsgrep'

puts File.sgrep("key pattern", "path/to/file.txt")
#=> array of all lines that start with "key pattern", empty array for no
#   matches.

# or ...

f = File.open("path/to/file.txt")
puts f.sgrep("key pattern")
#=> array of all lines that start with "key pattern", empty array for no
#   matches.

f.close
```

You can pass both of these functions an options hash. Here are some examples of
the options you can pass:

``` ruby
require 'rsgrep'

f = File.open("path/to/file.txt")

# Case insensitive search
f.sgrep("PaTTern", :insensitive => true)

f.close
```

**NOTE**: There are a lot of caveat involved in getting this to work properly.
For example, you **cannot** do a case insensitive search on a file that is not
sorted in a case insensitive fashion. The results will not be what you expect.

This will be true of almost all options you pass to rsgrep. You will get the
best results on a file that uses alphanumeric characters and only uses one
casing (upper or lower, doesn't matter which).

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
