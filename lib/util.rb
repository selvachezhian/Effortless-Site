class Util

  def self.encode_parser( str )
    UnicodeUtils.nfkd(str.to_s).gsub(/(\p{Letter})\p{Mark}+/,'\\1').to_s.downcase
  end

end