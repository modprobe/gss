require 'digest'

start = Time.now

# Wörterbuch laden
dictfile = open('/usr/share/dict/ngerman')
dict = dictfile.read.split("\n")

# Wörter mit >5 Buchstaben herausfiltern
dict.reject! { |word| word.length > 5 }

# Die vorgegebenen Werte
salt = 'xohth4dew5p8'
hashval = '199f066a0bac4140e792d1d4a434ae44'

# Wort für Wort durch das Wörterbuch iterieren
dict.each do |word|
    # diese Iteration überspringen wenn der Hash nicht passt
    next unless Digest::MD5.hexdigest("#{salt}#{word}") == hashval
    # Wenn der Hash passt: Zeit stoppen, Ergebnis ausgeben
    stop = Time.now
    puts "Password is \"#{word}\""
    puts "Took #{stop - start} seconds"
end
