class Slap
  A = []
  A << "/me slaps %s"
  A << "/me smacks %s about with a large trout"
  A << "/me beats up x"
  A << "/me pokes %s in the eye"
  A << "why on earth would I slap %s ?"
  A << "*SMACK*, *SLAM*, take that %s !"
  A << "/me activates her slap-o-matic..."
  A << "/me orders her trained monkeys to punch %s"
  A << "/me smashes a lamp on possesiveForm %s head"
  A << "/me hits %s with a hammer, so they breaks into a thousand pieces"
  A << "/me throws some pointy lambdas at %s"
  A << "/me loves %s , so no slapping"
  A << "/me would never hurt %s !"
  A << "go slap %s yourself"
  A << "I won't; I want to go get some cookies instead."
  A << "I'd rather not; %s looks rather dangerous."
  A << "I don't perform such side effects on command!"
  A << "stop telling me what to do"
  A << "/me clobbers %s with an untyped language"
  A << "/me pulls %s through the Evil Mangler"
  A << "/me secretly deletes possesiveForm %s source code"
  A << "/me places her fist firmly on possesiveForm %s jaw"
  A << "/me locks up %s in a Monad"
  A << "/me submits possesiveForm %s email address to a dozen spam lists"
  A << "/me moulds %s into a delicous cookie, and places it in her oven"
  A << "/me will count to five..."
  A << "/me jabs %s with a C pointer"
  A << "/me is overcome by a sudden desire to hurt %s"
  A << "/me karate-chops %s into two equally sized halves"
  A << "Come on, let's all slap %s"
  A << "/me pushes %s from his chair"
  A << "/me hits %s with an assortment of kitchen utensils"
  A << "/me slaps %s with a slab of concrete"
  A << "/me puts on her slapping gloves, and slaps %s"
  A << "/me decomposes %s into several parts using the Banach-Tarski theorem and reassembles them to get two copies of %s !"

  def self.slap(nick)
    A.sample % nick
  end

end
