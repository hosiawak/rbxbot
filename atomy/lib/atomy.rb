base = File.expand_path "../", __FILE__
kernel = File.expand_path "../../kernel/", __FILE__

require 'readline'
require 'optparse'

require base + "/macros"
require base + "/method"
require base + "/util"
require base + "/namespace"
require base + "/compiler/compiler"
require base + "/compiler/stages"
require base + "/parser"
require base + "/patterns"
require base + "/code_loader"

def require_atomy(*as)
  before = Atomy::Namespace.get
  begin
    Atomy::CodeLoader.load_file *as
  ensure
    Atomy::Namespace.set(before)
  end
end

require_atomy(kernel + "/boot.ay")
Atomy::Namespace.ensure(:user)
