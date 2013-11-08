# 4l4y l4ngu4g3
kalimat = 'Di usiaku saat ini .. ee .. ya 29 MY AGE ya ..

Tapi aku tetap masih merindukan apresiasi karena .. basically aku seneng .. seneng musik walaupun KONTROVERSI HATI Aku lebih menyudutkan kepada KONSPIRASI KEMAKMURAN yang kita pilih ...

Nggak ..kita .. kita belajar .. apa ya HARMONISASI dari hal terkecil sampai terbesar.. Kupikir kita nggak boleh ego terhadap satu kepentingan dan KUDETA apa yang kita menjadi keinginan yaa.

Dengan adanya hubungan ini bukan MEMPERTAKUT, bukan MEMPERSURAM STATUSISASI KEMAKMURAN keluarga dia gitu .. tapi menjadi CONFIDENT, tapi .. kita harus bisa MENSIASATI KECERDASAN itu untuk LABIL EKONOMI kita tetap lebih baik ... dan aku sangat bangga.

Zaskia: "Dibeliin rumah ya .. Pap, ya? Aku dibeliin rumah ya sayang .. ya?"

Vicky: "Nanti lah kita komunikasikan lagi soal itu."'

def alay_converter(word)
word.gsub(/[aieo]/i, 'a' => 4, 'i' => 1, 'e' => 3, 'o' => 0,'A' => 4, 'I' => 1, 'E' => 3, 'O' => 0)
end
puts alay_converter(kalimat)
puts alay_converter('a i e o') == '4 1 3 0' 