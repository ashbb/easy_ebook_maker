# mkmd.rb

# Create ../README.md and reference ../md/***.md files, if they do not exist.
PATH = 'http://github.com/ashbb/easy_ebook_maker/tree/master'

def mk_link i, num, name
  fname = num + '_' + name.gsub(/[\&\#\!\(\)\\\/\:\*\?\"\<\>\| ]/, '_') + '.md'
  open('../md/' + fname, 'w'){|f| f.puts name, '-' * name.length} unless File.exist?('../md/' + fname)
  line = num[3..4] == '00' ? i.to_s + '. ' : "\t- "
  line << "[#{name}](#{PATH + '/md/' + fname})"
end

open('../README.md', 'w') do |f|
  IO.read('./table_of_contents.txt').each do |line|
    if line[0].chr == '0'
      i, num, name = line[0,3].to_i, line[0,5], line[7..-2]
      line = line[6].chr == '#' ? (i.to_s << '. ' << name) : mk_link(i, num, name)
    end
    f.puts line
  end
end unless File.exist? '../README.md'


# Import source code ../src/***.rb and create links to ../img/***.png (or.jpg)
def read_src name
  IO.readlines('../src/' + name).collect{|c| "\t" + c}
end

def make_link name
  lines = []
  lines << "**#{name}**"
  lines << "\n"
  lines << "![#{name}](#{PATH}%2Fimg%2F#{name}?raw=true)"
end

Dir.glob("../md/*.md").each do |file|
  lines = IO.readlines(file)
  open(file, 'w') do |f|
    lines.each do |line|
      name = /^# *(.*\.rb)/.match(line).to_a[1]
      if name
        line = read_src(name)
      else
        name = /^# *(.*\.(png|jpg))/.match(line).to_a[1]
        line = make_link(name) if name
      end
      f.puts line
    end
  end
end
