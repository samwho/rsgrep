require File.join(File.dirname(__FILE__), '..', 'lib', 'rsgrep')

DATA_ROOT  = File.join(File.dirname(__FILE__), 'data')
DATA_FILE1 = File.join(DATA_ROOT, 'googlebooks-eng-all-3gram-20090715-0.csv')

DICT_FILE  = if File.exists?("/usr/share/dict/words")
               "/usr/share/dict/words"
             else
               nil
             end
