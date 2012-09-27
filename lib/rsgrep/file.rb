class File
  def self.sgrep key, filename, options = {}
    File.open(filename) do |f|
      f.sgrep key, options
    end
  end

  def sgrep key, options = {}
    # initialise the variables that the binary search algorithm needs.
    hi  = size
    lo  = 0
    mid = (hi + lo) / 2
    ret = []

    if options[:insensitive]
      comparator = Proc.new do |key, line|
        key  = key.downcase
        line = line.downcase
        if line.start_with? key
          0
        else
          key <=> line
        end
      end
    else
      comparator = Proc.new do |key, line|
        if line.start_with? key
          0
        else
          key <=> line
        end
      end
    end

    while lo < mid and mid < hi
      seek(mid)
      seek(-2, IO::SEEK_CUR) while (c = getc) != "\n" and c != nil

      case comparator.call(key, (line = gets))
      when 0
        # So we've found a line that matches the key, but this may not be the
        # first line that does (due to the nature of binary searching). This
        # begin/end block scans backwards in the file to find the first line
        # that matches the key.
        begin
          # Seek back 2 lines because "gets" will advance the file pointer
          # forward.
          2.times do
            seek(-2, IO::SEEK_CUR) # First read will always be a newline, skip it
            seek(-2, IO::SEEK_CUR) while (c = getc) != "\n" and c != nil
          end
        end while comparator.call(key, (line = gets)) == 0

        # Then scan forward line by line until all of the lines that match have
        # been added to the return array.
        ret << line.rstrip while (line = gets) != nil and comparator.call(key, line) == 0

        # and we're done!
        return ret
      when -1
        # Key is less than the line. Shift the hi value down and recalculate the
        # mid.
        hi = mid
        mid = (hi + lo) / 2
      when 1
        # Key is greater than the line. Shift the lo value up and recalculate
        # the mid.
        lo = mid
        mid = (hi + lo) / 2
      else
        raise "Should not be raised, ever."
      end
    end

    return ret
  end
end
