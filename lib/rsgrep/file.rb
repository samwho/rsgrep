class File
  def self.sgrep key, filename
    File.new(filename).sgrep key
  end

  def sgrep key
    # initialise the variables that the binary search algorithm needs.
    hi  = size
    lo  = 0
    mid = (hi + lo) / 2
    ret = []

    while lo < mid and mid < hi
      seek(mid)
      seek(-2, IO::SEEK_CUR) while (c = getc) != "\n" and c != nil

      if (line = gets).start_with? key
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
        end while gets.start_with? key

        # Then scan forward line by line until all of the lines that match have
        # been added to the return array.
        ret << line while (line = gets).start_with? key rescue nil

        # and we're done!
        break
      elsif key < line
        # Key is less than the line. Shift the hi value down and recalculate the
        # mid.
        hi = mid
        mid = (hi + lo) / 2
      elsif key > line
        # Key is greater than the line. Shift the lo value up and recalculate
        # the mid.
        lo = mid
        mid = (hi + lo) / 2
      end
    end

    return ret
  end
end
