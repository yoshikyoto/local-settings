class Tag < String
  def initialize name
    @name = name
    self << "<" << name << ">"
    @style = Hash[]
  end
  def setStyle(key, value)
    @style[key] = value
  end
  def getStyledTag
    style = "<" + @name + " style=\""
    @style.each{|key, value|
      style << (key + ":" + value + ";")
    }
    style << "\">"
    return style
  end
  def getCloseTag
    "</" + @name + ">"
  end
end

class String
  def replaceTag! tag
    gsub!(tag, tag.getStyledTag);
  end
end

# 入力を読み込む
str = ""
while line = gets
  str += line
end


border_color = "#00D"
background_color = "#CFF"


h4 = Tag.new("h4")
h4.setStyle("background-color", background_color)
h4.setStyle("border-style", "solid")
h4.setStyle("border-width", "0px 0px 2px 10px")
h4.setStyle("border-color", border_color)
h4.setStyle("padding-left", "10px")
str.replaceTag!(h4)

h5 = Tag.new("h5")
h5.setStyle("background-color", background_color)
h5.setStyle("border-left", "solid 5px " + border_color)
h5.setStyle("padding-left", "10px")
str.replaceTag!(h5)

h6 = Tag.new("h6")
h6.setStyle("background-color", background_color)
h6.setStyle("padding-left", "5px")
str.replaceTag!(h6)


bq = Tag.new("blockquote")
bq.setStyle("border", "1px solid #ccc;")
bq.setStyle("background-color", "#efefef")
bq.setStyle("font-family", "monospace")
bq.setStyle("padding",  "10px 15px")
bq.setStyle("margin", "20px")
str.replaceTag!(bq)

# whole_div = Tag.new("div")
# font-size:95%;

# 結果を出力
puts str
