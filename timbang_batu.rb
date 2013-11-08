Last login: Fri Nov  8 08:50:59 on ttys000
Domikado-2:AkademiRails domikado2$ irb
irb(main):001:0> def timbang(array_batu)
irb(main):002:1> if array_batu.length <=2
irb(main):003:2> a = array_batu.first
irb(main):004:2> b = array_batu.last
irb(main):005:2> else
irb(main):006:2* a = timbang(array_batu.slice!(0, array_batu.length/2))
irb(main):007:2> b = timbang(array_batu)
irb(main):008:2> end
irb(main):009:1> if a > b
irb(main):010:2> a
irb(main):011:2> else
irb(main):012:2* b
irb(main):013:2> end
irb(main):014:1> end
=> nil
irb(main):015:0> timbang {1,2,3,4,5,8,5,46,34}
SyntaxError: (irb):15: syntax error, unexpected ',', expecting '}'
timbang {1,2,3,4,5,8,5,46,34}
           ^
	from /Users/domikado2/.rbenv/versions/2.0.0-p247/bin/irb:12:in `<main>'
irb(main):016:0> timbang ({1,2,3,4,5,8,5,46,34})
SyntaxError: (irb):16: syntax error, unexpected ',', expecting =>
timbang ({1,2,3,4,5,8,5,46,34})
            ^
	from /Users/domikado2/.rbenv/versions/2.0.0-p247/bin/irb:12:in `<main>'
irb(main):017:0> timbang ([1,2,3,4,5,8,5,46,34])
=> 46
irb(main):018:0> 50+100/2
=> 100
irb(main):019:0> 150/2
=> 75
irb(main):020:0> 
