//
//  storeWord.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/11/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import Foundation

class StoreWord {
    private var _aa = ScrabbleWord(word: "Aa", partOfSpeech: "noun", definition: "A dry form of Lava", image: "http://res.cloudinary.com/di6su8dza/image/upload/c_scale,w_640/v1462995562/volcano-lava-magma_ytxtlg.jpg")
    private var _ab = ScrabbleWord(word: "Ab", partOfSpeech: "noun", definition: "Muscles in the stomach", image: "https://pixabay.com/static/uploads/photo/2015/06/24/22/39/anatomy-820792_960_720.jpg")
    private var _ad = ScrabbleWord(word: "Ad", partOfSpeech: "noun", definition: "Short for advertisement", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463001243/index_czsfie.jpg")
    private var _ae = ScrabbleWord(word: "Ae", partOfSpeech: "adjective", definition: "One", image: "https://pixabay.com/static/uploads/photo/2013/07/12/13/11/one-146653_960_720.jpg")
    private var _ag = ScrabbleWord(word: "Ag", partOfSpeech: "adjective", definition: "relating to agriculture", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463002341/wheat_wdc1te.jpg")
    private var _ah = ScrabbleWord(word: "Ah", partOfSpeech: "interjection", definition: "an exclamation used to express realization or happiness", image: "https://pixabay.com/static/uploads/photo/2016/04/08/00/28/notion-1315284_960_720.jpg")
    private var _ai = ScrabbleWord(word: "Ai", partOfSpeech: "noun", definition: "Three clawed sloth", image: "http://res.cloudinary.com/di6su8dza/image/upload/c_scale,w_640/v1462998990/pexels-photo-24380_wget0x.jpg")
    private var _al = ScrabbleWord(word: "Al", partOfSpeech: "noun", definition: "Indian shrub", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463002894/index_rwqjhn.jpg")
    private var _am = ScrabbleWord(word: "Am", partOfSpeech: "verb", definition: "To exist", image: "https://upload.wikimedia.org/wikipedia/commons/7/73/Frans_Hals_-_Portret_van_Ren%C3%A9_Descartes.jpg")
    private var _an = ScrabbleWord(word: "An", partOfSpeech: "indefinite article", definition: "indefinite article placed before words making a vowel sound", image: "https://pixabay.com/static/uploads/photo/2016/01/19/17/39/starry-night-1149815_960_720.jpg")
    private var _ar = ScrabbleWord(word: "Ar", partOfSpeech: "noun", definition: "The letter R", image: "https://upload.wikimedia.org/wikipedia/commons/b/be/Bonney%2C_Anne_%281697-1720%29.jpg")
    private var _as = ScrabbleWord(word: "As", partOfSpeech: "adverb", definition: "Used in comparing", image: "https://pixabay.com/static/uploads/photo/2015/10/11/19/34/scales-of-justice-982903_960_720.jpg")
    private var _at = ScrabbleWord (word: "At", partOfSpeech: "preposition", definition: "denoting time", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463006635/fashion-man-person-hand_1_vw0d6s.jpg")
    private var _aw = ScrabbleWord(word: "Aw", partOfSpeech: "exclamation", definition: "Way of expressing sympathy or protest", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463007161/clasped-hands-541849_1280_jll0k5.jpg")
    private var _ax = ScrabbleWord(word: "Ax", partOfSpeech: "verb", definition: "Tool used to chop wood", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463121411/ax_nq0cjj.jpg")//https://pixabay.com/static/uploads/photo/2015/10/12/14/56/axe-984008_960_720.jpg
    private var _ay = ScrabbleWord(word: "Ay", partOfSpeech: "noun", definition: "Said to express affirmation", image: "https://pixabay.com/static/uploads/photo/2015/05/18/23/19/gesture-772977_960_720.jpg")
    private var _ba = ScrabbleWord(word: "Ba", partOfSpeech: "noun", definition: "According to ancient egypt this was one of five parts of the soul", image: "https://upload.wikimedia.org/wikipedia/commons/b/b5/Egyptian_-_Ba_Bird_-_Walters_571472.jpg")
    private var _be = ScrabbleWord(word: "Be", partOfSpeech: "exist", definition: "to exist", image: "https://pixabay.com/static/uploads/photo/2014/03/12/09/24/art-painting-285919_960_720.jpg")
    private var _bi = ScrabbleWord(word: "Bi", partOfSpeech: "noun", definition: "Bisexual", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Bi_flag.svg/450px-Bi_flag.svg.png")
    private var _bo = ScrabbleWord(word: "Bo", partOfSpeech: "noun", definition: "pal", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463010341/lake-animals-dogs-pets_radvt7.jpg")
    private var _by = ScrabbleWord(word: "By", partOfSpeech: "adverb", definition: "near or through", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463011049/eilean-donan-castle-650681_1280_klpiom.jpg")
    private var _de = ScrabbleWord(word: "De", partOfSpeech: "preposition", definition: "from", image: "https://upload.wikimedia.org/wikipedia/commons/d/d6/Louis_Fran%C3%A7ais-Dant%C3%A8s_sur_son_rocher.jpg")
    private var _do = ScrabbleWord(word: "Do", partOfSpeech: "verb", definition: "To perform an action", image: "https://pixabay.com/static/uploads/photo/2014/04/05/11/40/poster-316691_960_720.jpg")
    private var _ed = ScrabbleWord(word: "Ed", partOfSpeech: "noun", definition: "Education", image: "https://pixabay.com/static/uploads/photo/2015/10/30/09/18/square-academic-cap-1013557_960_720.jpg")
    private var _ef = ScrabbleWord(word: "Ef", partOfSpeech: "noun", definition: "letter f", image: "https://pixabay.com/static/uploads/photo/2013/07/14/04/53/alphabet-162574_960_720.jpg")
    private var _eh = ScrabbleWord(word: "Eh", partOfSpeech: "exclamation", definition: "used when a listener doesn't understand something", image: "https://pixabay.com/static/uploads/photo/2016/01/23/14/55/canada-1157521_960_720.jpg")
    private var _el = ScrabbleWord(word: "El", partOfSpeech: "noun", definition: "letter l", image: "https://pixabay.com/static/uploads/photo/2013/07/14/04/54/alphabet-162581_960_720.jpg")
    private var _em = ScrabbleWord(word: "Em", partOfSpeech: "noun", definition: "a unit used by printers to measure width", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463079946/Untitled_ngrebi.jpg")
    private var _en = ScrabbleWord(word: "En", partOfSpeech: "noun", definition: "half an em", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463080164/en_b9ctlp.jpg")
    private var _er = ScrabbleWord(word: "Er", partOfSpeech: "exclamation", definition: "Sound used when expressing hesitation", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463029771/girl-1031309_960_720_ecagvx.jpg")
    private var _es = ScrabbleWord(word: "Es", partOfSpeech: "noun", definition: "The letter s", image: "https://pixabay.com/static/uploads/photo/2013/07/14/04/54/alphabet-162586_960_720.jpg")
    private var _et = ScrabbleWord(word: "Et", partOfSpeech: "verb", definition: "Past tense of eat", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463078844/appleEt_uqtg7f.jpg")
    private var _ex = ScrabbleWord(word: "Ex", partOfSpeech: "noun", definition: "The letter x", image: "https://pixabay.com/static/uploads/photo/2013/07/14/04/55/alphabet-162592_960_720.jpg")
    private var _fa = ScrabbleWord(word: "Fa", partOfSpeech: "noun", definition: "musical note", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463071393/grandPianoFa_erva9q.jpg")
    private var _fe = ScrabbleWord(word: "Fe", partOfSpeech: "noun", definition: "hebrew letter", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463072449/hebrewLetterFe_wqrvk2.jpg")    //https://commons.wikimedia.org/wiki/File:Hebrew_letter_pe_freefonts.svg
    private var _fy = ScrabbleWord(word: "Fy", partOfSpeech: "expression", definition: "an interjection which represents disgust", image: "https://pixabay.com/static/uploads/photo/2012/02/23/08/48/disgust-15793_960_720.jpg")
    private var _gi = ScrabbleWord(word: "Gi", partOfSpeech: "noun", definition: "clothing worn while practicing Judo", image: "https://pixabay.com/static/uploads/photo/2016/03/31/15/15/art-1293108_960_720.png") //pixabay
    private var _go = ScrabbleWord(word: "Go", partOfSpeech: "verb", definition: "To depart", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463073856/goThreeWheel_zyaoxi.jpg")    //pexel
    private var _gu = ScrabbleWord(word: "Gu", partOfSpeech: "noun", definition: "A type of violin from Shetland", image: "https://pixabay.com/static/uploads/photo/2016/03/12/13/52/violin-1252019_960_720.jpg") //pixabay
    private var _ha = ScrabbleWord(word: "Ha", partOfSpeech: "exclamation", definition: "A sound made when surpised", image: "https://pixabay.com/static/uploads/photo/2012/02/29/12/12/cute-18927_960_720.jpg")  //pixabay
    private var _he = ScrabbleWord(word: "He", partOfSpeech: "noun", definition: "male", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463077875/manSymbolBathroom_mx2gsc.jpg") //pixabay
    private var _hi = ScrabbleWord(word: "Hi", partOfSpeech: "exclamation", definition: "Used as a greeting.", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463075244/wave-hello_d7p1nu.jpg") //publicdomainpictures.net
    private var _hm = ScrabbleWord(word: "Hm", partOfSpeech: "interjection", definition: "Used when someone is thinking", image: "https://pixabay.com/static/uploads/photo/2016/04/01/23/35/art-1301872_960_720.png") //pixabay
    private var _ho = ScrabbleWord(word: "Ho", partOfSpeech: "interjection", definition: "Used to bring attention", image: "https://pixabay.com/static/uploads/photo/2015/12/13/14/25/christmas-1091178_960_720.jpg") //pixabay
    private var _id = ScrabbleWord(word: "Id", partOfSpeech: "noun", definition: "Unconcious part of psyche desiring imediate pleasure, Sigmund Freud theory", image: "https://pixabay.com/static/uploads/photo/2014/07/23/19/25/sigmund-freud-400399_960_720.jpg")  //pixabay
    private var _if = ScrabbleWord(word: "If", partOfSpeech: "conjunction", definition: "In the incident that", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463080789/graf60_efdymj.jpg")    //pixabay https://pixabay.com/en/graffiti-funny-building-painted-386495/
    private var _in = ScrabbleWord(word: "In", partOfSpeech: "Noun", definition: "A connection, often political", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463081147/Obama2_bptqyg.jpg") // https://pixabay.com/en/barack-obama-official-portrait-1174489/
    private var _is = ScrabbleWord(word: "Is", partOfSpeech: "verb", definition: "Third person of be", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463081480/life_fultp7.jpg") //https://pixabay.com/en/life-is-beautiful-courage-joy-hope-905867/
    private var _it = ScrabbleWord(word: "It", partOfSpeech: "noun", definition: "Person touched during a game of tag", image: "https://pixabay.com/static/uploads/photo/2015/04/20/06/29/childrens-730667_960_720.jpg")
    private var _jo = ScrabbleWord(word: "Jo", partOfSpeech: "noun", definition: "Sweetheart, used in Scotland", image: "https://pixabay.com/static/uploads/photo/2016/04/30/21/41/couple-1363993_960_720.jpg")
    private var _ka = ScrabbleWord(word: "Ka", partOfSpeech: "noun", definition: "(Ancient Egypt) Part of the spirit which lived on in a mummified body after death", image: "https://upload.wikimedia.org/wikipedia/commons/5/54/Ka_Statue_of_horawibra.jpg")
    private var _ki = ScrabbleWord(word: "Ki", partOfSpeech: "noun", definition: "A life force in Chinesse medicine which flows throughout the body", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463083636/qiGong_rdsjkq.jpg")
    private var _la = ScrabbleWord(word: "La", partOfSpeech: "noun", definition: "Sixth note in diatonic music scale", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463071393/grandPianoLa_r5fxwb.jpg") //https://pixabay.com/en/piano-midi-music-musical-773735/
    private var _li = ScrabbleWord(word: "Li", partOfSpeech: "noun", definition: "Chinese measurement distance, about .5 km", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463084050/greatWall_gr9xw0.jpg") //https://www.pexels.com/photo/mountains-clouds-historical-great-wall-of-china-19872/
    private var _lo = ScrabbleWord(word: "Lo", partOfSpeech: "interjection", definition: "Said when desiring attention", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463104551/Moses2.2_sspkg4.jpg") //http://digitalcollections.nypl.org/items/510d47da-e720-a3d9-e040-e00a18064a99
    private var _ma = ScrabbleWord(word: "Ma", partOfSpeech: "noun", definition: "Mother", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463105054/mom1_wh3da6.jpg") //https://www.pexels.com/photo/woman-female-girl-child-8986/
    private var _me = ScrabbleWord(word: "Me", partOfSpeech: "pronoun", definition: "Used by a person in reference to themselves", image: "https://pixabay.com/static/uploads/photo/2015/07/14/12/08/penguin-844834_960_720.jpg")
    private var _mi = ScrabbleWord(word: "Mi", partOfSpeech: "noun", definition: "Third note in diatonic music scale", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463071393/grandPianoMi_sby7qy.jpg")
    private var _mm = ScrabbleWord(word: "Mm", partOfSpeech: "interjection", definition: "Used to convey one's approval", image: "https://pixabay.com/static/uploads/photo/2015/11/06/11/52/thumbs-up-1026529_960_720.jpg")
    private var _mo = ScrabbleWord(word: "Mo", partOfSpeech: "noun", definition: "Short amount of time", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463107280/hourGlass_nuffpn.jpg") //https://pixabay.com/en/hourglass-time-pressure-time-708574/
    private var _mu = ScrabbleWord(word: "Mu", partOfSpeech: "noun", definition: "12th letter of the Greek alphabet", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463108457/mu_kp2pke.jpg") //https://commons.wikimedia.org/wiki/File:Mu_uc_lc.svg
    private var _my = ScrabbleWord(word: "My", partOfSpeech: "pronoun", definition: "Possesive I", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463110865/myGirlsDad1_eqrf8b.jpg") //http://digitalcollections.nypl.org/items/510d47df-f072-a3d9-e040-e00a18064a99
    private var _na = ScrabbleWord(word: "Na", partOfSpeech: "determiner", definition: "No", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463111538/thumb_down_mkqps2.jpg") //https://www.pexels.com/photo/hand-thumbs-up-thumb-black-and-white-8252/
    private var _ne = ScrabbleWord(word: "Ne", partOfSpeech: "adjective", definition: "Used before a persons prior name - Marilyn Monroe, ne Norma Mortenson", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463114409/mm2_orsosv.jpg") //https://commons.wikimedia.org/wiki/File:Marilyn_Monroe_photo_pose_Seven_Year_Itch.jpg
    private var _no = ScrabbleWord(word: "No", partOfSpeech: "determiner", definition: "None", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463115045/noHunting_n6xahz.jpg") //https://pixabay.com/en/no-hunting-sign-no-hunting-fence-1110491/
    private var _nu = ScrabbleWord(word: "Nu", partOfSpeech: "noun", definition: "13th letter of the Greek alphabet", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463115226/nu_byhqzx.jpg") //https://commons.wikimedia.org/wiki/File:Nu_uc_lc.svg
    private var _od = ScrabbleWord(word: "Od", partOfSpeech: "noun", definition: "Or Odic force, is a hypothetical force believed to transcend throughout nature", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463116415/od_jm6be5.jpg") //https://pixabay.com/en/star-wars-flower-soldier-dark-1176168/
    private var _oe = ScrabbleWord(word: "Oe", partOfSpeech: "noun", definition: "Winds from the Faroe Islands", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463117776/beachAndWind_f5tels.jpg") //https://pixabay.com/en/crooklets-beach-cornwall-bude-1313636/
    private var _of = ScrabbleWord(word: "Of", partOfSpeech: "preposition", definition: "Indicates something belonging to something else", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463118575/puzzle-654110_1280_s51zu6.jpg") //https://cloudinary.com/console/media_library#/dialog/image/upload/puzzle-654110_1280_s51zu6
    private var _oh = ScrabbleWord(word: "Oh", partOfSpeech: "exclamation", definition: "exclamed during moments of sorrow, happiness, or anger", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463119519/photoOh_qhpfmt.jpg")//https://pixabay.com/en/photographer-man-hands-characters-1210218/
    private var _oi = ScrabbleWord(word: "Oi", partOfSpeech: "exclamation", definition: "said to try and gain a person's attention", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463120179/oi_k5adpu.jpg") //https://www.flickr.com/photos/prblmtkx/22845310843/in/photolist-ANLbZH-uctXYG-ow8ti1-qbNw3e-otvM2c-ornWVj-ouXAsB-obP2U8-oeZbCd-obMVPW-of27Ad-owHJLB-odFGDZ-oc7Jtb-osYxmL-obZ8Pg-ouXTf6-odjQmA-orp4vG-obWjz9-otsmBh-ouWeWh-of2s75-odZsVQ-odZFm1-ovh91m-osYcuw-obw2U2-of27Pu-odueE8-obVozh-ouKMNY-osHE4n-oc8Qhc-odtk3M-otpimJ-oqXMjy-owWeR6-osUR5i-osHoGk-ouKT7y-osPS5u-ovhsbj-ot7LrM-obv6HZ-otcwpP-otoDKj-otha2w-oc8ufv-ouXWAz
    private var _om = ScrabbleWord(word: "Om", partOfSpeech: "noun", definition: "Sound made during meditation", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463120706/meditate_lls9wr.jpg")//https://www.pexels.com/photo/relaxation-relaxing-meditation-yoga-12344/
    private var _on = ScrabbleWord(word: "On", partOfSpeech: "preposition", definition: "In contact with another object", image: "http://res.cloudinary.com/di6su8dza/image/upload/v1463120917/onMountain_ujnmct.jpg")//https://www.pexels.com/photo/mountains-nature-sky-sunny-6629/
    
    
    func getWord() -> [ScrabbleWord]{
        return [_aa, _ab, _ad, _ae, _ag, _ah, _ai, _al, _am, _an, _ar, _as, _at, _aw, _ax, _ay, _ba, _be, _bi, _bo, _by, _de, _do, _ed, _ef, _eh, _el, _em, _en, _er, _es, _et, _ex, _fa, _fe, _fy, _gi, _go, _gu, _ha, _he, _hi, _hm, _ho, _id, _if, _in, _is, _it, _jo, _ka, _ki, _la, _li, _lo, _ma, _me, _mi, _mm, _mo, _mu, _my, _na, _ne, _no, _nu, _od, _oe, _of, _oh, _oi, _om, _on]
        //
    }
}







