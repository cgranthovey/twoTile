//
//  storeWord.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/11/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import Foundation

class StoreWord {
    private var _aa = ScrabbleWord(word: "Aa", partOfSpeech: "noun", definition: "Basaltic lava", image: "http://res.cloudinary.com/di6su8dza/image/upload/c_scale,w_640/v1462995562/volcano-lava-magma_ytxtlg.jpg")
    private var _ab = ScrabbleWord(word: "Ab", partOfSpeech: "noun", definition: "Stomach muscles", image: "https://pixabay.com/static/uploads/photo/2015/06/24/22/39/anatomy-820792_960_720.jpg")
    private var _ad = ScrabbleWord(word: "Ad", partOfSpeech: "noun", definition: "Short for advertisement", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463001243/index_czsfie.jpg")
    private var _ae = ScrabbleWord(word: "Ae", partOfSpeech: "adjective", definition: "One", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463372803/bagger_gxpvql.jpg")//https://pixabay.com/en/bagpiper-loch-ness-kilt-tartan-1319161/
    private var _ag = ScrabbleWord(word: "Ag", partOfSpeech: "adjective", definition: "Relating to agriculture", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463002341/wheat_wdc1te.jpg")
    private var _ah = ScrabbleWord(word: "Ah", partOfSpeech: "interjection", definition: "An exclamation used to express realization or happiness", image: "https://pixabay.com/static/uploads/photo/2016/04/08/00/28/notion-1315284_960_720.jpg")
    private var _ai = ScrabbleWord(word: "Ai", partOfSpeech: "noun", definition: "Three clawed sloth", image: "http://res.cloudinary.com/di6su8dza/image/upload/c_scale,w_640/v1462998990/pexels-photo-24380_wget0x.jpg")
    private var _al = ScrabbleWord(word: "Al", partOfSpeech: "noun", definition: "Indian shrub", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463002894/index_rwqjhn.jpg")
    private var _am = ScrabbleWord(word: "Am", partOfSpeech: "verb", definition: "To exist", image: "https://upload.wikimedia.org/wikipedia/commons/7/73/Frans_Hals_-_Portret_van_Ren%C3%A9_Descartes.jpg")
    private var _an = ScrabbleWord(word: "An", partOfSpeech: "indefinite article", definition: "indefinite article placed before words beginning with a vowel sound", image: "https://pixabay.com/static/uploads/photo/2016/01/19/17/39/starry-night-1149815_960_720.jpg")
    private var _ar = ScrabbleWord(word: "Ar", partOfSpeech: "noun", definition: "Letter R", image: "https://pixabay.com/static/uploads/photo/2014/09/18/22/42/letters-451521_960_720.jpg")//https://upload.wikimedia.org/wikipedia/commons/b/be/Bonney%2C_Anne_%281697-1720%29.jpg
    private var _as = ScrabbleWord(word: "As", partOfSpeech: "adverb", definition: "Used in comparing", image: "https://pixabay.com/static/uploads/photo/2015/10/11/19/34/scales-of-justice-982903_960_720.jpg")
    private var _at = ScrabbleWord (word: "At", partOfSpeech: "preposition", definition: "Expressing time or place", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463006635/fashion-man-person-hand_1_vw0d6s.jpg")
    private var _aw = ScrabbleWord(word: "Aw", partOfSpeech: "exclamation", definition: "Way of expressing sympathy or protest", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463606559/awKid_lrgnlj.jpg")//https://pixabay.com/en/child-face-pouting-stroller-1377126/
    private var _ax = ScrabbleWord(word: "Ax", partOfSpeech: "noun", definition: "Tool used to chop wood", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463121411/ax_nq0cjj.jpg")//https://pixabay.com/static/uploads/photo/2015/10/12/14/56/axe-984008_960_720.jpg
    private var _ay = ScrabbleWord(word: "Ay", partOfSpeech: "noun", definition: "Affirmative answer", image: "https://pixabay.com/static/uploads/photo/2015/05/18/23/19/gesture-772977_960_720.jpg")
    private var _ba = ScrabbleWord(word: "Ba", partOfSpeech: "noun", definition: "In ancient Egypt this was one of five parts of the soul", image: "https://upload.wikimedia.org/wikipedia/commons/b/b5/Egyptian_-_Ba_Bird_-_Walters_571472.jpg")
    private var _be = ScrabbleWord(word: "Be", partOfSpeech: "verb", definition: "Exist, first person singular", image: "https://pixabay.com/static/uploads/photo/2014/03/12/09/24/art-painting-285919_960_720.jpg")
    private var _bi = ScrabbleWord(word: "Bi", partOfSpeech: "noun", definition: "Bisexual", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463172773/bixsexual2_yel3wt.jpg")
    private var _bo = ScrabbleWord(word: "Bo", partOfSpeech: "noun", definition: "Pal", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463010341/lake-animals-dogs-pets_radvt7.jpg")
    private var _by = ScrabbleWord(word: "By", partOfSpeech: "adverb", definition: "Near or through", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463011049/eilean-donan-castle-650681_1280_klpiom.jpg")
    private var _de = ScrabbleWord(word: "De", partOfSpeech: "preposition", definition: "From, used in names", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463175345/miguel_c2lyw6.jpg")//https://en.wikipedia.org/wiki/Miguel_de_Cervantes
    private var _do = ScrabbleWord(word: "Do", partOfSpeech: "verb", definition: "To perform an action", image: "https://pixabay.com/static/uploads/photo/2014/04/05/11/40/poster-316691_960_720.jpg")
    private var _ed = ScrabbleWord(word: "Ed", partOfSpeech: "noun", definition: "Education", image: "https://pixabay.com/static/uploads/photo/2015/10/30/09/18/square-academic-cap-1013557_960_720.jpg")
    private var _ef = ScrabbleWord(word: "Ef", partOfSpeech: "noun", definition: "Letter F", image: "https://pixabay.com/static/uploads/photo/2013/07/14/04/53/alphabet-162574_960_720.jpg")
    private var _eh = ScrabbleWord(word: "Eh", partOfSpeech: "interjection", definition: "used when a listener does not understand something", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463464939/ehSmallersmall_kolwbz.jpg") //https://en.wikipedia.org/wiki/Flag_of_Canada
    private var _el = ScrabbleWord(word: "El", partOfSpeech: "noun", definition: "Letter L", image: "https://pixabay.com/static/uploads/photo/2013/07/14/04/54/alphabet-162581_960_720.jpg")
    private var _em = ScrabbleWord(word: "Em", partOfSpeech: "noun", definition: "Printer's measurement", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463079946/Untitled_ngrebi.jpg")
    private var _en = ScrabbleWord(word: "En", partOfSpeech: "noun", definition: "Half an em", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463080164/en_b9ctlp.jpg")
    private var _er = ScrabbleWord(word: "Er", partOfSpeech: "interjection", definition: "Sound indicating hesitation", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463029771/girl-1031309_960_720_ecagvx.jpg")
    private var _es = ScrabbleWord(word: "Es", partOfSpeech: "noun", definition: "Letter S", image: "https://pixabay.com/static/uploads/photo/2013/07/14/04/54/alphabet-162586_960_720.jpg")
    private var _et = ScrabbleWord(word: "Et", partOfSpeech: "verb", definition: "Past tense of eat", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463078844/appleEt_uqtg7f.jpg")
    private var _ex = ScrabbleWord(word: "Ex", partOfSpeech: "noun", definition: "Letter X", image: "https://pixabay.com/static/uploads/photo/2013/07/14/04/55/alphabet-162592_960_720.jpg")
    private var _fa = ScrabbleWord(word: "Fa", partOfSpeech: "noun", definition: "Fourth note in music scale", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463071393/grandPianoFa_erva9q.jpg")
    private var _fe = ScrabbleWord(word: "Fe", partOfSpeech: "noun", definition: "Hebrew letter, pronounced as 'Ph' or 'F'", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463072449/hebrewLetterFe_wqrvk2.jpg")    //https://commons.wikimedia.org/wiki/File:Hebrew_letter_pe_freefonts.svg
    private var _gi = ScrabbleWord(word: "Gi", partOfSpeech: "noun", definition: "Clothing worn for Judo", image: "https://pixabay.com/static/uploads/photo/2016/03/31/15/15/art-1293108_960_720.png") //pixabay
    private var _go = ScrabbleWord(word: "Go", partOfSpeech: "verb", definition: "To depart", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463073856/goThreeWheel_zyaoxi.jpg")    //pexel
    private var _ha = ScrabbleWord(word: "Ha", partOfSpeech: "exclamation", definition: "A sound made when surprised", image: "https://pixabay.com/static/uploads/photo/2012/02/29/12/12/cute-18927_960_720.jpg")  //pixabay
    private var _he = ScrabbleWord(word: "He", partOfSpeech: "noun", definition: "Male", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463077875/manSymbolBathroom_mx2gsc.jpg") //pixabay
    private var _hi = ScrabbleWord(word: "Hi", partOfSpeech: "exclamation", definition: "Used as a greeting", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463075244/wave-hello_d7p1nu.jpg") //publicdomainpictures.net
    private var _hm = ScrabbleWord(word: "Hm", partOfSpeech: "interjection", definition: "Denotes pondering", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463464620/thinker2_pudhzy.jpg") //https://pixabay.com/static/uploads/photo/2016/04/01/23/35/art-1301872_960_720.png
    private var _ho = ScrabbleWord(word: "Ho", partOfSpeech: "interjection", definition: "Used to bring attention, used by Santa", image: "https://pixabay.com/static/uploads/photo/2015/12/13/14/25/christmas-1091178_960_720.jpg") //pixabay
    private var _id = ScrabbleWord(word: "Id", partOfSpeech: "noun", definition: "Part of psyche desiring pleasure, Sigmund Freud theory", image: "https://pixabay.com/static/uploads/photo/2014/07/23/19/25/sigmund-freud-400399_960_720.jpg")  //pixabay
    private var _if = ScrabbleWord(word: "If", partOfSpeech: "conjunction", definition: "In the event that", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463080789/graf60_efdymj.jpg")    //pixabay https://pixabay.com/en/graffiti-funny-building-painted-386495/
    private var _in = ScrabbleWord(word: "In", partOfSpeech: "preposition", definition: "Inside", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463176232/babyPaint_mywcn4.jpg") // https://pixabay.com/en/belly-painting-baby-pregnant-409794/
    private var _is = ScrabbleWord(word: "Is", partOfSpeech: "verb", definition: "Third person singular of be", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463081480/life_fultp7.jpg") //https://pixabay.com/en/life-is-beautiful-courage-joy-hope-905867/
    private var _it = ScrabbleWord(word: "It", partOfSpeech: "noun", definition: "Designated person in a child's game", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463186652/tag33_iicdim.jpg")//https://pixabay.com/en/blindfolded-chase-game-search-kids-37705/
    private var _jo = ScrabbleWord(word: "Jo", partOfSpeech: "noun", definition: "Sweetheart, used in Scotland", image: "https://pixabay.com/static/uploads/photo/2016/04/30/21/41/couple-1363993_960_720.jpg")
    private var _ka = ScrabbleWord(word: "Ka", partOfSpeech: "noun", definition: "Part of spirit which remains in a mummy", image: "https://upload.wikimedia.org/wikipedia/commons/5/54/Ka_Statue_of_horawibra.jpg")
    private var _ki = ScrabbleWord(word: "Ki", partOfSpeech: "noun", definition: "Synonymous with qi", image: "https://pixabay.com/static/uploads/photo/2014/10/09/14/02/woman-481902_960_720.jpg")
    private var _la = ScrabbleWord(word: "La", partOfSpeech: "noun", definition: "Sixth note in music scale", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463071393/grandPianoLa_r5fxwb.jpg") //https://pixabay.com/en/piano-midi-music-musical-773735/
    private var _li = ScrabbleWord(word: "Li", partOfSpeech: "noun", definition: "Chinese measurement of distance, about .5 km", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463084050/greatWall_gr9xw0.jpg") //https://www.pexels.com/photo/mountains-clouds-historical-great-wall-of-china-19872/
    private var _lo = ScrabbleWord(word: "Lo", partOfSpeech: "exclamation", definition: "Said when desiring attention, used in religous texts", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463173076/moses1_ceplo9.jpg") //https://pixabay.com/en/moses-jesus-wanderer-prophet-145721/
    private var _ma = ScrabbleWord(word: "Ma", partOfSpeech: "noun", definition: "Mother", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463105054/mom1_wh3da6.jpg") //https://www.pexels.com/photo/woman-female-girl-child-8986/
    private var _me = ScrabbleWord(word: "Me", partOfSpeech: "pronoun", definition: "Referring to self", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463420807/penguinReduced_hgq3bu.jpg")//https://pixabay.com/en/penguin-zoo-conceited-844834/
    private var _mi = ScrabbleWord(word: "Mi", partOfSpeech: "noun", definition: "Third note in music scale", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463071393/grandPianoMi_sby7qy.jpg")
    private var _mm = ScrabbleWord(word: "Mm", partOfSpeech: "interjection", definition: "Used to convey one's pleasure", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463173269/mm_dwelcj.jpg")//https://pixabay.com/en/ice-man-happy-eating-relax-party-375361/
    private var _mo = ScrabbleWord(word: "Mo", partOfSpeech: "noun", definition: "Short amount of time", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463107280/hourGlass_nuffpn.jpg") //https://pixabay.com/en/hourglass-time-pressure-time-708574/
    private var _mu = ScrabbleWord(word: "Mu", partOfSpeech: "noun", definition: "12th letter of the Greek alphabet", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463108457/mu_kp2pke.jpg") //https://commons.wikimedia.org/wiki/File:Mu_uc_lc.svg
    private var _my = ScrabbleWord(word: "My", partOfSpeech: "pronoun", definition: "Possessive I", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463110865/myGirlsDad1_eqrf8b.jpg") //http://digitalcollections.nypl.org/items/510d47df-f072-a3d9-e040-e00a18064a99
    private var _na = ScrabbleWord(word: "Na", partOfSpeech: "adverb", definition: "Not", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463111538/thumb_down_mkqps2.jpg") //https://www.pexels.com/photo/hand-thumbs-up-thumb-black-and-white-8252/
    private var _ne = ScrabbleWord(word: "Ne", partOfSpeech: "adjective", definition: "Birthname - Marilyn Monroe, ne Norma Mortenson", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463114409/mm2_orsosv.jpg") //https://commons.wikimedia.org/wiki/File:Marilyn_Monroe_photo_pose_Seven_Year_Itch.jpg
    private var _no = ScrabbleWord(word: "No", partOfSpeech: "determiner", definition: "None", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463606789/noHand_ffkgvt.jpg") //https://pixabay.com/en/no-hunting-sign-no-hunting-fence-1110491/   https://pixabay.com/en/stop-no-photo-no-photographing-hand-565609/
    private var _nu = ScrabbleWord(word: "Nu", partOfSpeech: "noun", definition: "13th letter of the Greek alphabet", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463115226/nu_byhqzx.jpg") //https://commons.wikimedia.org/wiki/File:Nu_uc_lc.svg
    private var _od = ScrabbleWord(word: "Od", partOfSpeech: "noun", definition: "Odic force, hypothetical force believed to transcend throughout nature", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463116415/od_jm6be5.jpg") //https://pixabay.com/en/star-wars-flower-soldier-dark-1176168/
    private var _oe = ScrabbleWord(word: "Oe", partOfSpeech: "noun", definition: "Winds from the Faroe Islands", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463117776/beachAndWind_f5tels.jpg") //https://pixabay.com/en/crooklets-beach-cornwall-bude-1313636/
    private var _of = ScrabbleWord(word: "Of", partOfSpeech: "preposition", definition: "Indicates something belonging to something else", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463118575/puzzle-654110_1280_s51zu6.jpg") //http://res.cloudinary.com/di6su8dza/image/upload/v1463118575/puzzle-654110_1280_s51zu6.jpg
    private var _oh = ScrabbleWord(word: "Oh", partOfSpeech: "exclamation", definition: "Exclamed during moments of sorrow, happiness, or anger", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463119519/photoOh_qhpfmt.jpg")//https://pixabay.com/en/photographer-man-hands-characters-1210218/
    private var _oi = ScrabbleWord(word: "Oi", partOfSpeech: "exclamation", definition: "Said to try to gain a person's attention", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463120179/oi_k5adpu.jpg") //https://www.flickr.com/photos/prblmtkx/22845310843/in/photolist-ANLbZH-uctXYG-ow8ti1-qbNw3e-otvM2c-ornWVj-ouXAsB-obP2U8-oeZbCd-obMVPW-of27Ad-owHJLB-odFGDZ-oc7Jtb-osYxmL-obZ8Pg-ouXTf6-odjQmA-orp4vG-obWjz9-otsmBh-ouWeWh-of2s75-odZsVQ-odZFm1-ovh91m-osYcuw-obw2U2-of27Pu-odueE8-obVozh-ouKMNY-osHE4n-oc8Qhc-odtk3M-otpimJ-oqXMjy-owWeR6-osUR5i-osHoGk-ouKT7y-osPS5u-ovhsbj-ot7LrM-obv6HZ-otcwpP-otoDKj-otha2w-oc8ufv-ouXWAz
    private var _om = ScrabbleWord(word: "Om", partOfSpeech: "noun", definition: "Sound made during meditation", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463120706/meditate_lls9wr.jpg")//https://www.pexels.com/photo/relaxation-relaxing-meditation-yoga-12344/
    private var _on = ScrabbleWord(word: "On", partOfSpeech: "preposition", definition: "In contact with another object", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463120917/onMountain_ujnmct.jpg")//https://www.pexels.com/photo/mountains-nature-sky-sunny-6629/
    private var _op = ScrabbleWord(word: "Op", partOfSpeech: "noun", definition: "Type of art with optical illusions", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463156392/op_vq7n3j.jpg")//https://pixabay.com/en/optical-illusion-chessboard-tunnel-155520/
    private var _or = ScrabbleWord(word: "Or", partOfSpeech: "noun", definition: "Color of gold used in armorial bearings during the middle ages", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463158595/coatOfArms1_ialzc0.jpg")//https://pixabay.com/en/benferri-coat-of-arms-heraldry-906563/
    private var _os = ScrabbleWord(word: "Os", partOfSpeech: "noun", definition: "A bone", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463173643/bone_msvcf7.jpg")//https://pixabay.com/en/bone-animal-decay-skeleton-nature-949077/
    private var _ow = ScrabbleWord(word: "Ow", partOfSpeech: "exclamation", definition: "Said when one feels abrupt pain", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463173824/needleOw_o1wkrv.jpg")//https://pixabay.com/en/doctor-pain-vaccination-shot-arm-673578/
    private var _ox = ScrabbleWord(word: "Ox", partOfSpeech: "noun", definition: "Castrated male cattle", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463173979/ox_u8kwis.jpg")//https://pixabay.com/en/swot-up-cattle-farm-nature-1261538/
    private var _oy = ScrabbleWord(word: "Oy", partOfSpeech: "exclamation", definition: "variable of oi", image: "https://upload.wikimedia.org/wikipedia/commons/6/60/Town_crier%2C_Plymouth%2C_Devon%2C_England_-_20101030.jpg")
    private var _pa = ScrabbleWord(word: "Pa", partOfSpeech: "noun", definition: "Father", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463236210/father_ek9awp.jpg") //https://pixabay.com/en/father-son-smile-laugh-happy-dad-849092/
    private var _pe = ScrabbleWord(word: "Pe", partOfSpeech: "noun", definition: "Hebrew letter, pronounced as 'P'", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463239046/peHebrew1_utd1dr.jpg")
    private var _pi = ScrabbleWord(word: "Pi", partOfSpeech: "noun", definition: "16th letter of Greek alphabet", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463265370/pi1_jwohd4.jpg")//https://pixabay.com/en/pi-symbol-letter-mathematics-math-1327145/
    private var _qi = ScrabbleWord(word: "Qi", partOfSpeech: "noun", definition: "A life force in Chinesse medicine which flows throughout the body", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463266450/Qi1_mhrbim.jpg")//https://www.pexels.com/photo/people-festival-sitting-freedom-50709/
    private var _re = ScrabbleWord(word: "Re", partOfSpeech: "noun", definition: "Second note in music scale", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463071393/grandPianoRe_j8fayv.jpg")
    private var _sh = ScrabbleWord(word: "Sh", partOfSpeech: "interjection", definition: "Used when desiring silence", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463281422/sh_xemsqr.jpg")//https://pixabay.com/en/person-human-child-girl-blond-976759/
    private var _si = ScrabbleWord(word: "Si", partOfSpeech: "noun", definition: "Seventh note in music scale, also known as Ti", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463282215/siPiano_c77ayh.jpg")
    private var _so = ScrabbleWord(word: "So", partOfSpeech: "noun", definition: "Fifth note in music scale", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463368312/soRedone_zef8he.jpg")
    private var _ta = ScrabbleWord(word: "Ta", partOfSpeech: "exclamation", definition: "Thank you", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463370224/thanksWoman_s2mtpm.jpg")//https://pixabay.com/en/thanks-gratitude-smile-appreciation-1209247/
    private var _ti = ScrabbleWord(word: "Ti", partOfSpeech: "noun", definition: "Seventh note in music scale", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463071393/grandPianoTi_dcss0c.jpg")
    private var _to = ScrabbleWord(word: "To", partOfSpeech: "preposition", definition: "Indicates something that a person or objects moves toward", image: "https://pixabay.com/static/uploads/photo/2015/09/18/07/44/ocean-945148_960_720.jpg")
    private var _uh = ScrabbleWord(word: "Uh", partOfSpeech: "interjection", definition: "Indicates hesitation", image: "https://pixabay.com/static/uploads/photo/2014/04/05/11/19/unsure-315080_960_720.jpg")
    private var _um = ScrabbleWord(word: "Um", partOfSpeech: "interjection", definition: "Indicates hesitation, see uh", image: "https://pixabay.com/static/uploads/photo/2016/02/15/23/08/unsure-1202301_960_720.jpg")
    private var _un = ScrabbleWord(word: "Un", partOfSpeech: "pronoun", definition: "One", image: "https://pixabay.com/static/uploads/photo/2013/07/12/13/11/one-146653_960_720.jpg")
    private var _up = ScrabbleWord(word: "Up", partOfSpeech: "adverb", definition: "To a higher position", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463374182/rockClimbing1_ipxzkw.jpg")//https://pixabay.com/en/rock-climbing-fitness-sports-cliff-924842/
    private var _us = ScrabbleWord(word: "Us", partOfSpeech: "pronoun", definition: "Refers to speaker and other person(s) as object of a verb or preposition", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463375115/us_zs452c.jpg")//https://pixabay.com/en/group-people-teens-young-friends-1262146/
    private var _ut = ScrabbleWord(word: "Ut", partOfSpeech: "noun", definition: "The original first note in music scale, now replaced by 'do'", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463375697/ut_original_abtcta.jpg")
    private var _we = ScrabbleWord(word: "We", partOfSpeech: "pronoun", definition: "Used to indicate oneself and another person or persons", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463421350/wekidsFInal_xszsia.jpg")//https://pixabay.com/en/children-smiling-asian-filipino-597471/
    private var _wo = ScrabbleWord(word: "Wo", partOfSpeech: "noun", definition: "Woe, great affliction", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463377508/wo_l5hvuo.jpg")//https://www.pexels.com/photo/man-person-portrait-old-9824/
    private var _xi = ScrabbleWord(word: "Xi", partOfSpeech: "noun", definition: "14th letter of Greek alphabet", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463378033/xifinal1_ctzlfb.jpg") //https://commons.wikimedia.org/wiki/File:Xi_uc_lc.svg
    private var _xu = ScrabbleWord(word: "Xu", partOfSpeech: "noun", definition: "Vietnamese monetary unit, worth one hundredth of a dong", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463379951/xu1_e9vb5n.jpg")//https://commons.wikimedia.org/wiki/File:Vietnam_1_dong.jpg
    private var _ya = ScrabbleWord(word: "Ya", partOfSpeech: "pronoun", definition: "You, informal", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463380421/YA1_drjisf.jpg")//https://pixabay.com/en/finger-guy-i-want-you-man-point-1299243/
    private var _ye = ScrabbleWord(word: "Ye", partOfSpeech: "pronoun", definition: "Plural form of thou", image: "https://pixabay.com/static/uploads/photo/2012/11/28/11/10/shakespeare-67698_960_720.jpg")
    private var _yo = ScrabbleWord(word: "Yo", partOfSpeech: "exclamation", definition: "Greeting slang", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463420220/yo2_q8waeu.jpg")//https://commons.wikimedia.org/wiki/File:DapGreeting.jpg
    private var _za = ScrabbleWord(word: "Za", partOfSpeech: "noun", definition: "Pizza", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463382696/za_wqudqb.jpg")
    func getWord() -> [ScrabbleWord]{
        return [_aa, _ab, _ad, _ae, _ag, _ah, _ai, _al, _am, _an, _ar, _as, _at, _aw, _ax, _ay, _ba, _be, _bi, _bo, _by, _de, _do, _ed, _ef, _eh, _el, _em, _en, _er, _es, _et, _ex, _fa, _fe, _gi, _go, _ha, _he, _hi, _hm, _ho, _id, _if, _in, _is, _it, _jo, _ka, _ki, _la, _li, _lo, _ma, _me, _mi, _mm, _mo, _mu, _my, _na, _ne, _no, _nu, _od, _oe, _of, _oh, _oi, _om, _on, _op, _or, _os, _ow, _ox, _oy, _pa, _pe, _pi, _qi, _re, _sh, _si, _so, _ta, _ti, _to, _uh, _um, _un, _up, _us, _ut, _we, _wo, _xi, _xu, _ya, _ye, _yo, _za]
        //
    }
}







