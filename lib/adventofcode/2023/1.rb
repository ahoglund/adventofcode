total = 0
data = DATA.read.split("\n")
data.each do |line|
    digits = line.scan(/\d/)
    total += "#{digits[0]}#{digits[-1]}".to_i
end

puts total

map = {
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9",
}

total = 0

data.each do |line|
    found_numbers = []
    line.split("").each_with_index do |char, i|
        if char.match(/\d/)
            found_numbers << char
        elsif char.match(/[a-z]/)
            map.keys.each do |word|
                if line[i..i+word.length-1] == word
                    found_numbers << map[word]
                end
            end
        end
    end

    total += "#{found_numbers[0]}#{found_numbers[-1]}".to_i
end

puts total

__END__
two65eightbkgqcsn91qxkfvg
neightwompstbkqv1fourfthdcfgtrkqzgrbfrczxbdn
43qsrrlxxq
898dbpjmdqjgtrvdvlxxdnvlfhncdzrt
jninedsrvftdlcg4hhztwofourskrjhcjvthree
five562
bpnjmtmeightninesix2391
rftqshh47n
ctpkqsdqz97zqptzjlfbtwo
sjtwonesix6cqbv4
9zclhrrssvzpcfpqlshfsxs
ninemcctrb5glhmctwol7
eight5fourtwotwo
18frdsvjxdpxf8dxsevenm
five55foureight
dbqeightwo4sxzsix
ftjjqbgphtmhthreesix1six
8sczkklgr5ncxkhkq
126dzbvg6two4oneightntd
fiveqcplndmmcsixksmmpdqgttwosixnine7eight
eightseven5threesevennine
nmxmcvrzbcppktgbznz2
five83
57rqxmvf12
4nklcvfsix1jvsvxh8nine
tpjppv6seven4sixsevenvnhcxonefjztthdcv
dfkcrcfxkmxccpf7sixkzlgf
ninetwo6hfg
9sfiveffxqthreeqlvhbvrpbd
gtcmqsheightthree51eight
lhszhqvtn12three8xvfglffivekc
hntwone2cmgppck5oneonesevenone3three
8414onehlxjfqghrklv
cdtlrnine2onexfspkgltjrbone8
tsjvxqljbfivefive11fourfour1st
dhhrftncnttrqz21fbdkkcdbndmdrp
jsfcqhzstnxxlchnxlztwonine5
twothree2nhjzlhqdlgnplkjts7
7zndkjxcp4xvqmqlgrhg
446sixqtk5fiveoneeight
3hdqtn2kjdkbzxx
onethree8ninelggjk38xt
2bdnkxoneeightonetskninefive
xcxfqtnpnmdmtrfivefour1seven
1cf
onefive5
t5dnseventhreehbvkqzhbbttvd
49kdxj
s743dflzcsfninefour8
eighteightfive7
2zjsxntjfbkc15vtfkltb7
knkmdgggk95two2
dvjdztx6kfzzsscfcj6zz
xvcnqppc4five7threethreeckhtmfeight
4eightthree9onexmrhrfzjjjmfm94
threebr7
four188nine856
szseven9269
rppvmpprsgqbvbskg8fivedgpv5
992one
fxthfh9twothree
jldmzlktzbhlsrndvn398five
vdzhddpsix6sixsixvbqmf8mrgnqxsxvxvdcdzmkc
7tv9
37seventwofour
seven1six723
nxjlgr64tjlqzphzjdvgb1nd
zmxldpjdsixvzcmrxxzl6
91cgn9eightzxdzfmj
skhtxclf2ninemqct
foursixn8two7srvbbdldpbtwo
two5gpnnhtseven
onepqmzphpgfive2three
5vrgsfbj
5xmqhfbdt965
263nzqjrklqkgtcgjcnprgtfj
78qrpdzmczxj7fourone2
6threed
eight2twogr
96five
2ndkfivetwo6
41fourckqxpdxdctnqmljkrl
68fzpjjvfhjv4fourhsvqtwo
ffqnvbxdzxhsxg9sevenkhpmnflbgfqsvfzfmxnlfcq
eight1six38one8g
5xhdtqshnc9foureightwog
two9llmcgxhjdghbv
9twoeightsix
f4qmsfgvzxfvxgq33twocmfnd
vqq8two8nhsqpgqnzrsixsix
dbxfbl98nllgpsix7
svzgxfspxjfbcvonefour4
eightonefour3nine8
tqhgbkzmhseven656tczxkfkztwo
pckdctnzvxdgz4
5pg
7two7vqtqxmddlbhppmpx8kldcgcfeight
gdbmfmppzl96452
rpnmhfzclkmftsjkpone4sixmjhbjprx
16ljkbvbbc77sixvjlcpdqkvkcrfqslfzvtrqf
4threetwonedrd
seven5mqgztxfqdfdssbc
6eightsixpb
7jqktjqrthoneeightthreeqpssplvh669
fivekjfktwo21jgtjdxeightseven
cjfvqzvtsstsvqsdgzlcrqnmmkgtvlclhfddeight6
8247819snr
684
threedqsvxzfmgrbrtjmjtzjeight57
1three1233tvbpqrlrpz
bxlljzgmc4twothreenldkshgt
eight9dmzftbzmsgmxvhx7khsgvgmbgg
threehbvlqone9sevenxbccbppjxj
jthreesixqlxlvtwo8
cg5nineonejtmpthkqncdmcrjztml
six69sixone5fourvhnzkxqrkm2
mkpqfbjrninemvngbxl1nine5seven
qgxhthreetphvh4fh
four84
8cdhf9fivexqsxljf
eighthmfq788eight
sevenktvsvvxj8fourgdbnpnthreethreenine1
zlcmzfsxdvthree6
mscdeight3
lhzcxzthree8seven87
rnrldrcponeqfdlxgz1lpxtf23sixkdqz
6fiveeightsixthreefour
onetwo1nine5gsvbzlsfrp4
fivefivesix82qhdhnxbgmbttgdqq92
jk886lfour
kcqmt6qk7gcdzzzzdljdmh3nineshcfnbnnd
sevenfour2krdvsfour
kbvlbhfbjqnr9three
two17
dlvndnhdbjgtp57
pqvxgonesix8k72pfmsjl
eight7xq3
xgzxgtfqvsvvtfr23fzkvphdjmm
8hbkggrpxq8two3fivefour8six
tcxntnppqtbflnzfour6zzgrpvxjtf
2sevenninefive5
sdvxrpt5lhzmkknseven2one9
7pcpmgghrbt1zpllhshcsnine
cf8
mfxnmj2ninesix58eight58
8hfnnclmmsg64scdrtdkfivetwo
9four1sixj1three
7nrcxngrxxsixmccsb4rhztxmklmccpttwo
jgtdvpseven7two59
369seven
onegdlthd9one8sixseventhree
6eight9seven
94five
6one282three9one
7rgxznfbf
zrtoneight9sfnsixninesevenzvqdxqjrcdm
five6sixkxksxone3six
qjqrjkjvplkxqvthree58ktgq
7kkc
hr54pmdtnpvzrlskpqrrqhbrnzz
99sixfgnfour389one
ltteightwothreefourfivenine7
kzpzschjsptdpd6fiveninemxfxlkbmfl
eight7dqpvvplkjxgrxxtvt
41nine
61
5qfneight7bhhnine8eightoneightfrx
34cjbcqzeighttwoqfdtqtqbl1
twofivehbxftnsixhtffgqksdseven6
84mnkvppxk18
62four6rsph
8fourctcnnzfz
5jngcrllpnonefive
grmspdlkv42tdzctls
67sixeight1
ninetwo52
9jdvzhzflgxmsixzklv4cldfivetdmhrlm
eight7twoghldrbzhleightjs
ninenp8
jxqjeight48qljhkkbfctonethreejfqlr
z9lxzgzkbmr7jtgpczmvblfour1
545two
56tkxjhndzmtwofour
1ninesixpxxxlfnfn
6threesix9twojrmtl4
6rjzjlxh5tdfkbjzvm
g8one7ccsix
4jxhxrgrhxv6threegkdsgvzxpzzrjclzrn5
qhdjbsh5
8mmngf4lpngqnbtxz
zstqrl5sevengcndbztdcr
mmdsseveneightfdbthreezbqkdbb3
kkntgp94937
2zrzntn8three
klklfnxcnmczrjlprktwo55
7ninecqjtkjsdkqgqvcxtcone6
bgjjheight5txcsjbvv1
rqbk4
soneight2qxbfdkdn51ttfourfiveninesix
czxhmh73llnlspseven8hfqzdpdqmg
26zmphsljkkddzbkninesixnine7
45six
9f
6five6nine2sevenzzzmvzlh
hfnfour8blpsixvhdz26twotwoneft
87twofive
6one92six34vfive
nine82nine5dbmjmsixseven2
6rmgq8eightqxrj3tkljktsjxz
onefour49sevenfour5
sevenftckbsfivegfbgmpcvvvtqdhmbfive8
hqrdprfhxpfjnlqvx2fivethree9onevxbqtpg6
clz76eight
seven6fourjvxzrfivethree7cgtvmsfzb
4sixseven7jktrblrk7five
tqlgpnp682qnhpspbfm
mtfive4
6ninexkds1slbdnlfp66nine
9sevencdqf
jcqccfzmgffrxjcvhpzonerlzkpvk71four38
fourtwofourfivetjzpqmzvmmcseven3
zqoneight9
4twotwo
eightgfqzzcs8eightkkklhsvkmsseven
twosix4
eightfkthjb83
8gmqlpdbftwo15sevenjllkpnp
378onefourlqcq
rxlnmcphmzckgz9bpzonezcjcgvdteight
sevenfive2rmzbpmfvplxdvvldnghmfive
tvbctwo1twofoursevenkjbjd
veightbkkp9vntmeightjdrc
ltdmmnlsjzzxqtvnghxjnvg48bqvvvcj
seven4frssnmkjhf
nine975
zcpdghhlhrvcmxftoneeight4
rgkxgfkx6cqdxjhdqdf2eight2vzkbbpklqnine
one6six5
six5seveneight
23krkcf
sdpthreetwo3
eight28
3twomdpsvbpvhthreegfrdfqtnttk
9sixsixcqbdd94bzxmjn
6fbbbrvzkzbhhlgthree
hgrnflhgqhd6628three
58tfxks
rfcmcfive51nine
3eight9
6threecktkhlvcdkmcxdflsdrcfmkpxrmq
fourssvlkcsninesix38fourkfrgbdxlhx
mbhqsceightnine5bzxfnrzdgcvsg
gfjlsvmkfourhf9qfpxmlqkninecrbnjrfpninejdntmjglk
fiveonesix58onefourdnl
hkd33lgcjrpf6four
ftsbbgmv3fourrmctcsxrfv
rkmgfour58841
gmgskgrfhc54cvpgkkhdhfseventhreefour
three9onegjdmsfthreelrpqfj1hdmbd5
mkjbxcc9375
onejxpczj2twofive5one7
vhclzbp77
8onesevenseven1
3seventhfivefiveseven
bpnrkxlnxrq4dzjljgjg2five4three
fivekpxonegm76jqtjrlrns
pmmqkgdmljhdvsixsix6gdrrx
6rzjmrhlr
sixqnblcchkfnstwo9two4xdjns
twolmffnfmdfptjcdtwogqzhtbvph18six
5threefivefive2czfcvqrjcmlcctgninefour
9cvntxx
4sevengzlzjnntxz9ghcpcgvbm9three
2qcck3one
sixqxqnjxk6ls1rdtxkb31
8onefiveeightljp2
six7one85ptxktrlbtfdtz
ltgnfzcjblvrdclkonesqgbgplqm3threeeighttwo
1xmnr
pcxkjdtcmnineeight1rl8four5eightwoqvc
twovlhtdxctsnsixfourvsixsqfhbjzklsix2
6hcdhsgzv
1six8qjdsfbnlzj93gpj
twoxfktts2xmjvcxkjjf
gkgqmdxcfkb6fjjzfsqbhnzxjzsvzkfv
6oneonefourxrnpf19
qqgsckgrrh5svt2vsd6
sixtns37
jqgfcbrd7eightsixrgkqtkf
4bkfpntttsjonemhtcgsnzvjxcftzssdlntlv7
9jvjqzgrzxslffdfhmcfournhqfckgmfnone
dgeightwothree2zhzfb2
tldpeight77mh88two
49fiveeightfiveseven4
three3rpbrvnp2rgnppsctpcqqfd
1one2sixfleightwokhz
7cnnnp6lzcjxfsqbbfqgvnqhklcktrvrlmfszmqchfnine
one9sdqnzhhnine5pkqthqsskrfourgkxbqpzkrxpkrvnk
gbhvg145twohnqfqnj2mxg9
2sevenoneqfzbfqpcfour
pgcxrr3qhvngreight3four7
vvbfrnqvgmq3eight3sevenllllfn
twonineqtklzqnd7fourjpqthree
82sixtwonez
nfmjv8pgqtqnkpmb83
seventwontjbdcs8mthreeqdgfg1
2fiveqeight
3ninexqt6fourfourone
9ninesevenzmhskrfour2qpqzhqpbgrfiveeight
twofxmpt7fvxkqbht
xmtgrngscqninesix5twotwo7
onetwo8nvhckltwo
686one1seven
986l
4ninepxhzxmhgsixjncqfhqlnb
5tkvsnpp
njfqd5eighthgzsixnhxgt
seven3seven8seven
zceightsixninetwo9vxmfscp
threemgb77nineg1vzlbvhgrms
5onelfpdchkrqpshsixtwofiveseven
6zmjpkzxttksevenpkbdvksphjseven
smeightwo993
one987cckfncdctz15sevenkdtrzkkmdz
8rhbpeightseventhree9
nrnxccfzhrrxhsjhlthreethreenk1nine73
nineone5threekxv2
fivertwotwonnrlhqzfpbntdjhv5k
ppqtrhfkdbpkflpnlx85nddjxdctf4fx
lmtwone472
3vcpbonejmtssvkn3one
8twoninembzfkjdtvdnd1three
eightsixzrrv35hmcpmgjkchfourrg
h87lhbgmzg48twoonenine
six1289src
5fiveqrmscnnqn21
ninefourfiveninexlcpxt1
onesix181onesixjds7
4zvqzgvcd9dzhjzkcgflnhhfive
6threefive7dlvgpzh
3xtvthree
one3cjckmone1six
sixsdtgjtxhsh4qmkqgsp
bznsevenfive6seven6eight7
7ninetwo4scmttkmkmhjgz1
32fiveffxpvvfive
8twotwosglcjkxtfour
8ninetwo6fivetwo
ninevjfqnbqshgcnznb2two4
1btbsqfgxz7
37skthonehgnine
qprsldzcbzcskqpgpnvjt4fivegpqllvq52
qnqpzpkmfj5ninejsix6bpcn2
28jmvbtljsldltwo68fssrjvqtwonev
fourthreefivepxqrrjm7threezjsdhfs
7kmhsdlrsqlonegbr7
onesixfourbdcgeight53lzpgjlsz
qgpgg377
five17
zpmslnjkqc3
fourvmqhvhdgseven7jtpttjlzvsbfkdrj
bdgcfcsevenfive8527
1ninesevennine
4sixfour4nh7sixnlkdk
shjz737
7onecrhjhbqqnn2sixqqgseven
6six1kxpczbxoneone
512vnxncqgtsevenfivesnc
sevenrrdrzlht5
6ltsix
87sixfourgjh
ngtzsrpxsfpmjzk2
onefour462ql5mcfqrglrp
l88oneninetbh5nine2
scgzzmeightqrltnkbjxrglbvsrpd2
7krheightjlzzmthdrqsnkdqqlkone2
three4fivexn2nine
sixseven8one6
seven46five8
bmbfd8
one99xgk2
fivetxfjpmnhdl7
gktgcbronefiver2d
444six6
dpdbxrtnnlsfkh694xnqhszfbvcc2
53mznqnine4dpkkx82
6sixldcgszrhhvrbhdnc
djfpppftbx6three9ncfour5two
eightljcvn565fivethreegsjbfsjsc
grdtdczfm5krxslvfk
1threekpnhkjbgch2
four37
ctlxgcgzj57gmninethree75three
lffrgk4
one256jxbthjxhtj989kfqnrdhhxz
three3ddsxpt1lgkzlpxfiveninebsnbntpnnine
qxskrjjvtp1chgksksxksg79
8zjvmfkpnrc32twotqdc6vshzv
8hgdrds54zk
twokr6vkbflkfrcjxvmninenineeight
grjxdtngmrthreerqjvmxbrdvlmqninegslrzfgmcpdhmg8
5tkdszfcjdm
7jbzvrdprgdx7npn
ctwoneqcmffptjzpone3brdtb4bjnzqx
eight4tjfvrvlcfgdtk61fouroneightjvf
eightsix9four7
827
8pgcksninemrt
bggbhgh8
fiveqsqvlsxc9jnhfdtqvsq71zvlh2
3z1mrzxfdkqsixseven
kbrtclpktwo6btgpxnbrz8
5ninefour6three
8ninefxfivekrkklfvnr6
ftkndksixznvhxrdmj414seven
fourdjjxhb3
four82
277leightsixseven91
4czktzmzctsdqgpqthreekjfm4
78onezmcxjbrheightfourtltlrnjpg
zvclmdhrrbmslgfmrgtvzpnvqmth1one281
dnkf3seventwo
sdtpcdc5
rtn6vfmtvg
gkeightworqtjvmc3fqpzqsevenfivecxff
four49gxrkmfdl5three
9nine3326bcxnclqgsgbng
mjrvfrz7frq2sixfour
twosix3
j7
four73zfrdrns
st14pjnfgqpj
dlceightwo53dcjzxft9
333mzmtlrhkjgsixcjzdrshhpv
vp6stsvtntboneseventwokmdvgthnine
92v2thc
seveneightfivetwofour6
three76jfx3ninekndxqschpfive
fivefxgbhfour58n
nineninezgn6kbblgf
rjvrx4four71one51
4mvmdqjfxhzpddseven7nine76
86mbxjvs
3twosevenfiveh8fiveseven
54bczbfjq9cseven5
nvghzbcjxn57nineldlklgb5fdkqvbzftl
97mtvstpkrzkrg46four
tp8
four8sixphlcct5
2pkccvfmp
ninevmvlmvqqnone69foureight9
four2xlqrmlp48vdzsevenhtrcjbpc
ffvhhtgz78threeone
bfjnjxr342555
4czvdggxlbzcthreerjfshqhmj7
6three24khccsqcnddq
659
five3lxchdtfvlnjn9mcs9jlsvzbcgvk
mfnonefivetwon2mrbsc
hvxv9three5
75ninektwoseventhreefour
zvjrcxchzrz7seven
jhmbsknfm5498qtwo
scjnfvnld72gvtzd
8fivesixtwo
tdjkrtrdj7twoneg
8one3five
2nncbsevenseven
fourtfqfnsixfourtwo9threerblgths
twoninebgxnphjsixseven4
threesevenxjgbpl321
fourtwopjzfourqvnknmmdlsrhnkonefour1
six9ninevkxnpmnpjrmnptwo
eightseven4fivethree8
nine6nineonezdbrz621
4fivezhvzlvrblm3mgzhf56
dfkdbtreightfhrp1
oneeightonecpnkkhpcpqt73
nine9fdgbzxhvbslzlhkpone78five
two74
5three36rl7vnk6one
onetj152twoqtjgvsnjpd
6ninefive
fourszvmjknhhvmznine73eightklhbbnrljk4
89eightjcdftnine
gn7oneeightzcshvfttpnvxrxjdc
four78five44
tnqmjzd2fivehqpkrkdrkqr
eight6eightfhbqqsqqs1twolhbfsjxfxj
4two4xhppfx
gnfqgghz4xnlcxqpccktwofivextpskbcnn7six
seven133bpthreeone5x
3five55four
6pgmbbbnmrrpdqzjkbsrpfhstwo
556vfzmcbxsqg8
59fiveflckfmthdd3nine
2nine5six2twosevenqrdp
qsghpdqfivethreefive8
ninesevennine1
onevkqcgdc6
bcdspxmhzsqfhhlghmqh5794blxm
8eight2twomd9gvtd7
gfjxcczktc8
ccpgbl3zqtmqjztwox
jvkvvklb5nine2dfsmkljl4hpjbhlpdmt
3rxzrnkdrnltzd
fivetwoone6
zcsf5rnxgckhktworqsqngvk8xdgtfcdseven9
rsbfcsix3jbqnqeightsixonelrhfhlldhhfg
njpnzndmdfzkpdseven5rvcsxheightthree
ninethree6zplfz1seven
7dknfz
ninebkhfqdsrone2two5six4
1x
mhrzpkcmf5three
9vzrqrmtzqnkdhrhv
g3
sixthreefourtwonln9fourvqgbbht
vfvzttx86db
cpcrxvp5eightfourseven5fivetqnine
7fsfmgbntxrmjmpmmkcnbx
sevenrkmm6threeseven
fivefivebgdssdxqfnthreethreelvln5eight
vxrxtzmtmtssjsevenfourmnhtzdthree4fivesrpcrb
t8fxpzbnfivesix6fhrcklhvfive
6threetzjvzkbdp
gflz6nine5
ldnn7qjz1lcgsmvjpbtplztmvseven3
threefourtwoeightdfpbjbggx3m
4nineonenine6kkzsmfdrl
lmmpsdmnnsrgkbzcdfive5
4onethreejcrgddkxthree
9twonexr
pvjdlxv1xlgkdsixsixone1four
fourtwofivenine2
xl8
tfmfive7
9q8svkhxgvbmhseven
fournmtqnnphzckqsnpqddlvgff1ninetfhdknbnl
6fivetwo59gxbzxrkdvhfive3
ndbrshkmc9
4fourseven
lkdcxdkkxthq5
ftwo2pgpljh11fpbgl2
hhjrfcchcjlhninexmv6
9bpzdrrfqcs7eightwob
8eightfive
57nnbqt5eightzvfblxstz9scfnnv
92three7xkkdskhvseven
ghlbrzxhlkh63three
5nine7fourtwo78
3dvxdphhxgrbfrlq4qxzslfng8rrfjnpjdnxc
brq68eightoneightvrx
four7twooneeighttwo
onenine2nineninesixfive
slltwone8kngkhvgkkphrmgprnm9
twonhsxggcslm3zqmsixfive
pzgpspbfivetwosix9btjbdfbdeightj
fivezpdk34ninephlzvddrmzvkztwo
sevenfour223qvxrdrvqgkqpctbrzeightqtxjnhgz
7373sevenrrsfzsfour
rttwovggcqtzx2993
twonineonegpcpdqrpd284
2fourfrzkbkhninegseven83one
1pjqvdntbseventhree
eight19tszhr
hngn5fqfcfxrnfs
6xsxcgkdstncdl19c1two
cvrdkrqrmssevenfivecjblqxjbzqtvkqhmcm18
zqtblgtqttwo9gmkcfkdcgbq83
bdrmrsrdfponeeight3fvvsrfbshbzbqztmhbbzpkxxnb9eight
4trjldtsjdc8vkgvseven
37fourfive9three7nine
fourseveneighteight7fiveonexxmmjzlbhk
fivetwothree8seveneighttwo5nine
mqmeightwo3
8cjkdcdk
6cjnjht51knzzcsqkvtwo
5dshlzzxxggninesix1two
9seven1eightonef7
two75sixfivesixhthreethree
1fntfzqrjcxlfprglcsix7
4lgcgkseven
r15two
eightdsxsnqgfnbntvnqtsfpr1
sddbms6nine6
7tpdrfpbd
flmztqone7sixzdqlxhfiveoneone
jzpvdcvnzmmgzhxlcsevennine2
nineseven3cqktfscgtf
rdhrxhfn8hbhctkkxz3
7cjzxmlvq48kvmxgmcd
twoeightlqpfv5fourdfv77
8sixfivegnsevenlgdkfcfznine
fk8hcndpfflmsbjlseven
1onesscdrlztwoonezfm
n8xdcmfxvvgm1b
psix3
gmpnine5ninekfmmhbrnq
713six
gqplptccrthreethree3jdgbtx
1onergncpbv
5fivetwo7two6nine
4sixqrrtqjnv7
onetwo7364fqrjghsbzp
five7shstn
5sixkcspphnsxndzfdghh
jhxpxxpfz4sfkpgeight9ninedclxgv3
fourqfzqsgpt4ljtrrxn2
8seveneight6fhnf9onethree
bjgdq8two8m6bnnbdtqvlf
eightgjrvdjhz6
rdkvkqhfourdpn7tkjbflm7
1ptthreeeightonetwogbh95
92four96
2sevenpkfgj75
lpfnmmp2eightmbrzxdskx7ninetwo
gjmxfive7qqrbsr
qxprvlrhxlj1threethreevrvvc2eighttwo
vdqmnccqsplkpmspqcggvllsxvh1
fvdhvmgzseven2fnrrslbdtwo6
fivefive9smbxkkp192
vbsdstvbknldcgkzkgqjln7
mklnltnfsixphfgfzseven8fivenine
jbshrqn2three844
6nspp1one7three5
six3four571
nqjssphmsbhbfhp822one
9kffmtffiveeight3
sbfbphdgjh4sixbfcrzmnlhxcsksctb5tdtm
7bfzk7mvrglxjfour2tzrkz4
onethree36
zdtcr45four2tpgqsix
sevenmqgjhcjpnine63zllrtnm1
jnccdbplkfq6oneightd
one8flhbdbl93
rrmd34
six1lkthggkbtwo5onesixthree
eightl294eightlb
eightzngvqdmfgvfvhlrxnfourcfggfgp9
dkmzgc73l
839fourone5
xfklsdj6three22
soneight6cvgndhbtttlbpqktwo
5nine1four471pnnvsix
zqrfmnpgzkqrshrpktfbndvfmrcjhfqlhcbn9rrffzngrhnthreedbgcm
xcmt2fournine
seventfgnkd87sixthree
77fktkx
3mdzzsvdmltl7jeightfivenine
seven988five
9975
eight4sbc5eight9
mxj53bsh8fourzv4
817
99ninevnonecfcbsjgnrzrdffll
twofftvkshm4
one221jjbtlgdtt
68sevenfive2lhrblxpkdq8nine3
39cjrgljlvxdfivenhptwoccjbhtnmqreighteight
sixfoursix74fzdtnx92
rhpktnqsvqxn51
35nine1
43gqzppsnktxm2
5five566dtbppfp
nine7one23sixsix
93fourbqmsspdhr
cm5qcfxfcsg3qcvstwozhsnspg
227two
qfrtvpnh8
one4jzmmmjjk
4vxvngmtjxldcn2
bjgb2kvrlshdvfj1hnpfbtxkp
7eightpzmxcmcnsmtkxjt
hzhjbddqj961zkxgmhxdthreetwo3
7fivetwo5dvpplrmxqrzxtwofive
717mfszgrbt
chqhsqt7hcmbjqstfive
threesevenkknvhhtt7399k
7n
6twohzlngv
eightthreekkgt9mqzvkql9txh4
8fcsndmltseven
twodjscb5sxfourtwod
5ssbz
onedvpnnfvqxvfour1jggdsxfdgrqfrgvssix
sevenk94mthklgmsxhxdjxslvfive
bjqshcpk26
nine7sixzx7
9threexsfqxqhvvbsjzrbmxcfssix
geightwonineqp7twoeight79
8b8dllrmvgnmhshvkhm
7grpghbfourlsixthree7
1xzrhgxsh7threetrqqvsl1hcmmk
fivetwoppnseven9sltkmcsntzldvqzfour
6flgcsj
nine44onedninesix7
hrlfdsmjqtbpfpxljhjrrxrrdnrlzf34eight
sevenrzgsvq6
39sixjshdjrfmstwo2tzmzhgggdqgflp
tcrvlffrmqrcx6bqbvhlcbgtwo351
9281qzt35jmtpjgqq
qpdtvpmfbqrmthreetvlsr2fzbzkthreerhqvqbcnj
two3fgrnggpcl
7onexrnvssfjczlmkzgprnone2khmhntg
6lzggxthreefour26tnxfcqbl37
8rgnffphzgponejfive
bmpsevennhrkphhbfz8nine
5mkbbjdcqninenine9
zrfvhcreightone9five
19chrfkm6gqlfcfhmslmcmr
dzrt197twonine
vmrlbm5five
pthree3six417frljvddzjtgdvmmh
fournine7lmzdrxvjsixlmfsgtwonesn
ngt8fdcsgmbbvrone3
3hfhppzdfp
sevenqvrlkpgxnqfivexnzpxcnine99
38oneightg
4fivezjzsstlfxp1pdjmmnvjvtthree
xfngrdrfseven5rcsqtflhsqz
three3jtndtxpx
eightfour8xxtkjsjlrsmg6
1qnjttkhzltvj2xtlts6lqlxrf
eight817two52sixgmhsrnlzm
fourgxbk81
eight6eight
4pllfiveeightsixonekhxvhvx1
41twothree
9pcdldnine
vkkncnrblg2x36
sevenzrqsix3
ccpnk5threeeight1
rj69
ninedzgnsvrjbg4eight
nine3onesevenxvpmmt5eight
drcbrg9eighttvdqgrchlqnineseven
five6two3bgzgtvxmj8
sixfive9
7txddsmg2hzhz1fourkkthree1
3pvgxxxmpt5eighttwocnvnine
cdnbkl3
twosix9sixninevftwo1
392
427twozqp79sixtwo
2jpkrm16
threelbspfkeighthxmmcpprmeightthree3
bvtfzpr36nine
qdzfdzbvnk47twofive4two5
ninethreedfzrphlvkpbvtvmzjxgmrh6five
cjnq7gnpnpt
six8nine2
chsdgnlrzqnddfjthreebhfdvlgfpfshkeightseven6
nmlqvslhk6fourninexpzlf9pfnbrnhphxzxh
eight9nfgtsjxnteight8pfpfctjxxbffxsmjtwonegcd
nine8m1
9sixseven
218
6brzzmkxsm
ftxrrhzz1five98kninepc
3kkmbvvvtwoksspmqksevenoneplone
eight3sevenfour7two8md4
jvtk22472
threetmpkcsjsixfour6twoseven4
kclmjgdplc23ninekmqbrkxrkdhsnnhmthreecfive
xkzbzkszml641one54phdfghtbdd
3442four8vr7
6lthree
lfrlxpczfiveseven2
fhjjlb1fiveninempnvlzbkhsvqf6
fiveone66onesix6dtwo
91bgqfz1four8
7two8sevencvfjhqmdtfone
889two3db36
sevenhlljx5qoneeightfivemvsmbzdbznine
one45sixft6eight6rbf
gdsevenknlfourkmzlpvv3flsfvnmfseveneight
3qbs622fivemzqpxdfkssix
275fr2eightoneone
lktbgbhngfbrzdponerqstslfourhjxgmv1qcj
two9fivelsxpd2six
9eightnine
qmteightwosixseventznkgmnhjvdfxvqv8
ninenine9jdgndgnfour3pgb4gdpjnt
three3sevenzcbllclmseven1threeeight
xzbkxnttninexsj2
ngrgdonefive94fivehgnt7
3nineqnvhsninetfeight22eightwoqf
phrzskrhbd9five8nine
dqqnfive1
hsjrhjvmlqxltxxgqx6qbfsnrhgbkl
four5hrpnq
vfsqhhgb6eightgtjlvnxnqsrjn3pg
71fiveknrgx7
dpeightdbvpnfour1
two59blldsls85
three22nfvmtd77mbjnvxqbdxkxvp
five56five22
jtqeighttnkzkbbtwoninepzxphtlbzsv8
1zhktrqsklfivegxdhrqt
three422
8sqlrqn9
zh8
1fourone8
94kkqb9four9
6sixkbvxf
rbvxqgztwopcbhhgzthl6xsix1qjrvfive
two29one594brhbpnine
7fivebczzcfeightfour
bxqrdcx7sixthree
xjqchs31twoeightthreesevennine
83five8qvnrcllfhddhltsevenone
gsjjxtvtck7six
cxsbtkzcgjbgninehhmzzfnine3bpzg7
six7threedbhtvcvjtmeightz
pdfmjbqgvkr5t
cqbkrkfivexkmvgqfbfsg5zmfhbqkdcq1
6ptrseven65tvbjkqlhjhjq26oneighthsp
39eighttwoninetwomnszqrmtvj
hfpcgzrp8pmmvonevtnfpfltmgxqzntwo
seven6cd8eightr
1vbpfiveseven5gsqdpchrjzfour
7zlxvvjmlnonesix67two2sfggmgbmm
rmgvfvdhhgztrrn966six9oneone
6nkvznctwoone
eightthreeg9nine7six
shthreethree1
tm1eight8rone575
nv6
tpkgndlhdzlfour1fouronethreenhmgtjzn3
9onetwol2qmltninehtrmfxcsbfghk
2vbqxkgp5two89one
428ninefcskeight
g3fournine55eight
hmnvcgtqsixfivebone6
mpcp55xdfive33mdbsc
bfpfrrlqsixfq9cnzvffncbn
hmpvxz3fiveklnnjcvgxtplhhzdrn8seven
gqr6fiveltkqqfvkhconeseven4rlqnvmmkgcx
two2eightwokcr
eight1zmqpcjbbxkkcnk8
pq6qhfnm
sevenseventwo5three7
7eight1mkpmsvpmqfjnvqzgbjkmpc2
gtwoflpblvv6xzpblmfcbx
32five
four3two843nlxxhktmcdoneightjh
89gjs7eightnineonethree4
4rfcbkgrcfb6three7jblgcrrxp5
mhs47tqvkt31twofive
pspptsbp55
fourfour5twogdvjvskqx8foursix
eightxfvnrpcvjtfkvlng91eightcdgzhxzcm
nine5psngtrxms5vnrbjjrpgt
5xnlqscssbfiveeighteight14
svzlbtdkhs5eightfourgzhsix944
fourbphkpbkcfss5l
4four6
onetwo99
nzhlddbkgcbxvpfour1twofiveseventhree3
2one2txrzz8fivethree
seven86
two3tznttbfkzzbthreexqhxqmbj
dskppdthree2
seven4lfive
hnftvrk8fhhzrqzxxqzbhvjhflv2nine
eightsix2zbsgtdvrone
rmssljck3sixfivehvsvtwo9ctrbfvhpxfrr
3nphszlp7ktrtzflbvxnfive
cfrrckdlfmjkmvjbtxnsdq613hxlsix6
spljfjrlrsix2fsl
threeonezdbmxps9
two2lnbvmmpnqq8ssonethree
vvpjpvm6two7
424
threek811nine1five2
82mfsgmh
ninerrjtnkm4nine
sevenonenine7
nine16698llgxbbglggone
knhnxtj6ntkxnine2eight7
286nx
twocbxfonenineonerxvdjzjzcp2
2one5
ninethree25sevenfour69
chthreeone9eightoneshlgndnrjoneightcs
2onenvfszxbphone
9threefour
eightonenine28one
3bshksixrlncdqtk3foureighthjcmmktsvx
prlsj7seven
gqxoneightzmcsqsbvhbthreefive16
3kbqbzm2sixnine52onekrtoneighttq
hqnfive2one
jfive17onemzd
6one2eighttnjzjk
vtmcxnttlxltcmseven2svp2pnzkbgzzzj2one
54mhqbcpzgsd2ld
3fvbnineeight
fivejrxqnqp11cxeighttwojqbqnhmeight
twoonetwo49sixxjbkdoneseven
7qnqpfb9xrhtxkfz9three
one8four1
2r3lrgjltxxlrhrvfltwoonevq
jkptfcvdtwo347mjrqd
eight9cxstff
7nqqbkcsftknhqffjvr2sevenpkjvtc
seven5sevenrsthreefiveone
8mmvdqhone584eighteightfive
7sevenjjgvr4
465nineninesqnslzrfpl
ljqnr737gvfmpjztrsbns8two
hkmdgbbrzpjczpqkhzkdmndlftxgtwoeight26
nhskzhxfk26lpklkkkdnxeight
sixrqcjqseven7sbqlnpqvshxninebxmkxfrznine
xlrrfnt7jjhfqzr
one9six3
sevensevenpsbgtgqpmbsbbpldvbz2qsstxlcgkd
5qpmvbnpfiveoneeightsevenone78
four69seven
2nv
1twovfmvk33gcrsfgdbms
fivetwoone93
g4sixjbcqttbhnp6fourfplmzdtnltnjqdsthree
f3
one3ninefiveone3hlsthrp7
lmdgzgkrq747nine
fourtwo7
7353bdninesixxtc
njnsprmjxcjn42sixp1
92onefour
5eighthkdf
263fiveeight
four96one52fivendcnqcl
rcntpkdtjlcxkdg8
nt7g55ninetfzrjmhrv33
two19
ninefive5threetwo73pxjfive
onethree42
9dctnplfgkeight9
xpjtknfive6five
q1ninefour7
twohfdckgcddpmjbpmgbxnineeightxcxkhssjt1
8hgcs3onemnrcfbgsh9fdc
7zmgns94ninenmm
3four3
hrrt3nine292fourfour
ljsbmrfmnpgg799twosixfoursix
sixjj6
gqmvmmjsjrgn7fiveninetwovnjbs
m2
525onefive
ninesixlm7fiveeight
fourfour6eight5gpkpjdxqvrsp
two5sixkrmxnszf1eight6seven
1bbmmf
26two
9eighteightfivesix7
mcjcdnhlxv92qfbfbdpxfnxgbqsnxkonethreeseven7
9qlvlrfivefzdxpmttsllhntpxpfthree
djdjgxdpnd82five
fiveonenine19four4two
five69two7sfj
twoonelvmdbdq2two
qxeight6trprdmgqzj4
eightfourdvmbvnjthreetwormzfr4qgdctg
fournngpdffcxt1six
seveneight6zeight9
fkkmfbd7nineseven
twobtkvbzgplfpjfiveseven5
9jsjkjhgtghbqltldlcpqtvgpmhsixsix1four2
kxcgkvkmnblfive438
six6lbbqlttnvfiverxceightwobx
8sevenseven6three9ptfggzkhm
one7ninemdjznbqhfkckpjkxtwo12
1bvjgdjlll
43kjdtwofiveseventhree9
fourlgzcrldtwoseven9xndlqvbrtonennvlvzplrt
8twohzmcknlmqd
gshhvf5twodqgdseven8fourfoursix
nineone47sixeightrp
4stonekdgdhxrtqv9sixonevhhmhqzp
8lmpppc
4five8ffive
fivefivesmmkh6jhtggr4
tjrr9ninenine
six6fiverqdlm67hztn2five
six3278xsddmnz
8qlhdpxn645nhrjm
xlfttcfs6jgtbeight6sixdvpl22
87tcj6gkjfrrmdjbgh4
6eightsevennmdpkkmkqrffgshrfhml7two1
ninemglsrmvqrk5six
9nfgt1rntwo1826
three2fiveonexrllxsvfive
9zjfkmdfbfqqf2mxpnqsmsthjzzszdxl
43eightnvdrthree1eightoneggrdmnp
pffldcmnlpsevensixqxhdncrclbc51five
5bqnlphone6
195one
